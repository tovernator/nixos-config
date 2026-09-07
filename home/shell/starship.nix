{
  config,
  lib,
  pkgs,
  ...
}:

with lib;
let
  cfg = config.tvr.shell;
  opt = tvr.shell;
in
{
  imports = [ ];

  options = {
    tvr.shell = {
      starship.enable = mkOption {
        type = types.bool;
        default = false;
      };

      starship.preset = mkOption {
        type = types.str;
        default = "jetpack";
      };
    };
  };

  config = {
    programs.starship =
      { }
      // (
        if cfg.starship.enable then
          {
            enable = true;
            enableFishIntegration = cfg.fish.enable;
            presets = [ cfg.starship.preset ];
          }
        else
          { }
      );
  };

}
