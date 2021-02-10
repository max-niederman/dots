function vim --description "Open Neovim-qt in the directory specified"
    if test -n "$argv"
        and [ -d $argv[1] ]

        set -l path $PWD
        cd $argv[1]
        nvim $argv[2..-1]
        cd $path
    else
        nvim $argv
    end
end
