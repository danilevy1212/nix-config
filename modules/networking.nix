{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs.unixtools; [ netstat ifconfig ];
}
