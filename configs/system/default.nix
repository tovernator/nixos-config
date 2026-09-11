{

  defaultUsername,
  defaultPassword,
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
      initialPassword = "${defaultPassword}";

      extraGroups = [
        "networkmanager"
        "wheel"
        "video"
      ];
    };
  };

}
