{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./app
    ./niri
    ./noctalia
    ./shell
  ];

  options = { };

  config = { };

}
