{
  config,
  lib,
  pkgs,
  ...
}:

with lib;
let
  cfg = config.tvr.shell;

in
{
  imports = [ ];

  options = {
    tvr.shell = {

      git = {
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
  };

  config = {
    programs.git =
      { }
      // (
        if cfg.git.enable then
          {
            enable = true;
            settings = {
              user = {
                name = cfg.git.userName;
                email = cfg.git.userEmail;
              };
              init.defaultBranch = cfg.git.defaultBranch;
              merge.ours.driver = true;
            };

          }
        else
          { }
      );

    programs.lazygit =
      { } // (if cfg.git.enableLazyGit && cfg.git.enable then { enable = true; } else { });

  };

}
