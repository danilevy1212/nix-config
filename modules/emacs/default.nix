{ config, lib, pkgs, ... }: {
  # Doom emacs dependencies
  home.packages = with pkgs; [
    # General Dependencies
    fd
    ripgrep

    # Fonts
    hack-font
    dejavu_fonts
    symbola
    # FIXME MISSING Quivera, Noto Sans, Noto Sans Symbols

    # :lang nix
    nixfmt

    # :term eshell
    fish

    # :os
    xclip

    # :checkers
    languagetool
    (aspellWithDicts (dicts: with dicts; [ es en en-computers en-science ]))

    # :tools lookup
    sqlite
    wordnet
  ];

  # I cannot live without you, my one true love...
  programs.emacs = {
    enable = true;
    # For vterm.
    extraPackages = epkgs: [ epkgs.vterm ];
  };

  # FIXME
  home.sessionVariables = { DOOMDIR = "$XDG_CONFIG_HOME/doom"; };
}
