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
    services.upower.enable = true;
    services.power-profiles-daemon.enable = true;
  };

}
