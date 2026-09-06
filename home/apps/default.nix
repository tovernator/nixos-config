{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./creds
    ./firefox
    ./shell.nix
    ./dev.nix

    ./social.nix

  ];

  options = {

  };

  config = {

  };

}
