{
  config,
  lib,
  pkgs,
  ...
}:

with lib;
let
  useTheme = config.tvr.theme.enable;
  cfg = config.tvr.app.obsidian;
in
{
  imports = [

  ];

  options = {
    tvr.app.obsidian = {
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
    programs.obsidian = {
      enable = true;
      defaultSettings = {
        # themes."noctalia" = mkIf useTheme {
        #   enable = true;
        # };
      };
      vaults = {
        documents = {
          settings = {
            app = config.programs.obsidian.defaultSettings.app;
          };
          target = "./Documents";
        };
      };
    };
  };

}
