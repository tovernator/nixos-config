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

  };

  config = {
    home.packages =
      with pkgs;
      (
        if config.tvr.home.dev.nix.enable == true then
          [
            nil
            nixd
          ]
        else
          [ ]
      );
  };

}
