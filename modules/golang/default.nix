{ config, lib, pkgs, ... }:
{
  programs.go.enable = true;

  # FIXME
  home.sessionVariables = { GOPATH = "$XDG_DATA_HOME/go"; };
}
