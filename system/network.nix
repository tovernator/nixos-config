{
  config,
  lib,
  pkgs,
  ...
}:

with lib;
let

  cfg = config.tvr.system.network;
in
{
  imports = [

  ];

  options = {
    tvr.system.network = {
      enable = mkOption {
        type = types.bool;
        default = true;
      };
      wifi.enableIwd = mkOption {
        type = types.bool;
        default = false;
      };
      bluetooth.enable = mkOption {
        type = types.bool;
        default = true;
      };
    };
  };

  config = mkIf cfg.enable {
    networking = {
      networkmanager.enable = true;
    }
    // (
      if cfg.wifi.enableIwd then
        {
          wireless.iwd.enable = true;
          networkmanager.wifi.backend = "iwd";
        }
      else
        { }
    );
    hardware.bluetooth.enable = cfg.bluetooth.enable;

  };

}
