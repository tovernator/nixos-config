{
  config,
  lib,
  pkgs,
  ...
}:

with lib;
let
  cfg = config.tvr.apps.keepassxc;
in
{
  imports = [

  ];

  options = {
    tvr.apps.keepassxc = {
      enable = mkOption {
        type = types.bool;
        default = false;
      };
    };
  };

  config = {
    programs.keepassxc = { } // (if cfg.enable then { enable = true; } else { });
  };

}
