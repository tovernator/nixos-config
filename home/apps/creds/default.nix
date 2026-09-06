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
    tvr.home.apps.creds.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };

  config = {
    home.packages = with pkgs; [ ] ++ (if config.tvr.home.apps.creds.enable then [ rclone ] else [ ]);
    home.file.".config/fish/functions" = (
      if config.tvr.home.apps.creds.enable then
        {
          source = ./configs/fish/functions;
          recursive = true;
        }
      else
        { }
    );
    programs.keepassxc.enable = config.tvr.home.apps.creds.enable;
  };

}
