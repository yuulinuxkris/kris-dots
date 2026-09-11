{ config, pkgs, ... }:

{
  services.xserver.videoDrivers = [ "amdgpu" ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  boot.initrd.kernelModules = [ "amdgpu" ];
  hardware.enableRedistributableFirmware = true;
  boot.kernelParams = [ "amdgpu.ppfeaturemask=0xffffffff" ];
  programs.corectrl.enable = true;
  users.users.kris.extraGroups = [ "corectrl" ];

  environment.systemPackages = with pkgs; [
    radeontop
    pciutils
    corectrl
  ];
}
