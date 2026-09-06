{
  pkgs,
  inputs,
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

  programs = {
    noctalia.enable = true;
  };

}
