{pkgs, config, ...}:

{
  home.packages = with pkgs; [
    zip
    unzip
    p7zip

    ripgrep
    eza
    btop
    wl-clipboard
    wineWowPackages.staging
    xdg-utils

    mpv
    telegram-desktop
    vesktop
  ];
  programs.firefox.enable = true;
}
