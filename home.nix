{ config, pkgs, ... }:

{
  imports = [ ./git.nix ];
  home.username = "felipemarcelino";
  home.homeDirectory = "/home/felipemarcelino";
  home.stateVersion = "21.11";
  programs.home-manager.enable = true;
}
