{ config, pkgs, ... }:

{
  imports = [
    ./monitors.nix
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
  ];
  home.username = "felipemarcelino";
  home.homeDirectory = "/home/felipemarcelino";
  home.stateVersion = "21.11";
  home.packages = with pkgs; [
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

    # Tools
    unzip
  ];

  # FZF
  programs.fzf.enable = true;

  # Htop
  programs.htop.enable = true;
  programs.home-manager.enable = true;
}
