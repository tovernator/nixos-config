{
  config,
  lib,
  pkgs,
  ...
}:

with lib;
let
  cfg = config.tvr.shell.protonvpn;
in
{
  imports = [ ];

  options = {
    tvr.shell.protonvpn = {
      enable = mkOption {
        type = types.bool;
        default = false;
      };
    };
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [proton-vpn-cli];
  };

}
