{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [

  ];

  options = {
    tvr.system.boot.enableDualBoot = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };

  config = {
    boot.loader = {

      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };

      grub = {
        enable = true;
        efiSupport = true;
        useOSProber = config.tvr.system.boot.enableDualBoot;
        device = "nodev";
      };
    };
  };

}
