{config, pkgs, ...}:

{
  imports = [
    ./catppuccin
    ./hyprland
    ./software
    ./waybar
    ./foot
    ./zsh
    ./files.nix
  ];
  
  home = {
    username = "nix";
    homeDirectory = "/home/nix";
    stateVersion = "25.05";
  };
  
  programs.home-manager.enable = true;
}
