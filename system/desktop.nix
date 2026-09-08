{
  config,
  inputs,
  lib,
  pkgs,
  ...
}:

with lib;
let

  cfg = config.tvr.system.desktop;
in
{
  imports = [
    inputs.niri.nixosModules.niri
    inputs.noctalia-greeter.nixosModules.default
    inputs.noctalia.nixosModules.default
  ];

  options = {
    tvr.system.desktop = {
      enable = mkOption {
        type = types.bool;
        default = true;
      };

      enableDesktopServices = mkOption {
        type = types.bool;
        default = true;
      };

    };
  };

  config = mkIf cfg.enable {

    environment.systemPackages = with pkgs; [
      niri
      noctalia-greeter
    ];

    fonts = {
      packages = with pkgs; [
        material-design-icons

        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-color-emoji

        nerd-fonts.symbols-only
        nerd-fonts.fira-code
        nerd-fonts.jetbrains-mono
      ];

      enableDefaultPackages = false;

      fontconfig.defaultFonts = {
        serif = [
          "Noto Serif"
          "Noto Color Emoji"
        ];
        sansSerif = [
          "Noto Sans"
          "Noto Color Emoji"
        ];
        monospace = [
          "JetBrainsMono Nerd Font"
          "Noto Color Emoji"
        ];
        emoji = [ "Noto Color Emoji" ];
      };
    };

    programs = {
      niri = {
        enable = true;
        package = pkgs.niri;
      };
      noctalia-greeter = {
        enable = true;
        package = pkgs.noctalia-greeter;
        settings = {
          appearance = {
            hide_logo = true;
          };
        };
      };

    };
    services = {

    }
    // (
      if cfg.enableDesktopServices then
        {
          udisks2.enable = true;
          upower.enable = true;
          tuned.enable = true;
        }
      else
        { }
    );

  };

}
