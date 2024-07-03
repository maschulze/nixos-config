#
#  Common configuration settings
#
#  flake.nix
#   ├─ common.nix *
#   ├─ ./hosts
#   │   └─ ...
#   └─ ./users
#       └─ ...
#
{ config
, pkgs
, system
, ...
}:

let

in
{

  imports = [
#    ./pkgs/cachix.nix
#    ./pkgs/dvtranscode.nix
#    ./pkgs/rdio-scanner
#    ./pkgs/trunk-recorder
  ];

   nix = {
    settings = {
      tarball-ttl = 300;
      auto-optimise-store = true;
      experimental-features = "nix-command flakes repl-flake";
      trusted-users = [ "root" "@wheel" ];
      sandbox = "relaxed";
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
  };

  # NVIDIA requires nonfree
  nixpkgs.config.allowUnfree = true;
 
  networking.networkmanager.enable = true;
  networking.firewall.enable = false;

  time.timeZone = "Europe/Berlin";

  hardware.bluetooth.enable = true;
  hardware.enableAllFirmware = true;

  hardware.flipperzero.enable = true;

  i18n.defaultLocale = "en_US.UTF-8";

  sound.enable = false; # not needed for pipewire
  hardware.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    jack.enable = true;
    pulse.enable = true;
  };

  environment.systemPackages = with pkgs; [
htop
fastfetch
  ];
}
