{
  config,
  lib,
  pkgs,
  ...
}:

with lib;
let
  cfg = config.tvr.shell.git;



in
{
  imports = [ ];

  options = {
    tvr.shell.git = {
      enable = mkOption {
        type = types.bool;
        default = false;
      };

      enableLazyGit = mkOption {
        type = types.bool;
        default = false;
      };

      userName = mkOption {
        type = types.str;
        default = "";
      };

      userEmail = mkOption {
        type = types.str;
        default = "";
      };

      defaultBranch = mkOption {
        type = types.str;
        default = "";
      };
    };

  };

  config = mkIf cfg.enable {
    programs.git = {
      enable = true;
      settings = {
        user = {
          name = cfg.userName;
          email = cfg.userEmail;
        };
        init.defaultBranch = cfg.defaultBranch;
        merge.ours.driver = true;
      };

    };

    programs.lazygit = mkIf cfg.enableLazyGit { enable = true;

    };

  };

}
