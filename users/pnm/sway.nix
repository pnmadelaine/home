{ config, pkgs, ... }:

{

  wayland.windowManager.sway =
    let cfg = config.wayland.windowManager.sway.config;
    in {
      enable = true;
      wrapperFeatures.gtk = true;
      config = {
        modifier = "Mod4";
        terminal = "alacritty";
        menu = "wofi --show drun";
        bars = [{
          fonts.size = 12.0;
          position = "bottom";
        }];
        input = {
          "*" = {
            xkb_layout = "fr";
            xkb_variant = "bepo";
          };
        };
        keybindings = {
          "${cfg.modifier}+Shift+w" =
            "exec swaynag -t warning -m 'exit sway?' -b 'yes' 'swaymsg exit'";
          "${cfg.modifier}+Shift+q" = "kill";
          "${cfg.modifier}+d" = "exec ${cfg.menu}";
          "${cfg.modifier}+Return" = "exec ${cfg.terminal}";
          "${cfg.modifier}+Backspace" = "exec swaylock";
          "${cfg.modifier}+a" = "workspace number 1";
          "${cfg.modifier}+u" = "workspace number 2";
          "${cfg.modifier}+i" = "workspace number 3";
          "${cfg.modifier}+e" = "workspace number 4";
          "${cfg.modifier}+t" = "workspace number 5";
          "${cfg.modifier}+s" = "workspace number 6";
          "${cfg.modifier}+r" = "workspace number 7";
          "${cfg.modifier}+n" = "workspace number 8";
          "${cfg.modifier}+Shift+a" = "move container to workspace number 1";
          "${cfg.modifier}+Shift+u" = "move container to workspace number 2";
          "${cfg.modifier}+Shift+i" = "move container to workspace number 3";
          "${cfg.modifier}+Shift+e" = "move container to workspace number 4";
          "${cfg.modifier}+Shift+t" = "move container to workspace number 5";
          "${cfg.modifier}+Shift+s" = "move container to workspace number 6";
          "${cfg.modifier}+Shift+r" = "move container to workspace number 7";
          "${cfg.modifier}+Shift+n" = "move container to workspace number 8";

          "${cfg.modifier}+${cfg.left}" = "focus left";
          "${cfg.modifier}+${cfg.down}" = "focus down";
          "${cfg.modifier}+${cfg.up}" = "focus up";
          "${cfg.modifier}+${cfg.right}" = "focus right";

          "${cfg.modifier}+Left" = "focus left";
          "${cfg.modifier}+Down" = "focus down";
          "${cfg.modifier}+Up" = "focus up";
          "${cfg.modifier}+Right" = "focus right";

          "${cfg.modifier}+Shift+${cfg.left}" = "move left";
          "${cfg.modifier}+Shift+${cfg.down}" = "move down";
          "${cfg.modifier}+Shift+${cfg.up}" = "move up";
          "${cfg.modifier}+Shift+${cfg.right}" = "move right";

          "${cfg.modifier}+Shift+Left" = "move left";
          "${cfg.modifier}+Shift+Down" = "move down";
          "${cfg.modifier}+Shift+Up" = "move up";
          "${cfg.modifier}+Shift+Right" = "move right";

          "${cfg.modifier}+b" = "splith";
          "${cfg.modifier}+v" = "splitv";
          "${cfg.modifier}+f" = "fullscreen toggle";
          "${cfg.modifier}+p" = "focus parent";

          "${cfg.modifier}+x" = "layout stacking";
          "${cfg.modifier}+y" = "layout tabbed";
          "${cfg.modifier}+z" = "layout toggle split";

          "${cfg.modifier}+Shift+space" = "floating toggle";
          "${cfg.modifier}+space" = "focus mode_toggle";

          "${cfg.modifier}+Shift+minus" = "move scratchpad";
          "${cfg.modifier}+minus" = "scratchpad show";

          "${cfg.modifier}+Shift+c" = "reload";

          "${cfg.modifier}+g" = "mode resize";

          "XF86AudioMute" = "exec pactl set-sink-mute @DEFAULT_SINK@ toggle";
          "XF86AudioRaiseVolume" =
            "exec pactl set-sink-volume @DEFAULT_SINK@ +5%";
          "XF86AudioLowerVolume" =
            "exec pactl set-sink-volume @DEFAULT_SINK@ -5%";

          "XF86MonBrightnessUp" = "exec brightnessctl s +5%";
          "XF86MonBrightnessDown" = "exec brightnessctl s 5%-";
        };
      };
    };

  home.packages = [
    pkgs.brightnessctl
    pkgs.mako
    pkgs.pulseaudioFull
    pkgs.swayidle
    pkgs.swaylock
    pkgs.wl-clipboard
    pkgs.wofi
    pkgs.gnome3.adwaita-icon-theme
  ];
}
