{config, pkgs, ...}:

{
  catppuccin = {
    flavor = "mocha";
    
    waybar.enable = true;
    waybar.mode = "createLink";

    cursors.enable = true;
    cursors.accent = "dark";

    foot.enable = true;
    hyprland.enable = true;
  };
}
