{pkgs, config, ...}:

{
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    cozette
    nerd-fonts.jetbrains-mono
    inter
  ];
}
