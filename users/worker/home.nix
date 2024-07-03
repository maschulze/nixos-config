#
#  Specific user configuration settings for worker
#
#  flake.nix
#   ├─ common.nix
#   ├─ ./hosts
#   │   └─ ...
#   └─ ./users
#       ├─ ./worker
#       │   ├─ home.nix *
#       │   └─ ...
#       └─ ...
#
{ config, pkgs, ... }:

{
  imports = [ ../home.nix ];

  home.stateVersion = "24.05";
}
