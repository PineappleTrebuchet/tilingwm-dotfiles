# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
	imports =
		[ # Include the results of the hardware scan.
      ./hardware-configuration.nix
			./modules/bundle.nix
			./firewall.nix
		];

	# Delete packages older than 30d
	nix.gc = {
		automatic = true;
		dates = "weekly";
		options = "--delete-older-than 30d";
	};

	# Someone tell me why the f#ck this isn't on by default
	services.envfs.enable = true;
	programs.nix-ld.enable = true;
	programs.nix-ld.libraries = with pkgs; [
		# Add any missing dynamic libraries for unpackaged
		# programs here, NOT in environment.systemPackages
	];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.initrd.luks.devices."luks-ba619d24-5e08-479f-b4ca-e93e54087ae7".device = "/dev/disk/by-uuid/ba619d24-5e08-479f-b4ca-e93e54087ae7";
  networking.hostName = "tpt14g5"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

	# Tailscale
	services.tailscale.enable = true;

	# Nix flakes
	nix.settings.experimental-features = [ "nix-command" "flakes"];

	# 32-bit graphics
	hardware.graphics = {
		enable = true;
		enable32Bit = true;
	};

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  # services.xserver.enable = true;
	programs.xwayland.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
	services.pulseaudio.enable = false;
	security.rtkit.enable = true;
	 services.pipewire = {
			enable = true;
			alsa.enable = true;
			alsa.support32Bit = true;
			pulse.enable = true;
			wireplumber.enable = true;
	   # If you want to use JACK applications, uncomment this
	   # jack.enable = true;

	   # use the example session manager (no others are packaged yet so this is enabled by default,
	   # no need to redefine it in your config for now)
	   #media-session.enable = true;
	};

	xdg.portal = {
		enable = true;
		wlr = {
			enable = true;
			settings = {
				screencast = {
					max_fps = 30;
					chooser_type = "dmenu";
					chooser_cmd = "${pkgs.fuzzel}/bin/fuzzel --dmenu --prompt \"share> \"";
					exec_before = "${pkgs.swaynotificationcenter}/bin/swaync-client -dnd-on";
					exec_after = "${pkgs.swaynotificationcenter}/bin/swaync-client -dnd-off";
				};
			};
		};
	};

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

	# Enable zsh
  programs.zsh = {
    enable = true;
    shellAliases = {
      vi = "nvim";
      vim = "nvim";
    };
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."cocotreb" = {
    isNormalUser = true;
		shell = pkgs.zsh;
    description = "cocotreb";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    #  thunderbird
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

	# Bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        # Shows battery charge of connected devices on supported
        # Bluetooth adapters. Defaults to 'false'.
        Experimental = true;
        # When enabled other devices can connect faster to us, however
        # the tradeoff is increased power consumption. Defaults to
        # 'false'.
        FastConnectable = false;
      };
      Policy = {
        # Enable all controllers when they are found. This includes
        # adapters present on start as well as adapters that are plugged
        # in later on. Defaults to 'true'.
        AutoEnable = true;
      };
    };
  };

  # Greetd + TUIGreet
  services.greetd = {
  enable = true;
  settings = {
    default_session = {
      command = "${pkgs.tuigreet}/bin/tuigreet --time -r --cmd ${pkgs.writeShellScript "start-sway" ''
        export XDG_CURRENT_DESKTOP=sway
				export XDG_SESSION_TYPE=wayland
        exec ${pkgs.sway}/bin/sway "$@"
      ''}";
      user = "greeter";
    };
  };
};

  # Fprintd
  services.fprintd.enable = true;
	security.pam.services.swaylock.fprintAuth = false;
	security.pam.services.greetd.fprintAuth = false;

	# Other services
  services.gnome.gnome-keyring.enable = true;
	security.polkit.enable = true;
	services.gvfs.enable = true;
	services.tumbler.enable = true;

	# Power profiles
	services.power-profiles-daemon.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "26.11"; # Did you read the comment?
}
