{ config, pkgs, ... }:

{
    programs.git = {
	enable = true;
	userName = "Felipe Marcelino";
	userEmail = "felipe.marcelino1991@gmail.com";
	ignores = ["*~" "*.swp" ];
	extraConfig = {
	    init.defaultBranch = "main";
	};
    };
}
