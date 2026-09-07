{
  config,
  lib,
  pkgs,
  ...
}:

with lib;
let
  cfg = config.tvr.apps.udiskie;
in
{
  imports = [

  ];

  options = {
    tvr.apps.udiskie = {
      enable = mkOption {
        type = types.bool;
        default = false;
      };
    };
  };

  config = {
    services.udiskie = {} // (if cfg.enable then { enable = true; } else {});
  };

}
