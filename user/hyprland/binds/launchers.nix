{...}:

{
  wayland.windowManager.hyprland.settings.bind = [
    "$mod,       D, exec, uwsm app -- j4-dmenu-desktop --dmenu=\"bemenu  --ignorecase --fn 'Cozette 11.5' --hp 6 -p '<'\""
    "$mod,       R, exec, uwsm app -- bemenu-run --fn 'Cozette 11.5' --hp 6 -p '$'"

    "$mod,       Q, exec, uwsm app -- footclient"
    "$mod SHIFT, Q, exec, [float] uwsm app -- footclient"
  ];
}
