{
  config,
  lib,
  pkgs,

  ...
}:

{
  imports = [

  ];

  options = {
    tvr.home.apps.git.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
    tvr.home.apps.git.lazygit = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
    tvr.home.apps.git.userName = lib.mkOption {
      type = lib.types.str;
      default = "";
    };
    tvr.home.apps.git.userEmail = lib.mkOption {
      type = lib.types.str;
      default = "";
    };
  };

  config = {
    programs.git = (
      if config.tvr.home.apps.git.enable then
        {
          enable = true;
          settings = {
            user = {
              name = config.tvr.home.apps.git.userName;
              email = config.tvr.home.apps.git.userEmail;
            };
            init.defaultBranch = "main";
            merge.ours.driver = true;
          };
        }
      else
        {
          enable = false;
        }
    );
    programs.lazygit.enable = (
      if config.tvr.home.apps.git.enable == true && config.tvr.home.apps.git.lazygit == true then
        true
      else
        false
    );
  };

}
