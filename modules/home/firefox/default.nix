{
  ...
}:
{
  imports = [
    ./extensions.nix
    ./search.nix
  ];
  programs.firefox = {
    enable = true;

    languagePacks = [
      "en-US"
      "nl"
    ];

    policies = {
      # Updates & Background Services
      AppAutoUpdate = false;
      BackgroundAppUpdate = false;

      # Feature Disabling
      DisableFirefoxStudies = true;
      DisableFirefoxAccounts = true;
      DisableFirefoxScreenshots = true;
      DisableForgetButton = true;
      DisableMasterPasswordCreation = true;
      DisableProfileImport = true;
      DisableProfileRefresh = true;
      DisableSetDesktopBackground = true;
      DisablePocket = true;
      DisableTelemetry = true;
      DisableFormHistory = true;
      DisablePasswordReveal = true;

      # Access Restrictions
      BlockAboutConfig = false;
      BlockAboutProfiles = true;
      BlockAboutSupport = true;

      # UI and Behavior
      DisplayMenuBar = "never";
      DontCheckDefaultBrowser = true;
      HardwareAcceleration = false;
      OfferToSaveLogins = false;
      DefaultDownloadDirectory = "~/Downloads";

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

      # Extensions
    };
  };
}
