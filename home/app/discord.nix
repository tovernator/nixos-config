{
  config,
  lib,
  pkgs,
  ...
}:

with lib;
let
  useTheme = config.tvr.theme.enable;
  cfg = config.tvr.app.discord;
in
{
  imports = [

  ];

  options = {
    tvr.app.discord = {
      enable = mkOption {
        type = types.bool;
        default = false;
      };

    };

  };

  config = mkIf cfg.enable {
    programs.equibop = {
      enable = true;
      equicord.settings =
        { } // (if useTheme then { enabledThemes = [ "noctalia-material.theme.css" ]; } else { });
    };
  };

}
