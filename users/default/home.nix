{ stateVersion, defaultUsername, ... }: {

  imports = [
    ../../home
    ../../modules/home/firefox
    ../../modules/home/dev
  ];

  home.username = "${defaultUsername}";
  home.homeDirectory = "/home/${defaultUsername}";
  home.stateVersion = stateVersion;

  xdg.userDirs.enable = true;

  programs.home-manager.enable = true;
}
