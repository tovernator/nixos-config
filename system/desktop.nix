{
  pkgs,
  inputs,
  defaultUsername,
  ...
}:
{
  imports = [
    inputs.niri.nixosModules.niri
    inputs.noctalia-greeter.nixosModules.default
  ];

  programs = {

    niri = {
      enable = true;
      package = pkgs.niri;
    };

    noctalia-greeter = {
      enable = true;
      passwordless-sync-users = [ "${defaultUsername}" ];
      settings = {
        appearance = {
          hide_logo = true;
        };
      };
    };

  };

  services = {
    greetd.enable = true;
    udisks2.enable = true;
  };

  environment.systemPackages = with pkgs; [ niri ];
}
