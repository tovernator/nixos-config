{
  config,
  lib,
  pkgs,
  defaultUsername,
  inputs,
  ...
}:

{
  imports = [
    inputs.niri.nixosModules.niri
    inputs.noctalia-greeter.nixosModules.default
    inputs.noctalia.nixosModules.default
  ];

  options = {
    tvr.system.desktop.greeter.passwordlessSync = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };


  };

  config = {
    programs = {

      niri = {
        enable = true;
        package = pkgs.niri;
      };


      noctalia-greeter = {
        enable = true;
        package = pkgs.noctalia-greeter;
        settings = {
          appearance = {
            hide_logo = true;
          };
        };
      };

    };

    services = {
      udisks2.enable = true;
      gnome.gnome-keyring.enable = true;
      upower.enable = true;
      power-profiles-daemon.enable = true;
    };

    environment.systemPackages = with pkgs; [
      niri
      noctalia-greeter
      libsecret

    ];
  };

}
