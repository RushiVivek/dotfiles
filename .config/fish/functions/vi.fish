function vi --wraps=vim
    set cache_file ~/.cache/nvims_last
    set config default

    if test -f $cache_file
        set saved (string trim (cat $cache_file))
        if test "$saved" != "default"
            if test -f ~/.config/$saved/init.lua -o -f ~/.config/$saved/init.vim
                set config $saved
            end
        end
    end

    if test "$config" = "default"
        env nvim $argv
    else
        env NVIM_APPNAME=$config nvim $argv
    end
end
