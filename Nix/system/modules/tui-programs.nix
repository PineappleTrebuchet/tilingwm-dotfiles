{ pkgs, ... }:

{
	environment.systemPackages = with pkgs; [
		btop
		cmatrix
		tmux
		fastfetch
		fzf
		yazi
		vim
		git
		nvtopPackages.intel
		yt-dlp
		wine
		arduino-cli
		pipes
	];
}
