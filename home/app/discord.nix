{
  config,
  lib,
  pkgs,
  ...
}:

with lib;
let

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
      useNoctaliaTheme = mkOption {
        type = types.bool;
        default = false;
      };
    };

  };

  config = mkIf cfg.enable {
    programs.equibop = {
      enable = true;
      equicord.settings =
        { }
        // (if cfg.useNoctaliaTheme then { enabledThemes = [ "noctalia-material.theme.css" ]; } else { });
    };
  };

}
