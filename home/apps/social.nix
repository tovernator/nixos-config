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
    tvr.home.apps.discord.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };

  config = {
    programs.equibop = (
      if config.tvr.home.apps.discord.enable then
        {
          enable = true;
          equicord.settings = {
            enabledThemes = [ "noctalia-material.theme.css" ];
          };
        }
      else
        {
          enable = false;
        }
    );
  };

}
