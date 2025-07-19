{...}:
{
  home-manager.users.juniperg.services.hyprpaper = {
    enable = true;
    settings = {
         preload = [
        "~/.config/hyprpaper/wp/wp.png"
         ];
         wallpaper = [
        "eDP-1,~/.config/hyprpaper/wp/wp.png"
          ];
      };
     
    }; 



  }
