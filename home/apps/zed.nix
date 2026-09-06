{
  inputs,
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [

  ];

  options = {
    tvr.home.apps.zed-editor.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
    tvr.home.apps.zed-editor.extensions = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [];
    };
  };

  config = {
    programs.zed-editor = (
      if config.tvr.home.apps.zed-editor.enable then
        {
          enable = true;
          extensions = [ ] ++ (if config.tvr.home.dev.nix.enable then [ "nix" ] else [ ]) ++ config.tvr.home.apps.zed-editor.extensions ;
          userSettings = {
            theme = {
              mode = "system";
              dark = "Noctalia Dark Transparent";
              light = "Noctalia Light Transparent";
            };
          };
        }
      else
        { enable = false; }
    );

  };

}
