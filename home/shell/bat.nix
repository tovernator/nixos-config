{
  config,
  lib,
  pkgs,
  ...
}:

with lib;
let
  cfg = config.tvr.shell.bat;
in
{
  imports = [ ];

  options = {
    tvr.shell.bat = {
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
    programs.bat = {
      enable = true;
    }
    // (
      if cfg.useNoctaliaTheme then
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
