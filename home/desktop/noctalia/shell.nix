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

      control_center_placement = "attached";
      open_near_click_control_center = false;

      launcher_placement = "attached";
      polkit_placement = "attached";

      clipboard_placement = "attached";
      open_near_click_clipboard = false;

      wallpaper_placement = "floating";
      wallpaper_position = "follow_bar";
    };

  };
}
