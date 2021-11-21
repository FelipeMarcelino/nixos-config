{ config, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      font.normal.family = "FiraCode Nerd Font Mono";
      font.size = 13;
      font.use_thin_strokes = false;
      colors = {
        primary = {
          background = "#1e1e1e";
          foreground = "#abb2bf";
        };
        normal = {
          black = "#1e1e1e";
          red = "#e06c75";
          green = "#98c379";
          yellow = "#e5c07b";
          blue = "#61afef";
          magenta = "#c678dd";
          cyan = "#56b6c2";
          white = "#abb2bf";
        };

        bright = {
          black = "#3f3f3f";
          red = "#e06c75";
          green = "#98c379";
          yellow = "#e5c07b";
          blue = "#61afef";
          magenta = "#c678dd";
          cyan = "#56b6c2";
          white = "#bfc5ce";
        };

        cursor = {
          text = "CellBackground";
          cursor = "CellForeground";
        };

        selection = {
          text = "CellForeground";
          background = "#3e4452";
        };
      };
      cursor = {
        style.shape = "Beam";
        style.blinking = "On";
      };
      window = {
        dynamic_title = true;
      };
    };
  };
}
