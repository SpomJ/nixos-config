{...}:

{
  wayland.windowManager.hyprland.settings = {
    general = {
      gaps_in = 8;
      gaps_out = 16;
      border_size = 1;
      "col.active_border" = "$mauve $blue";
      "col.inactive_border" = "$surface0";
    };

    decoration = {
      rounding = 7;
      dim_special = 0.5;
      shadow.enabled = false;
      blur = {
        enabled = true;
        size = 2;
        passes = 5;
      };
    };

    animations = {
      enabled = true;
      bezier = [
        "ws_slide, 0.05, 0.9, 0.1, 1.0"
        "overshot, 0.05, 0.9, 0.1, 1.1"
        "linear,   0.0,  0.0, 1.0, 1.0"
      ];
      animation = [
        "windows,           1,    3,   overshot, popin         30%"
        "windowsOut,        1,    3,   overshot, popin         80%"
        "windowsMove,       1,    3,   overshot, popin"
        "border,            1,    10,  default"
        "borderangle,       1,    8,   default"
        "fade,              1,    7,   default"
        "workspaces,        1,    1,   ws_slide, slidefade     25%"
        "specialWorkspace,  1,    3,   overshot, slidefadevert 25%"
        "borderangle,       1,    100, linear,   loop"
      ];
    };

    group = {
      "col.border_active" = "$green $teal";
      "col.border_inactive" = "$surface0";
      groupbar = {
        gradients = false;
        render_titles = false;
        "col.active" = "$teal";
        "col.inactive" = "$overlay0";
      };
    };

    windowrulev2 = [
      "bordercolor[ $rosewater $overlay2], pinned:1"
      "bordersize 0, floating:0, onworkspace:w[tv1]"
      "rounding 0, floating:0, onworkspace:w[tv1]"
      "bordersize 0, floating:0, onworkspace:f[1]"
      "rounding 0, floating:0, onworkspace:f[1]"
    ];

    workspace = [
      "w[tv1], gapsout:0"
      "f[1], gapsout:0"
    ];
  };
}
