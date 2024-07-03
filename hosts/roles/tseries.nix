#
#  Specific system configuration settings for Lenovo T-Series
#
#  flake.nix
#   ├─ common.nix
#   ├─ ./hosts
#   │   ├─ ./roles
#   │   │   ├─ tseries.nix *
#   │   │   └─ ...
#   │   └─ ...
#   └─ ./users
#       └─ ...
#
{ ... }:

{

  boot.initrd.availableKernelModules =
    [ "ehci_pci" "ahci" "usb_storage" "sd_mod" "sdhci_pci" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

}
