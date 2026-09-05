{ pkgs, ... }:

{

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  programs.niri.enable = true;

  programs.kdeconnect.enable = true;

  services.flatpak.enable = true;

  qt = {
    enable = true;
    platformTheme = "gnome";
    style = "adwaita-dark";
    
  };

  programs.noctalia = {
    enable = true;
    systemd.enable = true;
  };
}
