{
  config,
  lib,
  pkgs,
  ...
}:

with lib;
let
  app = config.tvr.app;
  shell = config.tvr.shell;
  useTheme = config.tvr.theme.enable;
in
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

      templates = mkIf useTheme {
        builtin_ids = [
          "niri"
          "gtk3"
          "gtk4"
          "qt"
        ]
        ++ (if shell.helix.enable then [ "helix" ] else [ ])
        ++ (if shell.starship.enable then [ "starship" ] else [ ])
        ++ (if app.alacritty.enable then [ "alacritty" ] else [ ]);
        community_ids = [
        ]
        ++ (if shell.zellij.enable then [ "zellij" ] else [ ])
        ++ (if shell.bat.enable then [ "bat" ] else [ ])
        ++ (if app.zed.enable then [ "zed" ] else [ ])
        ++ (if app.discord.enable then [ "discord" ] else [ ])
        ++ (if app.obsidian.enable then [ "obsidian" ] else [ ]);
      };

    };
  };

}
