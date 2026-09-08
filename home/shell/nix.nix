{
  config,
  lib,
  pkgs,
  ...
}:

with lib;
let

  cfg = config.tvr.shell.nix;
in
{
  imports = [

  ];

  options = {
    tvr.shell.nix = {
      enable = mkOption {
        type = types.bool;
        default = false;
      };
    };
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [nil nixd];
  };

}
