{ config, pkgs, ... }:

{

  home.packages = with pkgs; [
    arandr
  ];

  programs.autorandr = {
    enable = true;
  };
}
