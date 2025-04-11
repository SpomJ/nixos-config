{...}:

{
  wayland.windowManager.hyprland.settings.bind = [
    ",           Print, exec, hyprshot -zm output"
    "SHIFT,      Print, exec, hyprshot -zm region"
    "ALT,        Print, exec, hyprshot -zm window"

    "$mod,       Z, exec, makoctl dismiss"
    "$mod SHIFT, Z, exec, makoctl dismiss -a"
  ];
}
