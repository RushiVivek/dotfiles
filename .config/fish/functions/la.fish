function la --wraps='lsd -al --group-dirs first' --wraps='eza -a --icons always --no-quotes --group-directories-first' --description 'alias la eza -a --icons always --no-quotes --group-directories-first'
    eza -a --icons always --no-quotes --group-directories-first $argv
end
