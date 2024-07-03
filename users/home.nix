#
#  Specific user configuration settings for all users
#
#  flake.nix
#   ├─ common.nix
#   ├─ ./hosts
#   │   └─ ...
#   └─ ./users
#       ├─ home.nix *
#       └─ ...
#
{ pkgs, ... }:

let

  sessionVariables = {};

  shellAliases = {
    ls = "ls --color=auto";
  };

in

{
  nixpkgs.config.allowUnfree = true;

  programs.bash = {
    enable = true;
    shellAliases = shellAliases;
    sessionVariables = sessionVariables;
    enableCompletion = true;
  };
}
