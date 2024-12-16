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
		pkgs.lazygit
  ];

  home.file = {
  };
	xdg.configFile = {
		"nvim/lua" = {
			source = config.lib.file.mkOutOfStoreSymlink ./.config/nvim/lua;
		};
		# lazy-lock.json write workaround
		"nvim/init.lua" = {
			source = config.lib.file.mkOutOfStoreSymlink ./.config/nvim/init.lua;
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
	programs.zsh = {
		enable = true;
		oh-my-zsh = {
			enable = true;
			plugins = [ "git" ];
			theme = "fino";
		};
		enableVteIntegration = true;
		enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
	};
}
