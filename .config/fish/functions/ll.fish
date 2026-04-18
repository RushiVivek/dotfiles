function ll --wraps='lsd -l --group-dirs first' --wraps='eza -bhl --total-size --icons always --no-quotes --group-directories-first' --description 'alias ll eza -bhl --total-size --icons always --no-quotes --group-directories-first'
    eza -bhl --total-size --icons always --no-quotes --group-directories-first $argv
end
