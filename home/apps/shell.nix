{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [

  ];

  options = {
    tvr.home.shell.fish.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
    tvr.home.shell.helix.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };

    tvr.home.shell.bat.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };

    tvr.home.shell.eza.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };

    tvr.home.shell.starship.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };

    tvr.home.shell.zellij.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };

  };

  config = {
    programs = {
      fish = (
        if true then
          {
            enable = true;
            interactiveShellInit = ''
              set fish_greeting # Disable greeting
            '';
          }
        else
          {
            enable = false;
          }
      );

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

      helix = (
        if config.tvr.home.shell.helix.enable == true then
          {
            enable = true;
            settings = {
              theme = "noctalia";
            };
          }
        else
          {
            enable = false;
          }
      );

      bat = (
        if config.tvr.home.shell.bat.enable == true then
          {
            enable = true;
            config.theme = "noctalia";
            themes = {
              file = "noctalia.tmTheme";
            };
          }
        else
          {
            enable = false;
          }
      );
      eza = (
        if config.tvr.home.shell.eza.enable == true then
          {
            enable = true;
            enableFishIntegration = config.tvr.home.shell.fish.enable;
          }
        else
          {
            enable = false;
          }
      );

      starship = (
        if config.tvr.home.shell.starship.enable == true then
          {
            enable = true;
            enableFishIntegration = config.tvr.home.shell.fish.enable;
            presets = [ "jetpack" ];
          }
        else
          {
            enable = false;
          }
      );

      zellij = (
        if config.tvr.home.shell.zellij.enable == true then
          {
            enable = true;
            enableFishIntegration = config.tvr.home.shell.fish.enable;
            settings = {
              theme = "noctalia";
              show_startup_tips = false;
            };
          }
        else
          {
            enable = false;
          }
      );

    };
  };

}
