{...}:

{
    home-manager.users.juniperg.wayland.windowManager.hyprland = {
        systemd.variables = ["--all"];
        enable = true;
        settings =  {

          "$mod" = "SUPER";
          env = "HYPRCURSOR_THEME,rose-pine-hyprcursor";
    exec-once = [
      "waybar &"
      "hyprpaper &"
      "hypridle &"
      "swaync &"
      "lxqt-policykit-agent &"

    ];
    monitor = ["eDP-1,1920x1080@120.03Hz,0x0,1"];
    bind = [
        "$mod, R, exec, fuzzel || pkill fuzzel"
        "$mod, Print, exec, grimblast copy area"
        "$mod, M, exit" 
        "$mod, V, togglefloating"
        "$mod, F, fullscreen"
        "$mod, Q,killactive"
        "$mod, T,exec,alacritty"
        "$mod SHIFT,L,exec,hyprlock"
        ",XF86AudioRaiseVolume,exec,pamixer -i 5"
        ",XF86AudioLowerVolume,exec,pamixer -d 5"
        ",XF86AudioMute,exec,pamixer -t "

        
      ]
      ++ (
        # workspaces
        # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
        builtins.concatLists (builtins.genList (i:
            let ws = i + 1;
            in [
              "$mod, code:1${toString i}, workspace, ${toString ws}"
              "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
            ]
          )
          9)
      );
    bindm = [
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
    ];
    
    general = {
        
        "col.active_border" = "rgb(d00000) rgb(E85D04) 45deg";
        "col.inactive_border" = "rgb(370617) rgb(03071E) 45deg";
        
      };
    decoration = {
      rounding = 10;
      rounding_power = 2;
      active_opacity = 1.0;
      inactive_opacity = 0.7;

    };

    };
      };

  }
