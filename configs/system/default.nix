{

  defaultUsername,
  defaultPassword,
  hostName,
  config,
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
    tvr.system.gpu.enable = true;
    tvr.system.steam.enable = true;
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
