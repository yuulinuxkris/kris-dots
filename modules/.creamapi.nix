{ pkgs, ... }:

let
  creamlinux = import (pkgs.fetchFromGitHub {
    owner = "Novattz";
    repo = "creamlinux-installer";
    rev = "main";
    # Leave this blank first. Nix will error out and tell you the correct hash to paste here.
    hash = "sha256-sV23mp0XnJHf4oSqqvFLFfvSkssHzxafqYMNw3HGEdg="; 
  }) { inherit pkgs; };
in
{
  environment.systemPackages = [
    creamlinux
  ];
}

