{
  config,
  lib,
  pkgs,
  ...
}:

with lib;
let
  cfg = config.tvr.shell.helix;

in
{
  imports = [ ];

  options = {
    tvr.shell.helix = {
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
    programs.helix = {
      enable = true;
      settings = {
        theme = (if cfg.useNoctaliaTheme then "noctalia" else "");
      };
    };
  };

}
