{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Development.
    stack
    cabal-install
    haskellPackages.hoogle
  ];

  home.sessionVariables = {
    STACK_ROOT="$XDG_DATA_HOME/stack";
  };
}
