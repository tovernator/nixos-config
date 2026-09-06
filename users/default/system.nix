{
  defaultUsername,
  ...
}:
{
  users.users.${defaultUsername} = {
    isNormalUser = true;
    description = "default user";
    initialPassword = "cutie";

    extraGroups = [
      "networkmanager"
      "wheel"
      "video"
    ];
  };
}
