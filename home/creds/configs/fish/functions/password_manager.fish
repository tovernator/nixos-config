function password_manager -a PWDB
    sync_data 1>/dev/null
    secret-tool lookup keepass $PWDB | keepassxc --pw-stdin "$HOME/.data/$PWDB.kdbx" 2>/dev/null 1>/dev/null &
end
