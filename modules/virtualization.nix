{ config, pkgs, ... }:

{
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;

  programs.virt-manager.enable = true;

  users.users.kris.extraGroups = [
    "libvirtd"
  ];

  environment.systemPackages = with pkgs; [
    dnsmasq
  ];

  networking.firewall.trustedInterfaces = [
    "virbr0"
  ];
}
