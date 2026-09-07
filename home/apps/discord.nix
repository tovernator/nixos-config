{
  config,
  lib,
  pkgs,
  ...
}:

with lib;
let
  cfg = config.tvr.apps.discord;
in
{
  imports = [

  ];

  options = {
    tvr.apps.discord = {
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

  config = {
    programs.equibop =
      { }
      // (
        if cfg.enable then
          {
            enable = true;
            equicord.settings =
              { }
              // (if cfg.useNoctaliaTheme then { enabledThemes = [ "noctalia-material.theme.css" ]; } else { });

          }
        else
          { }
      );
  };

}
