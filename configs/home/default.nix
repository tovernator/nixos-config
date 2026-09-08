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

    tvr.shell.fish.enable = true;
    tvr.shell.helix.enable = true;
    tvr.shell.starship.enable = true;
    tvr.shell.zellij.enable = true;
    tvr.shell.nix.enable = true;

    tvr.shell.git.enable = true;
    tvr.shell.git.userName = gitUser;
    tvr.shell.git.userEmail = gitEmail;
    tvr.shell.git.enableLazyGit = true;

    tvr.app.zed.enable = true;
    tvr.app.alacritty.enable = true;
    tvr.app.firefox.enable = true;
    tvr.app.firefox.enableNixSearch = true;
    tvr.app.udiskie.enable = true;
    tvr.app.discord.enable = true;
    tvr.app.nautilus.enable = true;

    tvr.app.alacritty.useNoctaliaTheme = true;
    tvr.shell.helix.useNoctaliaTheme = true;
    tvr.shell.zellij.useNoctaliaTheme = true;
    tvr.app.zed.useNoctaliaTheme = true;
    tvr.app.discord.useNoctaliaTheme = true;

    home.stateVersion = stateVersion;
    programs.home-manager.enable = true;
  };

}
