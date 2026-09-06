{ pkgs, ... }:

import (builtins.fetchTarball {
  url = "https://github.com/NixOS/nixpkgs/archive/0e251e24a4f2.tar.gz";
  sha256 = "118n3xlp9fyf52588yhxa0a5xyi0gchci09l0vblrm7m8zimvln8";
}) { 
  system = pkgs.stdenv.hostPlatform.system;
  config.allowUnfree = true;
  }
