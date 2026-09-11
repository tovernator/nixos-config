{
  config,
  lib,
  pkgs,
  ...
}:

with lib;
let
  cfg = config.tvr.app.alacritty;
  useTheme = config.tvr.theme.enable;
in
{
  imports = [

  ];

  options = {
    tvr.app.alacritty = {
      enable = mkOption {
        type = types.bool;
        default = false;
      };
    };
  };

  config = mkIf cfg.enable {
    programs.alacritty = {
      enable = true;
      settings = {
        window = {
          opacity = 0.9;
          padding.x = 20;
          padding.y = 20;
          dynamic_padding = true;
        };
      }
      // (if useTheme then { general.import = [ "~/.config/alacritty/themes/noctalia.toml" ]; } else { });
    };
  };
}
