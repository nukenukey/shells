function asm-comp
    nasm -f elf64 $argv[1]
    set -l stat $status
    if [ $stat -ne 0 ]
        printf "\t> error: nasm exited with code %s\n" $stat
    else
        set -l file $argv[1]
        set file (string split "." $file)
        set -l e $file[1]
        set -l o (string join '' $e ".o")
        ld -o $e $o
        set stat $status
        if [ $stat -ne 0 ]
            printf "\t> error: loader exited with code %s\n" $stat
        else
            rm $o
        end
    end
end
