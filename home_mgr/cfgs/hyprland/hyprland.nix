{...}:

{
    home-manager.users.juniper.g.programs.hyprland = {
        enable = true;
        settings =  {
          "$mod" = "SUPER";
    exec-once = [
      "waybar"

    ];
    monitor = ["eDP-1,1920x1080,0x0,1"];
    bind = [
        "$mod, R, exec, wofi --show drun"
        "$mod, Print, exec, grimblast copy area"
        "$mod, M, exit"
        "$mod, V, togglefloating"
        "$mod, F, fullscreen"
        
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
    decoration = {
      rounding = 10;
      rounding_power = 2;
      active_opacity = 1.0;
      inactive_opacity = 0.7;

    };

    };
      };

  }
