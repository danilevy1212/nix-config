{ config, lib, pkgs, ... }:

{
  programs.go.enable = true;

  # FIXME
  home.sessionVariables = {
    GOPATH="~/.local/share/go";
  };
}
