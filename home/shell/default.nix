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
    ./fd.nix
    ./fish.nix
    ./git.nix
    ./helix.nix
    ./protonvpn.nix
    ./nix.nix
    ./starship.nix
    ./zellij.nix
  ];

  options = { };

  config = { };

}
