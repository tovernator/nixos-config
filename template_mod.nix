{
  config,
  lib,
  pkgs,
  ...
}:

with lib;
let

  cfg = config.TEMPLATE;
in
{
  imports = [

  ];

  options = {
    TEMPLATE = {
      enable = mkOption {
        type = types.bool;
        default = false;
      };
    };
  };

  config = mkIf cfg.enable {

  };

}
