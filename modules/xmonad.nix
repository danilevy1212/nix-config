{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Development.
    stack
    cabal-install
    haskellPackages.hoogle

    # TODO Remove after I make shell.nix for xmonad with this!
    # Dependencies for Haskell Language Server.
    xorg.libX11
    xorg.libXext
    xorg.libXinerama
    xorg.libXrandr
    xorg.libXrender
    xorg.libXScrnSaver
    xorg.libXft
    pkgconfig
  ];
}
