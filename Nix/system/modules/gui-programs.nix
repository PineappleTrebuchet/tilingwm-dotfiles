{ pkgs, ... }:

{
	environment.systemPackages = with pkgs; [
		alacritty
		pavucontrol
		steam
		floorp-bin
		ungoogled-chromium
		vesktop
		spotify
		vlc
		vscodium
    libreoffice-fresh
    obs-studio
		kdePackages.kdeconnect-kde
		thunar
		gnome-weather
		blueman
		networkmanagerapplet
	];
}
