{
  config,
  lib,
  pkgs,
  ...
}:

with lib;
let

  cfg = config.tvr.system.security;
in
{
  imports = [

  ];

  options = {
    tvr.system.security = {
      enable = mkOption {
        type = types.bool;
        default = true;
      };
    };
  };

  config = mkIf cfg.enable {
    security.polkit.enable = true;
    services = {
      gnome.gnome-keyring.enable = true;
    };

    environment.systemPackages = with pkgs; [
      libsecret
      mtpfs
    ];
  };

}
