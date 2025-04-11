{config, pkgs, ...}:

{
  users.users.nix = {
    isNormalUser = true;
    hashedPassword = "$7$CU..../....7FG9ihi2q5YU.eqyL.XmK0$bjq.yvIYB.53BIET7LTrFXd40Pts3KsOgOTee0ZDjI/";
    description = "nix";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
    packages = with pkgs; [
      firefox
      kitty
    ];
  };
}
