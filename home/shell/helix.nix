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
      helix = {
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
    programs.helix =
      { }
      // (
        if cfg.helix.enable then
          {
            enable = true;
            settings = {
              theme = (if cfg.helix.useNoctaliaTheme then "noctalia" else "");
            };
          }
        else
          { }
      );
  };

}
