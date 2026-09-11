{

  lib,

  ...
}:
with lib;

{
  imports = [
    ./app
    # ./niri
    # ./noctalia
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
