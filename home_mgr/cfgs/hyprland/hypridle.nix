{...}:
{
    home-manager.users.juniperg.services.hypridle = {
        enable = true;
        settings = {
            general = {
                lock_cmd = "pidof hyprlock || hyprlock";

              };
              listener = [
                {
                    timeout = 300;
                    on-timeout = "brightnessctl -s set 10";
                    on-resume = "brightnessctl -r";
                  }
                {
                    timeout = 400;
                    on-timeout = "loginctl lock-session";
                  }
              ];
          };
      };
  }
