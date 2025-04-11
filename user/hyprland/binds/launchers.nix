{...}:

{
  wayland.windowManager.hyprland.settings.bind = [
    "$mod,       D, exec, j4-dmenu-desktop --dmenu=\"bemenu  --ignorecase --fn 'Cozette 11.5' --hp 6 -p '<'\""
    "$mod,       R, exec, bemenu-run --fn 'Cozette 11.5' --hp 6 -p '$'"

    "$mod,       Q, exec, footclient"
    "$mod SHIFT, Q, exec, [float] footclient"
  ];
}
