{ config, pkgs, self, ... }:

{
  home.username = "dvill";
  home.homeDirectory = "/home/dvill";

  home.stateVersion = "24.11"; # Please read the comment before changing.

  home.packages = [
		pkgs.git
		pkgs.zsh
		pkgs.neovim
		pkgs.go
  ];

  home.file = {
  };
	xdg.configFile = {
		"nvim" = {
			source = config.lib.file.mkOutOfStoreSymlink ./.config/nvim;
			recursive = true;
		};
		"kitty" = {
			source = config.lib.file.mkOutOfStoreSymlink ./.config/kitty;
			recursive = true;
		};
	};

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;

	programs.git = {
		enable = true;
		userName = "dvill";
		userEmail = "villalbautria08@gmail.com";
	};
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
}
