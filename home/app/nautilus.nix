{
  config,
  lib,
  pkgs,
  ...
}:

with lib;
let
  cfg = config.tvr.app.nautilus;
in
{
  imports = [

  ];

  options = {
    tvr.app.nautilus = {
      enable = mkOption {
        type = types.bool;
        default = false;
      };
    };
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [nautilus];
  };

}
