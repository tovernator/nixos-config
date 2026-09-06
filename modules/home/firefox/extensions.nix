{
  lib,
  ...
}:
{
  programs.firefox.policies = {
    ExtensionSettings =
      let
        moz = short: "https://addons.mozilla.org/firefox/downloads/latest/${short}/latest.xpi";
      in
      {
        "*".installation_mode = "blocked";

        "uBlock0@raymondhill.net" = {
          install_url = moz "ublock-origin";
          installation_mode = "force_installed";
          updates_disabled = true;
        };

      };

    "3rdparty".Extensions = {
      "uBlock0@raymondhill.net".adminSettings = {
        userSettings = rec {
          uiTheme = "dark";
          uiAccentCustom = true;
          uiAccentCustom0 = "#8300ff";
          cloudStorageEnabled = lib.mkForce false;

          importedLists = [
            "https://filters.adtidy.org/extension/ublock/filters/3.txt"
            "https://github.com/DandelionSprout/adfilt/raw/master/LegitimateURLShortener.txt"
          ];

          externalLists = lib.concatStringsSep "\n" importedLists;
        };

        selectedFilterLists = [
          "CZE-0"
          "adguard-generic"
          "adguard-annoyance"
          "adguard-social"
          "adguard-spyware-url"
          "easylist"
          "easyprivacy"
          "https://github.com/DandelionSprout/adfilt/raw/master/LegitimateURLShortener.txt"
          "plowe-0"
          "ublock-abuse"
          "ublock-badware"
          "ublock-filters"
          "ublock-privacy"
          "ublock-quick-fixes"
          "ublock-unbreak"
          "urlhaus-1"
        ];
      };
    };

  };
}
