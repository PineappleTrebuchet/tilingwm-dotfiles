{ pkgs, ... }:

{
	fonts.packages = with pkgs; [
		nerd-fonts.hack
		nerd-fonts.geist-mono
		nerd-fonts.space-mono
	];

	environment.systemPackages = with pkgs; [
	];
}
