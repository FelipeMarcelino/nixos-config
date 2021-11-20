{ config, pkgs, ... }:

{
  imports = [ ./git.nix ./neovim.nix ./fonts.nix ./alacritty.nix ];
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
    fzf
    ripgrep

    # Tools
    unzip
  ];
  programs.home-manager.enable = true;
}
