{
  ...
}:
{
  programs.noctalia.settings = {

    programs.noctalia.settings.bar.order = [
      "main"
      "sub"
    ];

    programs.noctalia.settings.bar.main.capsule_group = [
      {
        id = "common";
        enabled = true;
        accordion = false;
        padding = 10;

        members = [
          "network"
          "bluetooth"
          "audio-switcher"
          "brightness"
          "battery"
        ];
      }

      {
        id = "main";
        enabled = true;
        accordion = true;
        accordion_direction = "end";
        padding = 10;

        members = [
          "launcher"
          "control-center"
          "keybinds"
        ];
      }
    ];

    programs.noctalia.settings.bar.main = {
      enabled = true;
      position = "top";
      smart_auto_hide = false;
      layer = "top";
      padding = 16;
      thickness = 32;
      widget_spacing = 10;
    };

    programs.noctalia.settings.bar.main = {

      start = [
        "group:main"
        "workspaces"
      ];

      center = [
        "clock"
        "privacy"
      ];

      end = [
        "tray"
        "notifications"
        "clipboard"
        "group:common"
        "session"
      ];

    };

    programs.noctalia.settings.bar.sub = {
      enabled = true;
      position = "bottom";
      smart_auto_hide = true;
      layer = "top";
      reserve_space = false;
      margin_ends = 400;
      padding = 16;
      thickness = 32;
      widget_spacing = 10;
    };

    programs.noctalia.settings.bar.sub.capsule_group = [
      {
        id = "wallpaper-group";
        members = [
          "wallpaper"
          "wallhaven"
        ];
        fill = "surface_variant";
        padding = 6.0;
        widget_spacing = 5;
        accordion = true;
        accordion_direction = "end";
      }
    ];

    programs.noctalia.settings.bar.sub = {
      start = [
        "procmon"
        "displays"
      ];
      center = [ ];
      end = [
        "group:wallpaper-group"

      ];
    };
  };
}
