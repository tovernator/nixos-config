{
  pkgs,
  ...
}:
{

  imports = [
    ./noctalia
    ./niri
  ];

  services = {
    udiskie.enable = true;
    udiskie.automount=true;
  };
  home.packages = with pkgs; [
    nautilus
  ];

}
