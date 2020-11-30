{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Development.
    stack
    cabal-install
    haskellPackages.hoogle

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
