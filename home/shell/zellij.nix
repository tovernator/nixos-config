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
      zellij = {
        enable = mkOption {
          type = types.bool;
          default = false;
        };

        useNoctaliaTheme = mkOption {
          type = types.bool;
          default = false;
        };
      };
    };
  };

  config = {
    programs.zellij =
      { }
      // (
        if cfg.zellij.enable then
          {
            enable = true;
            enableFishIntegration = cfg.fish.enable;
            settings = {
              theme = (if cfg.zellij.useNoctaliaTheme then "noctalia" else "");
              show_startup_tips = false;
            };
          }
        else
          { }
      );
  };

}
