{ config, pkgs, nixGL, ... }:

{
  home.username = "dvill";
  home.homeDirectory = "/home/dvill";

  home.stateVersion = "25.05";
	nixGL.packages = nixGL.packages;

  home.packages = [
		pkgs.git
		pkgs.zsh
		pkgs.neovim
		pkgs.helix
		pkgs.go
		pkgs.cargo
		pkgs.lazygit
		pkgs.direnv
		pkgs.yazi
		pkgs.gamescope
		pkgs.swww
  ];

  home.file = {};
	xdg.configFile = {
		"kitty".source = config.lib.file.mkOutOfStoreSymlink ./config/kitty;
		"helix".source = config.lib.file.mkOutOfStoreSymlink ./config/helix;
		"niri".source = config.lib.file.mkOutOfStoreSymlink ./config/niri;
		"waybar".source = config.lib.file.mkOutOfStoreSymlink ./config/waybar;
		"ghostty".source = config.lib.file.mkOutOfStoreSymlink ./config/ghostty;
		"sway".source = config.lib.file.mkOutOfStoreSymlink ./config/sway;
		"mako".source = config.lib.file.mkOutOfStoreSymlink ./config/mako;
		"rofi".source = config.lib.file.mkOutOfStoreSymlink ./config/rofi;
		"wallpapers".source = config.lib.file.mkOutOfStoreSymlink ./wallpapers;
	};

  home.sessionVariables = {
    EDITOR = "hx";
    DISPLAY = ":0";
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
}
