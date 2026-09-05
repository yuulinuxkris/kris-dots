function domainexpansion --wraps='pacman -S' --wraps=pacman --wraps='sudo pacman -Syu' --description 'alias domainexpansion=sudo pacman -Syu'
    sudo pacman -Syu $argv
end
