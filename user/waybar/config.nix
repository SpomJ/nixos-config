{pkgs, ...}:

{
  programs.waybar = {
    enable = true;
    style = ./style.css;
    systemd.enable = true;
    settings = {
      bar = {
        layer = "top";
        height = 20;
        spacing = 2;
        
        modules-left = ["hyprland/workspaces"];
        modules-center = ["clock"];
        modules-right = [
          "mpris"
          "wireplumber"
          "network"
          "bluetooth"
          "cpu"
          "memory"
          "temperature"
          "backlight"
          "hyprland/language"
          "battery"
          "tray"
        ];

        "hyprland/workspaces" = {
          format = "{icon}";
          all-outputs = true;
          format-icons = {
            "1" = "α";
            "2" = "β";
            "3" = "γ";
            "4" = "δ";
            "5" = "ε";
            "6" = "λ";
            "7" = "μ";
            "8" = "ν";
            "9" = "τ";
            "10" = "#";
          };
          persistent-workspaces."*" = pkgs.lib.lists.range 1 9;
        };

        mpris = {
          format = "{player_icon} {status_icon} {position}/{length}";
          interval = 1;
          player-icons.default = "Plr";
          status-icons = {
            playing = ">";
            paused = "#";
          };
        };

        tray.spacing = 10;

        clock = {
          interval = 1;
          #tooltip-format = "<tt>{calendar}</tt>";
          format = "{:%d.%m.%y [%u] %T}";
        };

        cpu = {
          format = "Cpu {usage}%";
          tooltip = false;
        };

        memory.format = "Mem {}%";

        temperature = {
          critical-threshold = 80;
          format = "{icon} {temperatureC}°C";
          format-icons = ["temp" "Temp" "Hot"];
        };

        backlight = {
          format = "Bri {percent}%";
          on-scroll-up = "light -T 1.6";
          on-scroll-down = "light -T 0.625";
        };

        battery = {
          states = {
            full = 100;
            good = 95;
            waring = 30;
            critical = 15;
          };
          format = "Bat {capacity}%";
          format-charging = "Bat {capacity}%+";
          format-plugged = "Bat {capacity}%=";
        };

        network = {
          format-wifi = "Wlp {essid} ({signalStrength}%)";
          format-ethernet = "Eth {ipaddr}/{cidr}";
          format-disconnected = "Net !";
          format-alt = "{ifname}: {ipaddr}/{cidr}";
        };

        wireplumber = {
          format = "Vol {volume}%";
          format-muted = "Mut {volume}%";
          on-click = "wpctl set-mute @DEFAULT_SINK@ toggle";
          max-valume = 100;
          scroll-step = 0.2;
        };

        bluetooth = {
          format-on = "Blu +";
          format-off = "Blu -";
          format-disabled = "Blu #";
          format-connected = "Blu {device_alias}";
        };

        "hyprland/language" = {
          format-en = "en";
          format-ru = "ru";
        };
      };
    };
  };
}
    
