{ config, pkgs, ... }:

{
	environment.systemPackages = with pkgs; [
		fuzzel
		waybar
		swaynotificationcenter
		wlogout
		swaylock-effects
		wl-clipboard
		autotiling
		sway-audio-idle-inhibit
	];

	# programs.swaylock.enable = false;

	programs.sway = {
		enable = true;
		wrapperFeatures.gtk = true;
	};
}
