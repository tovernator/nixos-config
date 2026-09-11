{
  config,
  lib,
  pkgs,
  ...
}:

with lib;
let

  cfg = config.tvr.shell.fd;
in
{
  imports = [

  ];

  options = {
    tvr.shell.fd = {
      enable = mkOption {
        type = types.bool;
        default = false;
      };
    };
  };

  config = mkIf cfg.enable {
    programs.fd.enable = true;
  };

}
