{ pkgs, ... }:

{
	environment.systemPackages = with pkgs; [
    killall
		python3
		home-manager
		openjdk
		ntfs3g # NTFS support
		gcc
		gnumake
		unzip
		wget
		feh
	];

	services.gvfs.enable = true;
	services.tumbler.enable = true;
	services.xserver.displayManager.lightdm.enable = true;
}
