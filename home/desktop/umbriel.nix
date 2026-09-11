{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:

with lib;
let

  cfg = config.tvr.desktop.umbriel;
in
{
  imports = [
    inputs.umbriel.homeModules.default
  ];

  options = {
    tvr.desktop.umbriel = {
      enable = mkOption {
        type = types.bool;
        default = true;
      };
    };
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [ xwayland-satellite ];
    programs.umbriel = {
      enable = true;
      settings = {
        general = {
          autostart = [ ];
          xwayland = true;
          show_cheatsheet = false;
        };
        include.optional.files = ["noctalia.toml"];

        appearance = {
          prefer_no_csd = true;
          border_width = 2;                                # Inner border width, 0-100 logical pixels
          outer_border_width = 0;                          # Optional outer ring, 0-100 logical pixels
          corner_radius = 10;                              # Radius of the final decorated edge, 0-100
          drag_opacity = 0.75;
        };


        keybinds = {
          "Mod" = "spawn:noctalia msg panel-toggle launcher";
          "Mod+Comma" = "spawn:noctalia msg settings-toggle";
          "Mod+Z" = "spawn:noctalia msg panel-toggle launcher /emo";
          "Mod+V" = "spawn:noctalia msg panel-toggle clipboard";
          "Mod+W" = "spawn:noctalia msg panel-toggle wallpaper";
          "Mod+N" = "spawn:noctalia msg panel-toggle noctalia/notes:panel";
          "Mod+X" = "spawn:noctalia msg bar-toggle";
          "Mod+P" = "spawn:noctalia msg screenshot-region";

          "Mod+Return" = "spawn:alacritty";
          "Mod+B" = "spawn:firefox --new-window";
          "Mod+Shift+B" = "spawn:firefox --private-window";
          "Mod+E" = "spawn:nautilus";
          "Mod+H" = "cheatsheet-toggle";

          "Mod+Shift+P" = "spawn:noctalia msg screenshot-fullscreen";
          "Mod+Shift+A" = "spawn:noctalia msg screenshot-annotate";
          "Mod+Ctrl+A" = "spawn:noctalia msg annotate";
          "Mod+Shift+W" = "spawn:noctalia msg desktop-widgets-toggle-edit";
          "Mod+Escape" = "spawn:noctalia msg panel-toggle session";

          "XF86AudioRaiseVolume"  = "spawn:noctalia msg volume-up";
          "XF86AudioLowerVolume"   = "spawn:noctalia msg volume-down";
          "XF86AudioMute"         = "spawn:noctalia msg volume-mute";
          "XF86MonBrightnessUp" = "spawn:noctalia msg brightness-up";
          "XF86MonBrightnessDown" = "spawn:noctalia msg volume-down";

          "Mod+Left" = "window-focus-left";
          "Mod+Right" = "window-focus-right";
          "Mod+Up" = "window-focus-or-workspace-up";
          "Mod+Down" = "window-focus-or-workspace-down";
          "Mod+Shift+Left" = "column-move-left";
          "Mod+Shift+Right" = "column-move-right";
          "Mod+Shift+Up" = "window-move-or-workspace-up";
          "Mod+Shift+Down" = "window-move-or-workspace-down";
          "Mod+Ctrl+Left" = "window-move-to-output-left";
          "Mod+Ctrl+Right" = "window-move-to-output-right";

          "Mod+F" = "window-toggle-fullscreen"; # Exit restores the previous layout size immediately
          "Mod+M" = "window-toggle-maximize";
          "Mod+Equal" = "window-cycle-width";
          "Mod+Minus" = "window-cycle-width-back";
          "Mod+O" = { action = "overview-toggle"; repeat = false; };

          "Mod+WheelUp" = "window-focus-left";
          "Mod+WheelDown" = "window-focus-right";
          # Workspaces. Bare digits are positions on the output under the pointer.
          "Mod+1" = "workspace-switch:1";
          "Mod+2" = "workspace-switch:2";
          "Mod+3" = "workspace-switch:3";
          "Mod+4" = "workspace-switch:4";
          "Mod+5" = "workspace-switch:5";
          "Mod+6" = "workspace-switch:6";
          "Mod+7" = "workspace-switch:7";
          "Mod+8" = "workspace-switch:8";
          "Mod+9" = "workspace-switch:9";
          "Mod+Shift+1" = "window-move-to-workspace:1";
          "Mod+Shift+2" = "window-move-to-workspace:2";
          "Mod+Shift+3" = "window-move-to-workspace:3";
          "Mod+Shift+4" = "window-move-to-workspace:4";
          "Mod+Shift+5" = "window-move-to-workspace:5";
          "Mod+Shift+6" = "window-move-to-workspace:6";
          "Mod+Shift+7" = "window-move-to-workspace:7";
          "Mod+Shift+8" = "window-move-to-workspace:8";
          "Mod+Shift+9" = "window-move-to-workspace:9";

          "Mod+Q" = "window-close";
        };
        layout = {
          mode = "scrolling"; # scrolling, dwindle, or master
          gap = 8; # Logical pixels between tiles, 0-500
          width_presets = [
            0.333
            0.5
            0.667
          ];
          scrolling = {
            default_width_fraction = 0.5; # Initial width for new columns, 0.1-1.0
            center_underfull_strip = true; # Center a strip narrower than the viewport
            center_focused = "never";
          };

        };


        window_rule = [
          {
            blur = true;
            blur_optimized = true;
          }
          {
            match.app_id = "^dev.noctalia.Noctalia$";
            default_floating = true;
            default_size = [
              1020
              900
            ];
          }
        ];
      };
    };
  };

}
