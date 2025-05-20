{pkgs, config, ...}:

{
  imports = [
    ./fonts.nix
    ./common.nix
    ./eza.nix
    ./cava.nix
    ./git.nix
    ./xdg.nix
  ];
}
