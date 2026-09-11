{

  lib,

  ...
}:
with lib;

{
  imports = [
    ./app
    ./desktop
    ./game
    ./shell

  ];

  options = {
    tvr.theme = {
      enable = mkOption {
        type = types.bool;
        default = true;
      };
    };
  };

  config = { };

}
