{
  config,
  lib,
  pkgs,
  ...
}:

with lib;
let

  cfg = config.tvr.system.locale;
in
{
  imports = [

  ];

  options = {
    tvr.system.locale = {
      enable = mkOption {
        type = types.bool;
        default = true;
      };

      timeZone = mkOption {
        type = types.str;
        default = "Europe/Amsterdam";
      };

      language = mkOption {
        type = types.str;
        default = "en_US.UTF-8";
      };

      locale = mkOption {
        type = types.str;
        default = "nl_NL.UTF-8";
      };
    };
  };

  config = mkIf cfg.enable {
    time.timeZone = cfg.timeZone;
    i18n.extraLocaleSettings = {
      defaultLocale = cfg.language;
      LC_ADDRESS = cfg.locale;
      LC_IDENTIFICATION = cfg.locale;
      LC_MEASUREMENT = cfg.locale;
      LC_MONETARY = cfg.locale;
      LC_NAME = cfg.locale;
      LC_NUMERIC = cfg.locale;
      LC_PAPER = cfg.locale;
      LC_TELEPHONE = cfg.locale;
      LC_TIME = cfg.locale;

    };
  };

}
