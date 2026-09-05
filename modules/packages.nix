{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    firefox
    git
    neovim
    kitty
    niri
    noctalia
    btop
    fastfetch
    xwayland-satellite
    fish
    starship
    nerd-fonts.jetbrains-mono
    nerd-fonts.space-mono
    nodejs
    pnpm
    flatpak
    prismlauncher
    adwaita-qt
    adwaita-qt6
    ethtool
    gparted
    pinta
    polkit_gnome
    mediawriter
    blueman
    ani-cli
    unrar
    protonup-qt
    appimage-run
    lutris
    comma
    onlyoffice-desktopeditors
  ];
}
