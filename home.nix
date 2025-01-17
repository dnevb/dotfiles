{ config, pkgs, self, nixGL, ... }:

{
  home.username = "dvill";
  home.homeDirectory = "/home/dvill";

  home.stateVersion = "24.11"; # Please read the comment before changing.

	nixGL.packages = nixGL.packages;

  home.packages = [
		pkgs.git
		pkgs.zsh
		pkgs.neovim
		pkgs.helix
		pkgs.go
		pkgs.lazygit
		pkgs.pnpm
  ];

  home.file = {};
	xdg.configFile = {
		"nvim/lua".source = config.lib.file.mkOutOfStoreSymlink ./config/nvim/lua;
		"nvim/init.lua".source = config.lib.file.mkOutOfStoreSymlink ./config/nvim/init.lua;
		"kitty".source = config.lib.file.mkOutOfStoreSymlink ./config/kitty;
		"helix".source = config.lib.file.mkOutOfStoreSymlink ./config/helix;
	};

  home.sessionVariables = {
    EDITOR = "hx";
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
		plugins = [
      {
        name = "powerlevel10k-config";
        src = config/zsh;
        file = ".p10k.zsh";
      }
      {
        name = "zsh-powerlevel10k";
        src = "${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/";
        file = "powerlevel10k.zsh-theme";
      }
		];
		oh-my-zsh = {
			enable = true;
			plugins = [ "git" ];
		};
		enableVteIntegration = true;
		enableCompletion = true;
		autosuggestion.enable = true;
		syntaxHighlighting.enable = true;
	};
	programs.ghostty = {
		enable = true;
		package = (config.lib.nixGL.wrap pkgs.ghostty);
		settings = {
			theme = "Oxocarbon";
			font-family = "Hack Nerd Font Regular";
			font-size = 13;
		};
	};
	programs.tmux = {
		enable = true;
		extraConfig = builtins.readFile ./config/tmux/tmux.conf;
	};
}
