{
  config,
  lib,
  pkgs,
  ...
}:

with lib;
let
  cfg = config.tvr.app.zed;
in
{
  imports = [

  ];

  options = {
    tvr.app.zed = {
      enable = mkOption {
        type = types.bool;
        default = false;
      };

      extensions = mkOption {
        type = types.listOf types.str;
        default = [ ];
      };

      useNoctaliaTheme = mkOption {
        type = types.bool;
        default = false;
      };
    };
  };

  config = mkIf cfg.enable {
    programs.zed-editor = {
      enable = true;
      extensions = [ ] ++ (if config.tvr.shell.nix.enable then [ "nix" ] else [ ]) ++ cfg.extensions;
      userSettings = { } // {
        theme = (
          if cfg.useNoctaliaTheme then
            {
              mode = "system";
              dark = "Noctalia Dark Transparent";
              light = "Noctalia Light Transparent";
            }
          else
            {
            }
        );
      };
    };

  };

}
