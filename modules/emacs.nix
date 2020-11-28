{ config, lib, pkgs, ... }:

{
  # Doom emacs dependencies
  home.packages = with pkgs; [
    # General Dependencies
    fd
    ripgrep

    # Fonts
    hack-font
    dejavu_fonts

    # :lang nix
    nixfmt

    # :term eshell
    fish
  ];

  # I cannot live without you, my one true love...
  programs.emacs = {
    enable = true;
    # Unfortunately, vterm doesn't work installing it with doom.
    extraPackages = epkgs: [ epkgs.vterm ];
  };
}
