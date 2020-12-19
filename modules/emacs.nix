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

    # :lang haskell
    # haskell-language-server
    # FIXME https://github.com/korayal/hls-nix

    # :os
    xclip
  ];

  # I cannot live without you, my one true love...
  programs.emacs = {
    enable = true;
    # For vterm.
    extraPackages = epkgs: [ epkgs.vterm ];
  };
}
