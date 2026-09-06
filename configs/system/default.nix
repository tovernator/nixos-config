{
  config,
  lib,
  pkgs,
  defaultUsername,
  hostName,
  stateVersion,
  ...
}:

{
  imports = [
    ../../system
  ];

  options = {

  };

  config = {

    networking.hostName = hostName;
    system.stateVersion = stateVersion;

    users.users.${defaultUsername} = {
      isNormalUser = true;
      description = "${defaultUsername}";
      initialPassword = "cutie";

      extraGroups = [
        "networkmanager"
        "wheel"
        "video"

      ];
    };
  };

}
