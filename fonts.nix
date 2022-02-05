{ config, pkgs, ... }:

{
  fonts.fontconfig.enable = true;
  home.packages = [
    (pkgs.nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" "Iosevka" "FiraMono" ]; })
  ];

  gtk.enable = true;
  gtk.font.name = "FiraCode";
  gtk.font.size = 10;

}
