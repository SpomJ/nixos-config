{pkgs, config, ...}:

{
  imports = [
    ./fonts.nix
    ./common.nix
    ./rice.nix
    ./eza.nix
    ./cava.nix
    ./git.nix
    ./xdg.nix
  ];
}
