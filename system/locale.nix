{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [

  ];

  options = {

  };

  config = {
    time.timeZone = "Europe/Amsterdam";

    services = {
      xserver = {
        xkb.layout = "us";
        xkbVariant = "workman,";
        xkbOptions = "grp:win_space_toggle";
      };
    };

    i18n = {
      defaultLocale = "en_US.UTF-8";
      inputMethod = {
        type= "fcitx5";
        enable = true;
        fcitx5 = {
          waylandFrontend = true;
        };
      };

      extraLocaleSettings = {
        LC_ADDRESS = "nl_NL.UTF-8";
        LC_IDENTIFICATION = "nl_NL.UTF-8";
        LC_MEASUREMENT = "nl_NL.UTF-8";
        LC_MONETARY = "nl_NL.UTF-8";
        LC_NAME = "nl_NL.UTF-8";
        LC_NUMERIC = "nl_NL.UTF-8";
        LC_PAPER = "nl_NL.UTF-8";
        LC_TELEPHONE = "nl_NL.UTF-8";
        LC_TIME = "nl_NL.UTF-8";
      };

    };
  };

}
