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

    tvr.shell.git.enable = true;
    tvr.shell.git.userName = gitUser;
    tvr.shell.git.userEmail = gitEmail;
    tvr.shell.git.enableLazyGit = true;

    tvr.apps.zed.enable = true;
    tvr.apps.alacritty.enable = true;
    tvr.apps.firefox.enable = true;
    tvr.apps.firefox.enableNixSearch = true;
    tvr.apps.udiskie.enable = true;
    tvr.apps.discord.enable = true;

    tvr.apps.alacritty.useNoctaliaTheme = true;
    tvr.shell.helix.useNoctaliaTheme = true;
    tvr.shell.zellij.useNoctaliaTheme = true;
    tvr.apps.zed.useNoctaliaTheme = true;
    tvr.apps.discord.useNoctaliaTheme = true;

    home.stateVersion = stateVersion;
    programs.home-manager.enable = true;
  };

}
