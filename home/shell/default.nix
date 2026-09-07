{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./bat.nix
    ./eza.nix
    ./fish.nix
    ./git.nix
    ./helix.nix
    ./starship.nix
    ./zellij.nix
  ];

  options = { };

  config = { };

}
