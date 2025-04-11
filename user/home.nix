{config, pkgs, ...}:

{
  imports = [
    ./catppuccin
    ./hyprland
    ./software
    ./waybar
    ./foot
    ./bash
    ./zsh
  ];
  
  home = {
    username = "nix";
    homeDirectory = "/home/nix";
    stateVersion = "25.05";
  };
  
  programs.home-manager.enable = true;
}
