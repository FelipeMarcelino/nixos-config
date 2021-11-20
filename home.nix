{ config, pkgs, ... }:

{
  imports = [ ./git.nix ./tmux.nix ./neovim.nix ./fonts.nix ./alacritty.nix ./shell.nix ./starship.nix ];
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

    # Tools
    unzip
  ];

  # FZF
  programs.fzf.enable = true;
  programs.home-manager.enable = true;
}
