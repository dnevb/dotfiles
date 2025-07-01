switch:
	home-manager switch --flake .
clean:
	home-manager expire-generations "-1 days"
update:
	nix flake update
