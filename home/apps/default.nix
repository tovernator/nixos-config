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
    ./git.nix
    ./shell.nix
    ./zed.nix
  ];

  options = {

  };

  config = {

  };

}
