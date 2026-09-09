{
  config,
  lib,
  pkgs,
  ...
}:

with lib;
let
  cfg = config.tvr.shell.zellij;

in
{
  imports = [ ];

  options = {
    tvr.shell.zellij = {
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

  config = mkIf cfg.enable {
    programs.zellij = {
      enable = true;
      enableFishIntegration = config.tvr.shell.fish.enable;
      settings = {
        theme = (if cfg.useNoctaliaTheme then "noctalia" else "");
        show_startup_tips = false;
      };
    };
  };

}
