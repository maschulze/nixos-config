#
#  Specific system configuration settings for thinkpad460p
#
#  flake.nix
#   ├─ common.nix
#   ├─ ./hosts
#   │   ├─ thinknix460.nix *
#   │   └─ ...
#   └─ ./users
#       └─ ...
#
{ config, pkgs, lib, nixos-hardware, ... }:

{
  imports = [
    ../users/worker
#    "${nixos-hardware}/lenovo/thinkpad/t420"
#    "${nixos-hardware}/common/pc/ssd"
    ./roles/tseries.nix
    ./roles/encryptedzfs.nix
#    ./roles/tlp.nix
#    ./roles/dnsovertls/resolvedonly.nix
    ../common.nix
  ];

  system.stateVersion = "24.05";

  networking.hostId = "f5836aae";
  networking.hostName = "thinknix460";

  # silence BIOS-related "errors" at boot shown before NixOS stage 1 output (default is 4)
  boot.consoleLogLevel = 3;
}
