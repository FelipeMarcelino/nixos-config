{ config, pkgs, ... }:

{
  imports = [ ./git.nix ./neovim.nix ];
  home.username = "felipemarcelino";
  home.homeDirectory = "/home/felipemarcelino";
  home.stateVersion = "21.11";
  home.packages = with pkgs; [
    # Tools
    unzip
  ];
  programs.home-manager.enable = true;
}
