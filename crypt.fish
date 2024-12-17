function crypt
    set name "part"
    set dev "/dev/mmcblk0p4"
    if [ (count $argv) -ge 2 ]
        set name $argv[1]
        set dev $argv[2]
    end
    sudo cryptsetup open $dev $name
    sudo mount --mkdir /dev/mapper/$name /mnt/$name(true | string collect --allow-empty)-crypt
end
