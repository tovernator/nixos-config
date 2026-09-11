{
  config,
  lib,
  pkgs,
  ...
}:

with lib;
let

  cfg = config.tvr.system.gpu;
in
{
  imports = [

  ];

  options = {
    tvr.system.gpu = {
      enable = mkOption {
        type = types.bool;
        default = false;
      };
    };
  };

  config = mkIf cfg.enable {
    hardware.nvidia = {
      package = config.boot.kernelPackages.nvidiaPackages.stable;
      modesetting.enable = true;
      powerManagement.enable = false;
      open = true;
      nvidiaSettings =  true;
    };

  };

}
