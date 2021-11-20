{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    enableSyntaxHighlighting = true;
    defaultKeymap = "vicmd";
    autocd = true;
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "sudo"
        "common-aliases"
        "fasd"
        "history-substring-search"
        "pip"
        "ripgrep"
        "ssh-agent"
        "vi-mode"
        "web-search"
      ];
    };
    initExtra = ''

      bindkey '^ ' autosuggest-accept

      bindkey -M vicmd 'k' history-substring-search-up
      bindkey -M vicmd 'j' history-substring-search-down

    '';
    initExtraFirst = ''
      KEYTIMEOUT=15
    '';

    plugins = [{
      name = "alias-tips";
      src = pkgs.fetchFromGitHub {
        owner = "djui";
        repo = "alias-tips";
        rev = "45e4e97ba4ec30c7e23296a75427964fc27fb029";
        sha256 = "URI4+TOPwTQomo+3nTmWz3BGIVOTYMhPfAvqKAt9IK8=";
      };
    }];
  };
}
