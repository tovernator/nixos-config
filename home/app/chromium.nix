{
  config,
  lib,
  pkgs,
  ...
}:

with lib;
let
  cfg = config.tvr.app.chromium;
in
{
  imports = [

  ];

  options = {
    tvr.app.chromium = {
      enable = mkOption {
        type = types.bool;
        default = false;
      };

    };
  };

  config = mkIf cfg.enable {

    programs.chromium = {
      enable = true;
      package = pkgs.ungoogled-chromium;
    };

  };

}
