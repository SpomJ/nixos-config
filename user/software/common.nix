{pkgs, config, ...}:

{
  home.packages = with pkgs; [
    zip
    unzip
    p7zip

    mako
    bemenu
    j4-dmenu-desktop
    waybar
    foot

    hyprshot
    hyprpicker
    hyprpaper

    ripgrep
    eza
    btop
    wl-clipboard
    xdg-utils

    fractal
    kdePackages.neochat
    keepassxc
    mpv
    telegram-desktop
    vesktop
    qbittorrent
    thunderbird
  ];
  programs.firefox.enable = true;
  programs.fastfetch.enable = true;
  programs.btop.enable = true;
}
