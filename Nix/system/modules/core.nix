{ pkgs, ... }:

{
	environment.systemPackages = with pkgs; [
    killall
		home-manager
		openjdk
		ntfs3g # NTFS support
		gcc
		gnumake
		unzip
		wget
		feh

		(python3.withPackages (python-pkgs: with python-pkgs; [
			requests
		]))
	];
}
