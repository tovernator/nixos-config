{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./nix.nix
  ];

  options = {
    tvr.home.dev.nix.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
  };

  config = {

  };

}
