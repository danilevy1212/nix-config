{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    # File management.
    spaceFM
  ];

  # Connect up to external devices.
  services.udiskie.enable = true;

  # I 💙 bluetooth.
  services.blueman-applet.enable = true;

  # I ❤ Internet
  services.network-manager-applet.enable = true;
}
