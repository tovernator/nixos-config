{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
    cfg = config.tvr.game.prismlauncher;
in
{
  imports = [

  ];

  options = {
    tvr.game.prismlauncher = {
      enable = mkOption {
        type = types.bool;
        default = false;
      };
    };
  };

  config = mkIf cfg.enable {
    programs.prismlauncher = {
      enable = true;
    };
  };

}
