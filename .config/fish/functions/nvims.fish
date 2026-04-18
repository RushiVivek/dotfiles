function nvims
    set cache_file ~/.cache/nvims_last
    set configs default

    for dir in ~/.config/*
        if test -d $dir
            if test -f $dir/init.lua -o -f $dir/init.vim
                set configs $configs (basename $dir)
            end
        end
    end

    set config (printf "%s\n" $configs | fzf \
        --prompt="Neovim config > " \
        --height=50% \
        --layout=reverse \
        --border)

    if test -z "$config"
        echo "Nothing selected"
        return
    end

    mkdir -p (dirname $cache_file)
    echo $config > $cache_file

    if test "$config" = "default"
        env nvim $argv
    else
        env NVIM_APPNAME=$config nvim $argv
    end
end
