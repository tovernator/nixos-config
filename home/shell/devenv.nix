{
  config,
  lib,
  pkgs,
  ...
}:

with lib;
let

  cfg = config.tvr.shell.devenv;
in
{
  imports = [

  ];

  options = {
    tvr.shell.devenv = {
      enable = mkOption {
        type = types.bool;
        default = false;
      };
    };
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [ devenv ];
  };

}
