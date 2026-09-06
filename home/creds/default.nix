{ pkgs, ... }: {
  home.packages = with pkgs; [ rclone ];
  home.file.".config/fish/functions" = {
    source = ./configs/fish/functions;
    recursive = true;
  };
  programs.keepassxc.enable = true;
}
