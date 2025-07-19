{...}:
{
    home-manager.users.juniperg.programs.zsh = {
      enable = true;

  ... # Your zsh config
  zoxide = {
    enable = true;
    plugins = [
      { name = "zsh-users/zsh-autosuggestions"; } # Simple plugin installation
      { name = "romkatv/powerlevel10k";  } 
    ];
  };
};
  }
