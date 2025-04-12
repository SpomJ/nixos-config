{config, pkgs, ...}:

{
  catppuccin = {
    cache.enable = true;
    flavor = "mocha";
    
    waybar.enable = true;
    waybar.mode = "createLink";

    cursors.enable = true;
    cursors.accent = "dark";

    bat.enable = true;
    cava.enable = true;
    #foot.enable = true;
    hyprland.enable = true;
    zsh-syntax-highlighting.enable = true;
  };
}
