{pkgs, config, ...}:

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
    hyprland = {
      enable = true;
      withUWSM = true;
    };
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
    };
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
#        "--dpi-desync-fake-tls=/etc/nixos/tls_clienthello_www_google_com.bin"
        "--dpi-desync-split-pos=2,midsld"
      ];
    };
  };
}
