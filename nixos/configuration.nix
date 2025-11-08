# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.default
    ];
  services.flatpak.enable = true;  
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
   services.xserver.videoDrivers = [ "nvidia" ];
     hardware.nvidia = {
   modesetting.enable = true;
   open = false;
   nvidiaSettings = true;
   package = config.boot.kernelPackages.nvidiaPackages.stable;
 };
 fonts = {
    enableDefaultPackages = true;
    fontconfig.enable = true;
    packages = [
      pkgs.nerd-fonts.jetbrains-mono
    ];
  };
  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;
   
  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Chicago";
  xdg.portal = {
   enable = true;
   wlr.enable = true;
  };
  programs.river = {
  	enable = true;
  };
  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
  services.displayManager.sddm.wayland.enable = true;  
  services.xserver.displayManager.sddm.enable = true;
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.juniperg = {
    isNormalUser = true;
    description = "Juniper Guiles";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  programs.hyprland.enable = true;
  programs.steam = {
  enable = true;
  remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
  dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };
  services.pcscd.enable = true;
  programs.gnupg.agent = {
   enable = true;
   enableSSHSupport = true;
  
};
  services.mullvad-vpn = {
      enable = true;
      package = pkgs.mullvad-vpn;
    };
  
  users.extraGroups.docker.members = [ "juniperg" ];
  virtualisation.docker.enable = true;
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = [
  pkgs.neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  pkgs.git
  pkgs.wlr-randr
  pkgs.xdg-desktop-portal-wlr
  inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}
