#
#  Specific user configuration settings for worker
#
#  flake.nix
#   ├─ common.nix
#   ├─ ./hosts
#   │   └─ ...
#   └─ ./users
#       ├─ ./worker
#       │   ├─ default.nix *
#       │   └─ ...
#       └─ ...
#
{ config, pkgs, ... }:

{
  home-manager = {
    users.worker = import ./home.nix;
  };
  
  # Define a user account.
  users.users.worker = {
    isNormalUser = true;
    initialPassword = "pw321";
    extraGroups =
      [
        "wheel"
        "networkmanager"
        "audio"
        "nixconfig"
        "libvirtd"
        "kvm"
        "input"
      ];
  };
}
