{config, pkgs, ...}:

{
  imports = [
    ./hardware.nix
    ./base.nix
    ./software.nix
  ];
}
