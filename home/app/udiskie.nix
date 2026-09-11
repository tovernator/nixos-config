{
  config,
  lib,
  pkgs,
  ...
}:

with lib;
let
  cfg = config.tvr.app.udiskie;
in
{
  imports = [

  ];

  options = {
    tvr.app.udiskie = {
      enable = mkOption {
        type = types.bool;
        default = false;
      };
    };
  };

  config = mkIf cfg.enable {
    services.udiskie = {
      enable = true;
      package = pkgs.udiskie;
    };


    home.packages = with pkgs; [udiskie];
  };

}
