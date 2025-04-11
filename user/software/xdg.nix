{pkgs, config, ...}:

{
  home.file.lib.source = config.lib.file.mkOutOfStoreSymlink "/mnt/data/lib";

  systemd.user.tmpfiles.rules = [
    #T Path                                     Mod User Group Age Arg
    "d ${config.home.homeDirectory}/tmp         -   -    -     ~1d -"
    "d ${config.home.homeDirectory}/tmp/dl      -   -    -     -   -"
    "d ${config.home.homeDirectory}/tmp/dsk     -   -    -     -   -"
    "d ${config.home.homeDirectory}/tmp/publ    -   -    -     -   -"
    "d ${config.home.homeDirectory}/tmp/tmpl    -   -    -     -   -"
    "d ${config.home.homeDirectory}/tmp/misc    -   -    -     -   -"
  ];
  
  xdg = {
    enable = true;

    cacheHome = config.home.homeDirectory + "/.local/cache";
    userDirs = {
      enable = true;
      
      documents = "${config.home.homeDirectory}/lib/doc";
      music     = "${config.home.homeDirectory}/lib/mus";
      pictures  = "${config.home.homeDirectory}/lib/pic";
      videos    = "${config.home.homeDirectory}/lib/vid";
      
      desktop     = "${config.home.homeDirectory}/tmp/dsk";
      download    = "${config.home.homeDirectory}/tmp/dl";
      publicShare = "${config.home.homeDirectory}/tmp/publ";
      templates   = "${config.home.homeDirectory}/tmp/tmpl";
    };
    
    portal = {
      enable = true;
      configPackages = with pkgs;[ hyprland ];
      extraPortals = with pkgs;[ xdg-desktop-portal-hyprland xdg-desktop-portal-gtk ];
    };
  };
}
