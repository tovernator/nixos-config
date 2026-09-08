{
  config,
  lib,
  pkgs,
  ...
}:

with lib;
let
  cfg = config.tvr.system.input;
in
{
  imports = [

  ];

  options = {
    tvr.system.input = {
      enable = mkOption {
        type = types.bool;
        default = true;
      };
      enableXkb = mkOption {
        type = types.bool;
        default = false;
      };

    };
  };

  config = mkIf cfg.enable {

    i18n = {
      inputMethod = {
        type = "fcitx5";
        enable = true;
        fcitx5 = {
          waylandFrontend = true;
        };
      };

    };
    services =
      { }
      // (
        if cfg.enableXkb then
          {
            services = {
              xserver = {
                xkb.layout = "us";
                xkbVariant = "workman,";
                xkbOptions = "grp:win_space_toggle";
              };
            };
          }
        else
          { }
      );

  };
}
