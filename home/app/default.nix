{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./alacritty.nix
    ./discord.nix
    ./firefox.nix
    ./keepassxc.nix
    ./nautilus.nix
    ./obsidian.nix
    ./rclone.nix
    ./udiskie.nix
    ./zed.nix
  ];

  options = {

  };

  config = {

  };

}
