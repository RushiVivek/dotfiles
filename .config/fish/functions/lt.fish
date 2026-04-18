function lt --wraps='lsd -a --tree --group-dirs first --depth=2 2>/dev/null' --wraps='eza -aT -L 2 --icons always --no-quotes --group-directories-first' --description 'alias lt eza -aT -L 2 --icons always --no-quotes --group-directories-first'
    eza -aT -L 2 --icons always --no-quotes --group-directories-first $argv
end
