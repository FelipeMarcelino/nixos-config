{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    neovim
    tree-sitter
    nodePackages.pyright
    rust-analyzer
    nodePackages.bash-language-server
    rnix-lsp
    sumneko-lua-language-server
    universal-ctags
    nodejs
    nodePackages.lua-fmt
    nixpkgs-fmt
  ];

  xdg.configFile.nvim = {
    source = ./config/nvim;
    recursive = true;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };
}
