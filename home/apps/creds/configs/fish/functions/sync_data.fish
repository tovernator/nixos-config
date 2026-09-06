function sync_data
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
end
