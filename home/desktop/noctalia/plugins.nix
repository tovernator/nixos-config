{
  ...
}:
{
  programs.noctalia.settings = {

    source = [
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

    enabled = [
      "noctalia/wallhaven"
      "kenn/keybind-cheatsheet"
      "weinguyen/procmon"
      "raycursive/niri-displays"
      "piero-93/battery-power-management"
      "blackbartblues/audio-switcher"
    ];

    plugin_settings = {

      "kenn/keybind-cheatsheet" = {
        cheatsheet_position = "auto";
      };

      "blackbartblues/audio-switcher" = {
        show_percentage = false;
      };

      "piero-93/battery-power-management" = {
        show_balanced_icon = true;
      };

    };

  };
}
