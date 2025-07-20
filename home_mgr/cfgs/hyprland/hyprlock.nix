{...}:
{
    
    security.pam.services.hyprlock = {};
    home-manager.users.juniperg.programs.hyprlock = {
      settings = {
          # inspiration from https://github.com/justinmdickey/publicdots/blob/main/.config/hypr/hyprlock.conf
          background = [
            {
              monitor = "eDP-1";
              path = "screenshot";

              blur_passes = 3; # 0 disables blurring
              blur_size = 7;
              noise = 1.17e-2;
            }
          ];

          label = [
            {
              monitor = "eDP-1";
              text = "$TIME";
              color = "rgb(d00000)";
              font_size = 95;
              font_family = "JetBrains Mono";
              position = "0, 300";
              halign = "center";
              valign = "center";
            }
            {

              monitor = "eDP-1";
              text = ''cmd[update:1000] echo $(date +"%A, %B %d")'';
              color = "rgb(9d0208)";
              font_size = 22;
              font_family = "JetBrains Mono";
              position = "0, 200";
              halign = "center";
              valign = "center";

            }
          ];

          image = {
            monitor = "eDP-1";
            path = "/home/${username}/.cache/hyprlock/profile.png";

            position = "0, 50";
            halign = "center";
            valign = "center";
          };

          input-field = {
            monitor = "eDP-1";
            size = "200,50";
            outline_thickness = 2;
            dots_size = 0.2; # Scale of input-field height, 0.2 - 0.8
            dots_spacing = 0.35; # Scale of dots' absolute size, 0.0 - 1.0
            dots_center = true;
            outer_color = "rgba(0, 0, 0, 0)";
            inner_color = "rgba(0, 0, 0, 0.2)";
            font_color = "rgb(ffba08)";
            fade_on_empty = false;
            rounding = -1;
            check_color = "rgb(03071e)";
            placeholder_text = ''<i><span foreground="##ffba08">Try your luck...</span></i>'';
            hide_input = false;
            position = "0, -100";
            halign = "center";
            valign = "center";
          };
        };
    };
  }
