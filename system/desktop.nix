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
        passwordless-sync-users =
          [ ]
          ++ (
            if config.tvr.system.desktop.greeter.passwordlessSync == true then [ "${defaultUsername}" ] else [ ]
          );
        settings = {
          appearance = {
            hide_logo = true;
          };
        };
      };

    };

    services = {
      greetd.enable = true;
      udisks2.enable = true;
    };

    environment.systemPackages = with pkgs; [
      niri
      noctalia-greeter
    ];
  };

}
