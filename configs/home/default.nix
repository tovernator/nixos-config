{
  config,
  lib,
  pkgs,
  defaultUsername,
  gitUser,
  gitEmail,
  stateVersion,
  ...
}:

{
  imports = [
    ../../home
  ];

  options = {

  };

  config = {
    home.username = "${defaultUsername}";
    home.homeDirectory = "/home/${defaultUsername}";

    xdg.userDirs.enable = true;
    xdg.userDirs.createDirectories = true;

    tvr.theme.enable = true;

    tvr.shell.bat.enable = true;
    tvr.shell.devenv.enable = true;
    tvr.shell.eza.enable = true;
    tvr.shell.fd.enable = true;
    tvr.shell.fish.enable = true;
    tvr.shell.git.enable = true;
    tvr.shell.helix.enable = true;
    tvr.shell.nix.enable = true;
    tvr.shell.protonvpn.enable = true;
    tvr.shell.starship.enable = true;
    tvr.shell.zellij.enable = true;



    tvr.app.alacritty.enable = true;
    tvr.app.discord.enable = true;
    tvr.app.firefox.enable = true;
    tvr.app.keepassxc.enable = true;
    tvr.app.nautilus.enable = true;
    tvr.app.obsidian.enable = true;
    tvr.app.udiskie.enable = true;
    tvr.app.rclone.enable = true;
    tvr.app.zathura.enable = true;
    tvr.app.zed.enable = true;

    tvr.shell.git.userName = gitUser;
    tvr.shell.git.userEmail = gitEmail;
    tvr.shell.git.enableLazyGit = true;

    tvr.app.firefox.enableNixSearch = true;
    tvr.app.firefox.enableAdBlock = true;

    home.stateVersion = stateVersion;
    programs.home-manager.enable = true;
  };

}
