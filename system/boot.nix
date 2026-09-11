{
  config,
  lib,
  pkgs,
  ...
}:

with lib;
let

  cfg = config.tvr.system.boot;
in
{
  imports = [

  ];

  options = {
    tvr.system.boot = {
      enable = mkOption {
        type = types.bool;
        default = true;
      };

      enableDualBoot = mkOption {
        type = types.bool;
        default = true;
      };
    };
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ ] ++ (if cfg.enableDualBoot then [os-prober] else "");
    boot.loader = {
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };
      # grub = {
      #   enable = true;
      #   efiSupport = true;
      #   useOSProber = cfg.enableDualBoot;
      #   device = "nodev";
      # };
      limine = {
        enable = true;
        efiSupport = true;
        extraConfig = "" + (if cfg.enableDualBoot then ''osdiscovery'' else "");
      };
    };
  };

}
