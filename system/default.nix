{
  inputs,
  config,
  lib,
  pkgs,
  stateVersion,
  hostName,
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
    ./security.nix
    ./udev.nix
  ];

  options = {

  };

  config = {
    nix.settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };

    programs.bash = (
      if true then
        {
          interactiveShellInit = ''
            if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
            then
              shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
              exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
            fi
          '';
        }
      else
        { }
    );
  };

}
