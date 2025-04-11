{pkgs, config, ...}:

{
  systemd.user.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    BEMENU_OPTS ="--fb '#1e1e2e' --ff '#cdd6f4' --nb '#1e1e2e' --nf '#cdd6f4' --tb '#1e1e2e' --hb '#1e1e2e' --tf '#f38ba8' --hf '#f9e2af' --af '#cdd6f4' --ab '#1e1e2e'";
  };
  
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      exec-once = ["hyprpaper & mako & foot --server"];
      general.layout = "dwindle";
      gestures.workspace_swipe = true;
      "$mod" = "SUPER";
      windowrulev2 = [
        "tag +popup, class:(gcr-prompter)"
        "tag +popup, class:(xdg-desktop-portal-gtk)"
        "float, tag:popup"
        "dimaround, tag:popup"

        "workspace 2, class:(firefox)"
        "workspace 4, class:(org.telegram.desktop)"

        "renderunfocused, title:(Oxygen Not Included)"
      ];
    };
  };
}
