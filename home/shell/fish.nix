{
  config,
  lib,
  pkgs,
  ...
}:

with lib;
let
  cfg = config.tvr.shell.fish;

in
{
  imports = [ ];

  options = {
    tvr.shell.fish = {
      enable = mkOption {
        type = types.bool;
        default = false;
      };
      disableGreeter = mkOption {
        type = types.bool;
        default = true;
      };
    };
  };

  config = mkIf cfg.enable {
    programs.fish = {
      enable = true;
      interactiveShellInit = (
        if cfg.disableGreeter then
          ''
            set fish_greeting # Disable greeting
          ''
        else
          ""
      );

      functions = mkIf (config.tvr.app.keepassxc.enable && config.tvr.app.rclone.enable) {
        sync_data = {
          body = ''

            if test ! -d $HOME/.data
                mkdir -p $HOME/.data
            end
            if test (count $HOME/.data/* ) -eq 0
                echo "directory empty"
                rclone bisync --password-command "secret-tool lookup rclone default" $HOME/.data base:/data --create-empty-src-dirs --compare size,modtime,checksum --slow-hash-sync-only --resilient -MvP --drive-skip-gdocs --fix-case --resync
            else
                echo "directory not empty"
                rclone bisync --password-command "secret-tool lookup rclone default" $HOME/.data base:/data --create-empty-src-dirs --compare size,modtime,checksum --slow-hash-sync-only --resilient -MvP --drive-skip-gdocs --fix-case
            end

          '';
        };

        mount_remote = {
          body = ''
            rclone mount --password-command "secret-tool lookup rclone default" --buffer-size 512m --dir-cache-time 72h --vfs-cache-mode writes --daemon base:/files $HOME/Cloud
          '';
        };

        password_manager = {
          argumentNames = [ "PWDB" ];
          body = ''
            sync_data 1>/dev/null
            secret-tool lookup keepass $PWDB | keepassxc --pw-stdin "$HOME/.data/$PWDB.kdbx" 2>/dev/null 1>/dev/null &
          '';
        };

      };

    };

  };

}
