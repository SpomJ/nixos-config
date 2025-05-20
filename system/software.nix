{inputs, pkgs, config, ...}:

let
  zapret_yt_tls = pkgs.fetchurl {
    url = "https://github.com/bol-van/zapret/raw/refs/heads/master/files/fake/tls_clienthello_www_google_com.bin";
    sha256 = "0p172hxcfsf5knap4wdimp8vqgsbhg6cnbbb88yam07v9kp2nv4k";
  };
in
{
  nixpkgs.config.permittedInsecurePackages = [ "olm-3.2.16" ];  # needed for neochat
  environment.systemPackages = with pkgs; [
    vim
    kakoune
    comma
    file
    wget
    light
    nh
    git
    greetd.tuigreet
    wineWowPackages.unstableFull
    appimage-run
  ];

  networking.nameservers = ["1.1.1.1"];
  networking.dhcpcd.extraConfig = '' nohook resolv.conf '';

  programs = {
    zsh = {
      enable = true;
      enableBashCompletion = true;
      enableCompletion = true;
      autosuggestions = {
        enable = true;
        async = true;
      };
    };
    hyprland = {
      enable = true;
      withUWSM = true;
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    };
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
    };
    obs-studio.enable = true;
  };

  hardware.graphics.enable32Bit = true;  # to be used for wine

  security.rtkit.enable = true;
  services = {
    pipewire = {
      enable = true; # if not already enabled
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # If you want to use JACK applications, uncomment this
      #jack.enable = true;
    };
    greetd = {
      enable = true;
      vt = 7;
      settings.default_session.command = ''
        ${pkgs.greetd.tuigreet}/bin/tuigreet \
        --remember \
        --remember-session \
        --asterisks
      '';
    };
    zapret = {
      enable = true;
      params = [
        "--dpi-desync=fake,multisplit"
        "--dpi-desync-ttl=7"
        "--dpi-desync-fooling=badseq,md5sig"
        "--dpi-desync-repeats=16"
        "--dpi-desync-fake-tls=${zapret_yt_tls}"
        "--dpi-desync-split-pos=2,midsld"
      ];
#      whitelist = [
#        # Youtube
#        "youtube.com"
#        "googlevideo.com"
#        "ytimg.com"
#        "youtu.be"
#        # Discord
#        "discord.com"
#        "discord.gg"
#        "discordapp.com"
#        "discordapp.net"
#        "discord-attachments-uploads-prd.storage.googleapis.com"
#        # Misc
#        "rutracker.org"
#        "proton.me"
#      ];
    };
  };

  # Run several filetypes with ./
  boot.binfmt.registrations = {
    appimage = {
      wrapInterpreterInShell = false;
      interpreter = "${pkgs.appimage-run}/bin/appimage-run";
      recognitionType = "magic";
      offset = 0;
      mask = ''\xff\xff\xff\xff\x00\x00\x00\x00\xff\xff\xff'';
      magicOrExtension = ''\x7fELF....AI\x02'';
    };
    wine = {
      wrapInterpreterInShell = false;
      interpreter = "${pkgs.wineWowPackages.unstableFull}/bin/wine";
      recognitionType = "magic";
      offset = 0;
      mask = ''\xff\xff'';
      magicOrExtension = ''MZ'';
    };
  };
}
