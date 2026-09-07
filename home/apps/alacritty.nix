{
  config,
  lib,
  pkgs,
  ...
}:

with lib;
let
  cfg = config.tvr.apps.alacritty;
in
{
  imports = [

  ];

  options = {
    tvr.apps.alacritty = {
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

  config = {
    programs.alacritty =
      { }
      // (
        if cfg.enable then
          {
            enable = true;

            settings = {
              window = {
                opacity = 0.9;
                padding.x = 20;
                padding.y = 20;
                dynamic_padding = true;
              };
            }
            // (
              if cfg.useNoctaliaTheme then
                { general.import = [ "~/.config/alacritty/themes/noctalia.toml" ]; }
              else
                { }
            );
          }
        else
          { }
      );

  };

}
