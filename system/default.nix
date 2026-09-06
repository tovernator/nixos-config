{
  hostName,
  stateVersion,
  pkgs,
  ...
}:
{

  imports = [
    ./audio.nix
    ./boot.nix
    ./desktop.nix
    ./fonts.nix
    ./locale.nix
    ./network.nix
    ./power.nix
  ];

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  environment.systemPackages = with pkgs; [
    vim
    git
    curl
  ];

  programs.bash = {
    interactiveShellInit = ''
      if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
      then
        shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
        exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
      fi
    '';
  };

  networking.hostName = hostName;
  system.stateVersion = stateVersion;
}
