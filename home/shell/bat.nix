{
  config,
  lib,
  pkgs,
  ...
}:

with lib;
let
  cfg = config.tvr.shell;
  opt = tvr.shell;
in
{
  imports = [ ];

  options = {
    tvr.shell = {
      bat = {
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
  };

  config = {
    programs.bat =
      { }
      // (
        if cfg.bat.enable then
          {
            enable = true;
          }
        else
          { }
      )
      // (
        if cfg.bat.enable && cfg.bat.useNoctaliaTheme then
          {
            config.theme = "noctalia";
            themes = {
              file = "noctalia.tmTheme";
            };
          }
        else
          { }
      );

  };

}
