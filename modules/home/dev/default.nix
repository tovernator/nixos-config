{
  pkgs,
  ...
}:
{
  imports = [./git];

  programs.zed-editor = {
    enable = true;
    extensions = [ "nix" "toml" "rust" ];
    userSettings = {
      theme = {
        mode = "system";
        dark = "Noctalia Dark Transparent";
        light = "Noctalia Light Transparent";
      };
    };
  };

  home.packages = with pkgs; [
    nil
    nixd
  ];
}
