{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-conf.nix
      ../../modules/packages.nix
      ../../modules/amdgpu.nix
      ../../modules/programs.nix
      ../../modules/services.nix
      ../../modules/virt.nix
      ../../modules/qt.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.consoleMode = "max";
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Polkit because fuckass niri refuses to do it on its own.
  security.polkit.enable = true;

  # Define hostname and enable NetworkManager.
  networking.hostName = "nix-btw";
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Warsaw";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pl_PL.UTF-8";
    LC_IDENTIFICATION = "pl_PL.UTF-8";
    LC_MEASUREMENT = "pl_PL.UTF-8";
    LC_MONETARY = "pl_PL.UTF-8";
    LC_NAME = "pl_PL.UTF-8";
    LC_NUMERIC = "pl_PL.UTF-8";
    LC_PAPER = "pl_PL.UTF-8";
    LC_TELEPHONE = "pl_PL.UTF-8";
    LC_TIME = "pl_PL.UTF-8";
  };

  # Enable the trash (X11) windowing system.
  services.xserver.enable = false;

  # Enable the ly Display Manager
  services.displayManager.ly.enable = true;

  # Enable GNOME because shit breaks without it...
  services.desktopManager.gnome.enable = true;

  # Configure keymap in trash display server (X11).
  services.xserver.xkb = {
    layout = "pl";
    variant = "";
  };

  # Configure console keymap.
  console.keyMap = "pl2";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."kris" = {
    isNormalUser = true;
    description = "Kris";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # Allow unfree packages.
  nixpkgs.config.allowUnfree = true;

  # Allow actually sane fucking commands.
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Allow actually using fuckass appimages.
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    # Add any missing dynamic libraries for unpackaged programs
    # here, NOT in environment.systemPackages
  ];

  # Probably won't ever need to edit this one.
  system.stateVersion = "26.05"; # Did you read the comment?

}
