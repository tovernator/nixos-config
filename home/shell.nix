{
  pkgs,
  ...
}:
{

  programs = {
    fish = {
      enable = true;
      interactiveShellInit = ''
        set fish_greeting # Disable greeting
      '';
    };

    alacritty = {
      enable = true;
      settings = {
        general.import = [ "~/.config/alacritty/themes/noctalia.toml" ];
        window = {
          opacity = 0.9;
          padding.x = 20;
          padding.y = 20;
          dynamic_padding = true;
        };
      };
    };

    helix = {
      enable = true;
      settings = {
        theme = "noctalia";
      };
    };

    bat = {
      enable = true;
      config.theme = "noctalia";
      themes = {
        file = "noctalia.tmTheme";
      };
    };

    eza = {
      enable = true;
      enableFishIntegration = true;
    };

    starship = {
      enable = true;
      enableFishIntegration = true;
      presets = [ "jetpack" ];
    };

    zellij = {
      enable = true;
      enableFishIntegration = true;
      settings = {
        theme = "noctalia";
        show_startup_tips = false;
      };
    };

  };

}
