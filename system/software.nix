{inputs, pkgs, config, ...}:

let
  zapret_yt_tls = pkgs.fetchurl {
    url = "https://github.com/bol-van/zapret/raw/refs/heads/master/files/fake/tls_clienthello_www_google_com.bin";
    sha256 = "0p172hxcfsf5knap4wdimp8vqgsbhg6cnbbb88yam07v9kp2nv4k";
  };
in
{
  environment.systemPackages = with pkgs; [
    vim
    kakoune
    wget
    light
    git
    greetd.tuigreet
  ];

  networking.nameservers = ["1.1.1.1"];

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
    };
  };
}
