{
  config,
  lib,
  pkgs,
  ...
}:

with lib;
let

  cfg = config.tvr.system;
in
{
  imports = [
    ./audio.nix
    ./boot.nix
    ./desktop.nix
    ./gpu.nix
    ./input.nix
    ./locale.nix
    ./network.nix
    ./security.nix
  ];

  options = {
    tvr.system = {

    };
  };

  config = {

    nix.settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      trusted-users = [
        "root"
        "@wheel"
      ];
    };
    nixpkgs.config.allowUnfree = true;

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
