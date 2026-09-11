{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let

  cfg = config.tvr.theme;
in
{
  imports = [
    ./app
    ./niri
    ./noctalia
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
