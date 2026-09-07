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
    ./rclone.nix
    ./udiskie.nix
    ./zed.nix
  ];

  options = { };

  config = { };

}
