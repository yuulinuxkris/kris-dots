{ config, pkgs, ... }:

{
  programs.obs-studio.enable = true;
  programs.obs-studio.enableVirtualCamera = true;

    boot.extraModulePackages = with config.boot.kernelPackages; [
    v4l2loopback
  ];

  boot.kernelModules = [
    "v4l2loopback"
  ];

  boot.extraModprobeConfig = ''
    options v4l2loopback devices=1 video_nr=10 card_label="OBS Virtual Camera" exclusive_caps=1
  '';

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  programs.niri.enable = true;
  programs.hyprland.enable = false;

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
