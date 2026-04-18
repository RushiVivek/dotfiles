function ls --wraps='lsd -a --group-dirs first' --wraps='eza --icons always --no-quotes --group-directories-first' --description 'alias ls eza --icons always --no-quotes --group-directories-first'
    eza --icons always --no-quotes --group-directories-first $argv
end
