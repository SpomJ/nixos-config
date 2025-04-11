{pkgs, config, ...}:

{
  wayland.windowManager.hyprland.settings = {
    input = {
      kb_layout = "us,ru";
      kb_options = "grp:caps_toggle";
      follow_mouse = 1;
      accel_profile = "adaptive";
      touchpad = {
        natural_scroll = true;
        disable_while_typing = false;
      };
    };

    monitor = [
      # Name  res@fps    pos   scale
      "eDP-1, 1920x1080, 0x0,  1"
      ",      preferred, auto, 1"
    ];
  };
}
