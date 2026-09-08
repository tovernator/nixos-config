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
        ++ (if config.tvr.shell.helix.enable then [ "helix" ] else [ ])
        ++ (if config.tvr.shell.starship.enable then [ "starship" ] else [ ])
        ++ (if config.tvr.app.alacritty.enable then [ "alacritty" ] else [ ]);
        community_ids = [
        ]
        ++ (if config.tvr.shell.zellij.enable then [ "zellij" ] else [ ])
        ++ (if config.tvr.shell.bat.enable then [ "bat" ] else [ ])
        ++ (if config.tvr.app.zed.enable then [ "zed" ] else [ ])
        ++ (if config.tvr.app.discord.enable then [ "discord" ] else [ ]);
      };

    };
  };

}
