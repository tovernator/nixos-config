{
  config,
  lib,
  pkgs,
  ...
}:

with lib;
let
  cfg = config.tvr.apps.rclone;
in
{
  imports = [

  ];

  options = {
    tvr.apps.rclone = {
      enable = mkOption {
        type = types.bool;
        default = false;
      };
    };
  };

  config = {
    home.packages = with pkgs; [ ] ++ (if cfg.enable then [ "rclone" ] else [ ]);
  };

}
