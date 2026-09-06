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

  };

  config = {
    security.polkit.enable = true;
    services = {
      gnome.gnome-keyring.enable = true;

    };

    environment.systemPackages = with pkgs; [
      libsecret
    ];

  };

}
