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
      eza.enable = mkOption {
        type = types.bool;
        default = false;
      };
    };
  };

  config = {
    programs.eza =
      { }
      // (
        if cfg.eza.enable then
          {
            enable = true;
            enableFishIntegration = cfg.fish.enable;
          }
        else
          { }
      );
  };

}
