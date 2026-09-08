{
  config,
  lib,
  pkgs,
  ...
}:

with lib;
let

  cfg = config.tvr.systen.audio;
in
{
  imports = [

  ];

  options = {
    tvr.systen.audio = {
      enable = mkOption {
        type = types.bool;
        default = true;
      };

      alsa.enable = lib.mkOption {
        type = types.bool;
        default = true;
      };
      pulse.enable = lib.mkOption {
        type = types.bool;
        default = true;
      };
      jack.enable = lib.mkOption {
        type = types.bool;
        default = true;
      };
    };
  };

  config = mkIf cfg.enable {
    services = {
      pipewire = {
        enable = true;
        alsa.enable = cfg.alsa.enable;
        alsa.support32Bit = true;
        pulse.enable = cfg.pulse.enable;
        jack.enable = cfg.jack.enable;
      };
      pulseaudio.enable = false;
    };
    environment.systemPackages = with pkgs; [ ] ++ (if cfg.pulse.enable then [ pulseaudio ] else [ ]);
  };

}
