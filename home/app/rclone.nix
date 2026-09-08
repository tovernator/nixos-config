{
  config,
  lib,
  pkgs,
  ...
}:

with lib;
let
  cfg = config.tvr.app.rclone;
in
{
  imports = [

  ];

  options = {
    tvr.app.rclone = {
      enable = mkOption {
        type = types.bool;
        default = false;
      };
    };
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [ rclone ];
  };

}
