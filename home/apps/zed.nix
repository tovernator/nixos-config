{
  config,
  lib,
  pkgs,
  ...
}:

with lib;
let
  cfg = config.tvr.apps.zed;
in
{
  imports = [

  ];

  options = {
    tvr.apps.zed = {
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

  config = {
    programs.zed-editor =
      { }
      // (
        if cfg.enable then
          {
            enable = true;
            extensions = [ ] ++ cfg.extensions;
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
          }
        else
          { }
      );
  };

}
