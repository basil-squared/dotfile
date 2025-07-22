{...}:
{
    home-manager.users.juniperg.gtk = {
        enable = true;
        cursorTheme = {
            package = pkgs.material-cursors;
            name = "Material Cursors";

          };
        iconTheme = {
            package = pkgs.papirus-icon-theme;
            name = "Papirus Dark";
          };
      };
  }
