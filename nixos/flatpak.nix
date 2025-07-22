# home.nix
{ lib, ... }: {

  # Add a new remote. Keep the default one (flathub)
  services.flatpak.remotes = lib.mkOptionDefault [{
    name = "flathub-beta";
    location = "https://flathub.org/beta-repo/flathub-beta.flatpakrepo";
  }];

  services.flatpak.update.auto.enable = false;
  services.flatpak.uninstallUnmanaged = false;

  # Add here the flatpaks you want to install
  services.flatpak.packages = [
    #{ appId = "com.brave.Browser"; origin = "flathub"; }
    #"com.obsproject.Studio"
    #"im.riot.Riot"
    "org.vinegarhq.Sober"
    "io.github.equicord.equibop"
    "com.usebottles.bottles"
    "com.github.tchx84.Flatseal"
    "org.prismlauncher.PrismLauncher"
    "com.obsproject.Studio"
  ];

}
