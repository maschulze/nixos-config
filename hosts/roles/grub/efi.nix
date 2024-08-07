#
#  Configuration settings for encrypted ZFS
#
#  flake.nix
#   ├─ common.nix
#   ├─ ./hosts
#   │   ├─ ./roles
#   │   |   ├─ ./grub
#   │   |   |   └─ efi.nix *
#   │   |   └─ ...
#   │   └─ ...
#   └─ ./users
#       └─ ...
#
{ ... }:

{
  # Use GRUB, assume UEFI
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.devices = [ "nodev" ];
  boot.loader.grub.efiInstallAsRemovable = true;
  boot.loader.grub.efiSupport = true;
  # boot.loader.grub.splashImage = ./alwaysnix.png;
  boot.loader.grub.splashMode = "stretch"; # "normal"
  boot.loader.grub.useOSProber = true;
  boot.loader.timeout = 60;

  # copyKernels: "Using NixOS on a ZFS root file system might result in the
  # boot error external pointer tables not supported when the number of
  # hardlinks in the nix store gets very high.
  boot.loader.grub.copyKernels = true;

}
