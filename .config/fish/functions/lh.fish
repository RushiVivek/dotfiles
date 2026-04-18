function lh --wraps="lsd -a --group-dirs first | grep -e '^\\.'" --wraps='eza -a -I "[!.]*" --icons always --no-quotes --group-directories-first' --description 'alias lh eza -a -I "[!.]*" --icons always --no-quotes --group-directories-first'
    eza -a -I "[!.]*" --icons always --no-quotes --group-directories-first $argv
end
