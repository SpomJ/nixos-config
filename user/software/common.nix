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

    appimage-run

    mpv
    telegram-desktop
    vesktop
    qbittorrent
  ];
  programs.firefox.enable = true;
  programs.fastfetch.enable = true;
  programs.btop.enable = true;
}
