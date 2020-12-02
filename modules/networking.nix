{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [ unixtools.netstat nmap ];
}
