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

  };

  config = {
    programs.noctalia.settings.theme = {

      mode = "dark";
      source = "wallpaper";
      wallpaper_scheme = "faithful";

      templates = {
        builtin_ids = [
          "alacritty"
          "helix"
          "niri"
          "starship"
          "gtk3"
          "gtk4"
          "qt"
        ]
        ++ (if config.tvr.home.shell.helix.enable then [ "helix" ] else [ ])
        ++ (if config.tvr.home.shell.starship.enable then [ "starship" ] else [ ]);
        community_ids = [
        ]
        ++ (if config.tvr.home.shell.zellij.enable then [ "zellij" ] else [ ])
        ++ (if config.tvr.home.shell.bat.enable then [ "bat" ] else [ ])
        ++ (if config.tvr.home.apps.zed-editor.enable then [ "zed" ] else [ ])
        ++ (if config.tvr.home.apps.discord.enable then [ "discord" ] else [ ]);
      };

    };
  };

}
