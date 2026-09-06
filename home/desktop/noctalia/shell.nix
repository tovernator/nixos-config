{
  ...
}:
{
  programs.noctalia.settings.shell = {

    setup_wizard_enabled = false;
    niri_overview_type_to_launch_enabled = true;
    greeter_sync.auto_sync = true;
    polkit_agent = true;
    session.grid = true;
    launcher.app_grid = true;

    panel = {
      clipboard_position = "auto";

      control_center_placement = "floating";

      launcher_placement = "attached";
      launcher_position = "auto";

      open_near_click_clipboard = true;
      open_near_click_control_center = true;
      open_near_click_wallpaper = true;

      polkit_position = "auto";

      wallpaper_placement = "attached";
    };

  };
}
