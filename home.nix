{ config, pkgs, nixGL, ... }:

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
		pkgs.nodejs_23
		pkgs.cargo
		pkgs.lazygit
		pkgs.direnv
		pkgs.yazi
  ];

  home.file = {};
	xdg.configFile = {
		"nvim/lua".source = config.lib.file.mkOutOfStoreSymlink ./config/nvim/lua;
		"nvim/init.lua".source = config.lib.file.mkOutOfStoreSymlink ./config/nvim/init.lua;
		"kitty".source = config.lib.file.mkOutOfStoreSymlink ./config/kitty;
		"helix".source = config.lib.file.mkOutOfStoreSymlink ./config/helix;
		"niri".source = config.lib.file.mkOutOfStoreSymlink ./config/niri;
		"waybar".source = config.lib.file.mkOutOfStoreSymlink ./config/waybar;
		"ghostty".source = config.lib.file.mkOutOfStoreSymlink ./config/ghostty;
		"sway".source = config.lib.file.mkOutOfStoreSymlink ./config/sway;
		"mako".source = config.lib.file.mkOutOfStoreSymlink ./config/mako;
	};

  home.sessionVariables = {
    EDITOR = "hx";
		ZSH_TMUX_AUTOSTART = "true";
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
		shellAliases = {
			lg = "lazygit";
			please = "sudo";
		};
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
			plugins = [ "git" "dnf" "kubectl" "docker-compose" "last-working-dir" "direnv"];
		};
		enableVteIntegration = true;
		enableCompletion = true;
		autosuggestion.enable = true;
		syntaxHighlighting.enable = true;
		initContent= builtins.readFile ./config/zsh/zshrc;
	};
	programs.alacritty = {
		enable = true;
		package = (config.lib.nixGL.wrap pkgs.alacritty);
		settings = builtins.fromTOML (builtins.readFile ./config/alacritty/alacritty.toml);
	};
	programs.ghostty = {
		enable = true;
		package = (config.lib.nixGL.wrap pkgs.ghostty);
	};
	programs.tmux = {
		enable = false;
		escapeTime = 0;
		baseIndex = 1;
		disableConfirmationPrompt = true;
		prefix = "C-space";
    terminal = "tmux-256color";
		shell = "${pkgs.zsh}/bin/zsh";
		extraConfig = builtins.readFile ./config/tmux/tmux.conf;
		keyMode = "vi";
		mouse = true;
		sensibleOnTop = true;
		customPaneNavigationAndResize = true;
		plugins = [
			{
				plugin = pkgs.tmuxPlugins.vim-tmux-navigator;
			}
		];
	};
}
