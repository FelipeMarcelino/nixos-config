{ config, pkgs, ... }:

{
  imports = [
    ./monitors.nix
    ./dunst.nix
    ./git.nix
    ./i3.nix
    ./rofi.nix
    ./tmux.nix
    ./neovim.nix
    ./fonts.nix
    ./alacritty.nix
    ./shell.nix
    ./starship.nix
    ./polybar.nix
    ./spotifyd.nix
    ./flameshot.nix
    ./zathura.nix
  ];
  home.username = "felipemarcelino";
  home.homeDirectory = "/home/felipemarcelino";
  home.stateVersion = "21.11";
  home.packages = with pkgs; [
    # Archive Manager
    insync
    ranger

    # Browsers
    brave
    tor-browser-bundle-bin

    # Communications
    discord
    slack
    zoom-us

    # Finders
    fd
    fasd
    ripgrep

    # Media
    spotify-tui
    vlc

    # Tools
    busybox
    gparted
    hwinfo
    lm_sensors
    lshw
    p7zip
    unzip
  ];

  # Bluetooth
  services.blueman-applet.enable = true;

  # Dropbox
  services.dropbox.enable = true;

  # Feh
  programs.feh.enable = true;

  # Index
  programs.nix-index.enable = true;

  # FZF
  programs.fzf.enable = true;

  # Direnv
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  # Htop
  programs.htop.enable = true;

  programs.home-manager.enable = true;
}
