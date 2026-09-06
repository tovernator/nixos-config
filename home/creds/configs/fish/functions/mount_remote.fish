function mount_remote
    mkdir -p $HOME/Drive
    rclone mount --password-command "secret-tool lookup rclone default" --buffer-size 512m --dir-cache-time 72h --vfs-cache-mode writes --daemon base:/files $HOME/Drive
end
