{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./apps
    ./niri
    ./noctalia
    ./shell
  ];

  options = { };

  config = { };

}
