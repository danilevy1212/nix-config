let homeDir = builtins.getEnv "HOME";
in { config, lib, pkgs, ... }: {
  programs.git = {
    enable = true;
    userName = "Daniel Levy Moreno";
    userEmail = "daniellevymoreno@gmail.com";
  };

  # Allow fontconfig to discover fonts and configurations installed through home.packages and nix-env
  fonts.fontconfig.enable = true;

  # TODO https://discourse.nixos.org/t/advice-needed-installing-doom-emacs/8806/4 To install my own repos, last comment.
  # ZSH, just as good as eshell
  programs.zsh = {
    enable = true;
    enableCompletion = false;
    dotDir = ".config/nix-zsh"; # NOTE This is just for easier debugging.
    initExtra = builtins.readFile ./zshrc;
    envExtra = builtins.readFile ./zshenv;
    profileExtra = builtins.readFile ./zprofile;
  };

  programs.man.enable = false;
  home.extraOutputsToInstall = [ "man" ];

  # Networking utilities
  home.packages = (with pkgs.unixtools; [
    netstat
    ifconfig
  ]) ++ (with pkgs; [
    # System
    htop
    neofetch
  ]);
}
