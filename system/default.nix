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

  networking.hostName = hostName;
  system.stateVersion = stateVersion;
}
