# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # boot stuff
  boot = {
	cleanTmpDir = true;
  	loader = {
  		#efi stuff
		systemd-boot.enable = true;
		timeout = 10;
		efi.canTouchEfiVariables = true;
	};
  };

  fileSystems."/mnt/anime" = {
  	device 	= "/dev/disk/by-uuid/9CFE36E9FE36BAFA";
	fsType 	= "ntfs";
	options	= ["uid=goetzst" "fmask=117" "umask=007" "noatime"];
  };

  hardware.pulseaudio = {
	enable = true;
	systemWide = true;
  };

  nix.gc = {
	automatic	= true;
	dates		= "2 weeks";
  };
  
  # networking stuff
  networking = {
	hostName = "nixos"; # Define your hostname.
	networkmanager.enable = true;  
	firewall = {
		enable = true;
	};
  };

  # Select internationalisation properties.
  i18n = {
	consoleFont = "Lat2-Terminus16";
  	consoleKeyMap = "us";
  	defaultLocale = "en_US.UTF-8";
  };

  # Fonts
  fonts = {
	enableFontDir = true;
	fonts = with pkgs; [
		terminus_font
	];
  };

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  #packages as a base for the system
  environment.systemPackages = with pkgs; [
	# Miscellaneous
	gitAndTools.gitFull
	htop
	i3lock
	openvpn
	#networkmanager_openvpn
	(texlive.combine
	  { inherit (texlive) scheme-full ; })
	traceroute
	unzip
  	wget
	zip

	# multimedia
	alsaLib
	alsaPlugins
	alsaUtils
	pavucontrol

	# shell+terminal stuff
	zsh
	rxvt_unicode

	# haskell
	# windowManager
	haskellPackages.xmobar
	haskellPackages.xmonad
	haskellPackages.xmonad-contrib
	haskellPackages.xmonad-extras
	dmenu
	xlibs.xmessage
	xlibs.xev
	xlibs.xinput
	xlibs.xmodmap
  ];

  # services:
  services = {
	# ovpn connection
	openvpn = {
		servers.ovpn = {
			config = ''
			  client
			  auth-retry nointeract
			  dev ovpn
			  dev-type tun
			  proto udp
        		  remote pool.prd.se.malmo.ovpn.se 1194
        		  remote pool.prd.se.malmo.ovpn.se 1195
        		  remote-random
        		  remote-cert-tls server
        		  cipher AES-256-CBC
        		  pull
        		  nobind
			  auth-user-pass /etc/openvpn/ovpn.se.cred
        		  reneg-sec 432000
        		  resolv-retry infinite
        		  comp-lzo
        		  verb 4
        		  log /tmp/openvpn.log
        		  mute-replay-warnings
        		  replay-window 256
        		  persist-key
        		  persist-tun
        		  ca /etc/openvpn/ovpn-ca.crt
			  tls-auth /etc/openvpn/ovpn-tls.key 1
			  script-security 2
			'';
			autoStart = true;
		};
	};
	# xserver and windowmanager
	xserver = {
		enable = true;
		layout = "us";
		windowManager.xmonad.enableContribAndExtras = true;
		windowManager.xmonad.enable = true;
		windowManager.default = "xmonad";
		desktopManager.default = "none";
		displayManager = {
			slim = {
				enable = true;
				defaultUser = "goetzst";
			};
		};
	  };
  };

  #programs.ssh.startAgent	= true;
  # user
  # make sure config file is the only place to change users
  #users.mutableUsers = false;
  # create user
  users.defaultUserShell = "/var/run/current-system/sw/bin/zsh";
  users.extraUsers.goetzst = {
	createHome = true;
	home = "/home/goetzst";
	description = "stefan";
	extraGroups = [ "wheel" "networkmanager" "audio"];
	useDefaultShell = true;
  };

  # The NixOS release to be compatible with for stateful data such as databases.
  # system.stateVersion = "16.09";

}
