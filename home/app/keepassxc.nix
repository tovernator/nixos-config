{
  config,
  lib,
  pkgs,
  ...
}:

with lib;
let

  cfg = config.tvr.app.keepassxc;
in
{
  imports = [

  ];

  options = {
    tvr.app.keepassxc = {
      enable = mkOption {
        type = types.bool;
        default = false;
      };
    };
  };

  config = mkIf cfg.enable {
    programs.keepassxc = {
      enable = true;
    };
  };

}
