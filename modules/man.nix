{ config, lib, pkgs, ... }:

{
  programs.man.enable = false;
  home.extraOutputsToInstall = [ "man" ];
}
