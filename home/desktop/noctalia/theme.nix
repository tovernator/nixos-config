{
  ...
}:
{
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
      ];
      community_ids = [
        "bat"
        "zellij"
        "zed"
      ];
    };

  };
}
