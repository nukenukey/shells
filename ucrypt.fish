function ucrypt
    set name "part"
    if [ (count $argv) -ne 0 ]
        set name $argv[1]
    end
    sudo umount /dev/mapper/$name
    sudo cryptsetup close $name
    sudo rmdir /mnt/$name(true | string collect --allow-empty)-crypt
end
