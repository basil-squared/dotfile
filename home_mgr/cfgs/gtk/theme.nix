{...}:
{
    home-manager.users.juniperg.gtk = {
        enable = true;
        cursorTheme = {
            package = pkgs.material-cursors;
            name = "Material Cursors";

          };

      }
  }
