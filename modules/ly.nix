{ config, pkgs, ... }:

{
  services.displayManager.ly = {
    enable = true;

    settings = {
      animation = "dur_file";
      dur_file_path = "/home/kris/.local/nixos/config/ly/anim.dur";
      bigclock = "en";
      hide_borders = true;
      full_color = true;
    };
  };
}
