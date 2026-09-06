{
  ...
}:
{
  programs.noctalia.settings.plugins.source = [
    {
      name = "official";
      kind = "git";
      location = "https://github.com/noctalia-dev/official-plugins";
      enabled = true;
      auto_update = true;
    }

    {
      name = "community";
      kind = "git";
      location = "https://github.com/noctalia-dev/community-plugins";
      enabled = true;
      auto_update = true;
    }
  ];

  programs.noctalia.settings.plugins = {
    enabled = [
      "noctalia/wallhaven"
      "kenn/keybind-cheatsheet"
      "weinguyen/procmon"
      "raycursive/niri-displays"
      "blackbartblues/audio-switcher"
    ];

  };

  programs.noctalia.settings.plugin_settings = {

    "kenn/keybind-cheatsheet" = {
      cheatsheet_open_near_click = false;
      cheatsheet_placement = "attached";
    };

    "raycursive/niri-displays" = {
      panel_open_near_click = false;
    };

    "weinguyen/procmon" = {
      panel_open_near_click = false;
      panel_placement = "attached";
    };

    "blackbartblues/audio-switcher" = {
      show_percentage = false;
      audio-switcher_open_near_click = false;
    };

  };
}
