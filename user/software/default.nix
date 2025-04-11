{pkgs, config, ...}:

{
  imports = [
    ./fonts.nix
    ./common.nix
    ./rice.nix
    ./eza.nix
    ./xdg.nix
  ];
}
