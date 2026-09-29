{ config, pkgs, ... }:

{
  services.xserver.videoDrivers = [ "amdgpu" ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  boot.initrd.kernelModules = [ "amdgpu" ];
  hardware.enableRedistributableFirmware = true;
  boot.kernelParams = [ 
    "amdgpu.ppfeaturemask=0xffffffff"
    "amdgpu.gfxoff=0"
    "amdgpu.lockup_timeout=10000"
    "amd_iommu=off"
  ];
  programs.corectrl.enable = true;
  users.users.kris.extraGroups = [ "corectrl" ];

  environment.systemPackages = with pkgs; [
    radeontop
    pciutils
    corectrl
  ];
}
