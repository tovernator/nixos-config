{
  config,
  lib,
  pkgs,
  ...
}:

with lib;
let
  cfg = config.tvr.shell.starship;

in
{
  imports = [ ];

  options = {
    tvr.shell.starship = {
      enable = mkOption {
        type = types.bool;
        default = false;
      };

      preset = mkOption {
        type = types.str;
        default = "jetpack";
      };
    };

  };

  config = mkIf cfg.enable {
    programs.starship = {
      enable = true;
      enableFishIntegration = config.tvr.shell.fish.enable;
      presets = [ cfg.preset ];
    };
  };

}
