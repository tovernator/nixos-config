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

    tvr.home.shell.fish.enable = true;
    tvr.home.shell.helix.enable = true;
    tvr.home.shell.starship.enable = true;
    tvr.home.shell.zellij.enable = true;
    tvr.home.shell.git.enable = true;
    tvr.home.shell.git.userName = gitUser;
    tvr.home.shell.git.userEmail = gitEmail;
    tvr.home.shell.git.lazygit = true;

    tvr.home.apps.zed-editor.enable = true;

    tvr.home.apps.firefox.enable = true;
    tvr.home.apps.firefox.nixSearch = true;
    tvr.home.apps.discord.enable = true;

    tvr.home.apps.creds.enable = true;

    # config.tvr.home.shell.bat = true;
    # config.tvr.home.shell.eza = true;
    home.stateVersion = stateVersion;
    programs.home-manager.enable = true;
  };

}
