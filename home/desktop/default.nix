{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

{
  imports = [
    ./noctalia.nix
    ./umbriel.nix
  ];

  options = {

  };

  config = mkIf cfg.enable {

  };

}
