{
  config,
  lib,
  pkgs,
  ...
}:

with lib;
let
  cfg = config.tvr.app.firefox;
in
{
  imports = [

  ];

  options = {
    tvr.app.firefox = {
      enable = mkOption {
        type = types.bool;
        default = false;
      };
      enableAdBlock = mkOption {
        type = types.bool;
        default = false;
      };

      enableNixSearch = mkOption {
        type = types.bool;
        default = false;
      };

      removeBloat = mkOption {
        type = types.bool;
        default = true;
      };

      defaultSearchEngine = mkOption {
        type = types.str;
        default = "ddg";
      };
    };
  };

  config = mkIf cfg.enable {
    programs.firefox = {
      enable = true;
      languagePacks = [ "en_US" ];
      policies = {
        ExtensionSettings =
          let
            moz = short: "https://addons.mozilla.org/firefox/downloads/latest/${short}/latest.xpi";
          in
          {
            "uBlock0@raymondhill.net" = mkIf cfg.enableAdBlock {
              install_url = moz "ublock-origin";
              installation_mode = "force_installed";
              updates_disabled = true;
            };

            "keepassxc-browser@keepassxc.org" = mkIf config.tvr.app.keepassxc.enable {
              install_url = moz "keepassxc-browser";
              installation_mode = "force_installed";
              updates_disabled = true;
            };

            "3rdparty".Extensions = {
              "uBlock0@raymondhill.net" = mkIf cfg.enableAdBlock {
                adminSettings = {
                  userSettings = rec {
                    uiTheme = "dark";
                    uiAccentCustom = true;
                    uiAccentCustom0 = "#8300ff";
                    cloudStorageenable = lib.mkForce false;

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
          };
      }
      // (
        if cfg.removeBloat then
          {
            SearchEngines = {
              Remove = [
                "eBay"
                "Google"
                "Bing"
                "Ecosia"
                "Wikipedia"
                "Perplexity"
                "Qwant"
                "Startpage"
              ];
            };

          }
        else
          { }
      );

      profiles.default.search = { } // {
        force = true;
        default = "ddg";
        privateDefault = "ddg";
        engines =
          { }
          // (
            if cfg.enableNixSearch then
              {

                "Nix Packages" = {
                  urls = [
                    {
                      template = "https://search.nixos.org/packages";
                      params = [
                        {
                          name = "channel";
                          value = "unstable";
                        }
                        {
                          name = "query";
                          value = "{searchTerms}";
                        }
                      ];
                    }
                  ];
                  icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/app/nix-snowflake.svg";
                  definedAliases = [ "@np" ];
                };

                "Nix Options" = {
                  urls = [
                    {
                      template = "https://search.nixos.org/options";
                      params = [
                        {
                          name = "channel";
                          value = "unstable";
                        }
                        {
                          name = "query";
                          value = "{searchTerms}";
                        }
                      ];
                    }
                  ];
                  icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/app/nix-snowflake.svg";
                  definedAliases = [ "@no" ];
                };

                "NixOS Wiki" = {
                  urls = [
                    {
                      template = "https://wiki.nixos.org/w/index.php";
                      params = [
                        {
                          name = "search";
                          value = "{searchTerms}";
                        }
                      ];
                    }
                  ];
                  icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/app/nix-snowflake.svg";
                  definedAliases = [ "@nw" ];
                };
              }
            else
              { }
          );
      };

    };
  };

}
