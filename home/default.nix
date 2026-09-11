{

  lib,

  ...
}:
with lib;

{
  imports = [
    ./app
    ./desktop
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
