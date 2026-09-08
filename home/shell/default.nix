{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./bat.nix
    ./devenv.nix
    ./eza.nix
    ./fish.nix
    ./git.nix
    ./helix.nix
    ./nix.nix
    ./starship.nix
    ./zellij.nix
  ];

  options = { };

  config = { };

}
