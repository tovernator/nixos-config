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
    tvr.system.audio.alsa.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
    tvr.system.audio.pulse.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
    tvr.system.audio.jack.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
  };

  config = {
    services = {
      pipewire = {
        enable = true;
        alsa.enable = config.tvr.system.audio.alsa.enable;
        alsa.support32Bit = true;
        pulse.enable = config.tvr.system.audio.pulse.enable;
        jack.enable = config.tvr.system.audio.jack.enable;
      };
      pulseaudio.enable = false;
    };
    environment.systemPackages = with pkgs; [ pulseaudio ];
  };
}
