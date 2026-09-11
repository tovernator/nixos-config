{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./alacritty.nix
    ./chromium.nix
    ./discord.nix
    ./firefox.nix
    ./keepassxc.nix
    ./nautilus.nix
    ./obsidian.nix
    ./rclone.nix
    ./udiskie.nix
    ./zathura.nix
    ./zed.nix
  ];

  options = {

  };

  config = {

  };

}
