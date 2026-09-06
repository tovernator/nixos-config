{
  inputs,
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    inputs.noctalia.homeModules.default

    ./bar.nix
    ./plugins.nix
    ./shell.nix
    ./theme.nix
    ./widgets.nix
  ];

  options = {

  };

  config = {

    programs = {
      noctalia.enable = true;
      noctalia.package = pkgs.noctalia;
    };

    home.packages = with pkgs; [ noctalia ];
  };

}
