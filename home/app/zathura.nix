{
  config,
  lib,
  pkgs,
  ...
}:

with lib;
let
  cfg = config.tvr.app.zathura;
  useTheme = config.tvr.theme.enable;
in
{
  imports = [

  ];

  options = {
    tvr.app.zathura = {
      enable = mkOption {
        type = types.bool;
        default = false;
      };
    };
  };

  config = mkIf cfg.enable {
    programs.zathura = {
      enable = true;
      extraConfig = mkIf useTheme
      ''
        include noctaliarc
      '';
    };


  };

}
