function nixtree
    set -l root ~/.local/nixos
    
    tree $root -I 'niri|fastfetch|fish|starship|nvim|kitty|noctalia' | head -n -2 | while read -l line
        echo $line
        if string match -q '*── config' -- $line
            tree -L 1 $root/config | tail -n +2 | head -n -2 | sed 's/^/│   /'
        end
    end
end
