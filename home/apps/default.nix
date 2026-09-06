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

  ];

  options = {

  };

  config = {

  };

}
