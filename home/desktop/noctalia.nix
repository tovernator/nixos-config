{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:

with lib;
let

  cfg = config.tvr.desktop.noctalia;
  app = config.tvr.app;
  shell = config.tvr.shell;
  game = config.tvr.game;
  useTheme = config.tvr.theme.enable;
in
{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  options = {
    tvr.desktop.noctalia = {
      enable = mkOption {
        type = types.bool;
        default = true;
      };
    };
  };

  config = mkIf cfg.enable {

    programs.noctalia = {
      enable = true;
      package = pkgs.noctalia;
      settings = {
        shell = {
          setup_wizard_enable = false;
          niri_overview_type_to_launch_enable = true;
          greeter_sync.auto_sync = false;
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
        theme = {
          mode = "dark";
          source = "wallpaper";
          wallpaper_scheme = "faithful";

          templates = mkIf useTheme {
            builtin_ids = [
              "umbriel"
              "gtk3"
              "gtk4"
              "qt"

            ]

            ++ (if shell.helix.enable then [ "helix" ] else [ ])
            ++ (if shell.starship.enable then [ "starship" ] else [ ])
            ++ (if app.alacritty.enable then [ "alacritty" ] else [ ]);

            community_ids = [
              "papirus-icons"
            ]
            ++ (if shell.zellij.enable then [ "zellij" ] else [ ])
            ++ (if shell.bat.enable then [ "bat" ] else [ ])
            ++ (if app.zed.enable then [ "zed" ] else [ ])
            ++ (if app.discord.enable then [ "discord" ] else [ ])
            ++ (if app.obsidian.enable then [ "obsidian" ] else [ ])
            ++ (if game.prismlauncher.enable then [ "prismlauncher" ] else [ ])
            ++ (if app.firefox.enable then [ "zathura" ] else [ ])
          ++ (if app.firefox.enable then [ "pywalfox-beta4" ] else [ ]);
          };
        };
        widget = {

          brightness = {
            show_label = false;
          };

          disks = {
            type = "aristides/udiskie:status";
            show_count = false;
          };

          companion = {
            type = "noctalia/umbriel-companion:bar";
          };

          displays = {
             type = "prponkshe/umbriel-displays:bar";
          };

          privacy = {
            hide_inactive = true;
          };

          wallhaven = {
            type = "noctalia/wallhaven:wallhaven";
          };

          network = {
            show_label = false;
          };

          volume = {
            show_label = false;
          };

          tray = {
            drawer = true;
          };

          battery = {
            show_label = false;
          };

          control-center = {
            glyph = "settings";
          };

          launcher = {
            glyph = "cat";
          };

          procmon = {
            type = "weinguyen/procmon:widget";
            icon_only = true;
            show_count = false;
          };

          audio-switcher = {
            type = "blackbartblues/audio-switcher:widget";
          };
        };
        plugins = {
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
            "weinguyen/procmon"
            "blackbartblues/audio-switcher"
            "aristides/udiskie"
            "noctalia/umbriel-companion"
            "prponkshe/umbriel-displays"
          ];

        };
        plugin_settings = {

          "noctalia/wallhaven" = {
            browser_placement = "floating";
          };

          "weinguyen/procmon" = {
            panel_open_near_click = true;
            panel_placement = "floating";
            panel_position = "auto";
          };

          "noctalia/umbriel-companion" = {
             panel_placement = "floating";
          };
          "blackbartblues/audio-switcher" = {
            show_percentage = false;
            audio-switcher_open_near_click = false;
          };
          "prponkshe/umbriel-displays" = {
            panel_placement = "floating";
          };
          "aristides/udiskie"= {
            manager_open_near_click = true;
          };
        };
        bar = {
          order = [
            "main"
            "sub"
          ];
          main = {
            enabled = true;
            position = "top";
            smart_auto_hide = false;
            layer = "top";
            padding = 16;
            thickness = 32;
            widget_spacing = 10;

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

            capsule_group = [
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
                ];
              }
            ];

          };
          sub = {
            enabled = true;
            position = "bottom";
            smart_auto_hide = true;
            layer = "top";
            reserve_space = false;
            margin_ends = 400;
            padding = 16;
            thickness = 32;
            widget_spacing = 10;

            start = [
              "procmon"
              "disks"
              "displays"
              "companion"
            ];
            center = [ ];
            end = [
              "group:wallpaper-group"
            ];

            capsule_group = [
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

          };
        };

      };

    };

    home.sessionVariables = mkIf useTheme {
      QT_QPA_PLATFORMTHEME = "qt6ct";
    };

    dconf.settings = mkIf useTheme {
      "org/gnome/desktop/interface" = {
        gtk-theme = "adw-gtk3";
      };
    };

    home.packages = with pkgs; [ noctalia adw-gtk3 ] ++ (if useTheme then [adw-gtk3 kdePackages.qt6ct] else []);

  };

}
