{ config, lib, pkgs, ... }: {
  home.packages = with pkgs; [
    nodejs-14_x
    yarn
  ];
}
