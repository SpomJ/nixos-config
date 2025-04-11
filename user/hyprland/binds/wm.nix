{pkgs, ...}:

{
  wayland.windowManager.hyprland.settings.bind = [
    "$mod,       C, killactive,"
    "$mod SHIFT, M, exit,"

    # Floating managent
    "$mod,       V, togglefloating,"
    "$mod,       G, pin,"

    # Tiling misc
    "$mod,       P, pseudo,"
    "$mod,       J, togglesplit,"

    # Group controls
    "$mod SHIFT, W, togglegroup,"
    "$mod ALT,   W, lockactivegroup,"
    "$mod SHIFT, E, moveoutofgroup,"
    "$mod,       W, changegroupactive, b"
    "$mod,       E, changegroupactive, f"

    # Fullscreen controls
    "$mod,       F, fullscreen, 0"
    "$mod ALT,   F, fullscreen, 1"

    # Move focus
    "$mod,       left,  movefocus, l"
    "$mod,       right, movefocus, r"
    "$mod,       up,    movefocus, u"
    "$mod,       down,  movefocus, d"

    # Move windows
    "$mod SHIFT, left,  swapwindow, l"
    "$mod SHIFT, right, swapwindow, r"
    "$mod SHIFT, up,    swapwindow, u"
    "$mod SHIFT, down,  swapwindow, d"

    # Workspaces
  ] ++ (builtins.concatMap (i: [
    "$mod,       ${toString (pkgs.lib.mod i 10)}, workspace,       ${toString i}"
    "$mod SHIFT, ${toString (pkgs.lib.mod i 10)}, movetoworkspace, ${toString i}"
  ]) (pkgs.lib.lists.range 1 10)) ++ [

    # Scroll workspaces
    "$mod, mouse_down, workspace, e+1"
    "$mod, mouse_up,  workspace, e-1"

    # Special workspace
    "$mod,       S, togglespecialworkspace,"
    "$mod SHIFT, S, movetoworkspace, special:"
  ];

  wayland.windowManager.hyprland.settings.bindm = [
    "$mod, mouse:272, movewindow"
    "$mod, mouse:273, resizewindow"
  ];
}
      
