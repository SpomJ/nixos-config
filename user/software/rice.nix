{pkgs, config, ...}:

{
  home.packages = with pkgs; [
    mako
    bemenu
    j4-dmenu-desktop
    waybar
    foot

    hyprshot
    hyprpicker
    hyprpaper
  ];
}
