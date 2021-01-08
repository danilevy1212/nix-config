let homeDir = builtins.getEnv "HOME";
in { config, lib, pkgs, ... }: {
  programs.git = {
    enable = true;
    userName = "Daniel Levy Moreno";
    userEmail = "daniellevymoreno@gmail.com";
  };

  # Allow fontconfig to discover fonts and configurations installed through home.packages and nix-env
  fonts.fontconfig.enable = true;

  # ZSH, just as good as eshell
  programs.zsh = {
    enable = true;
    enableCompletion = false;
    dotDir = ".config/nix-zsh"; # NOTE This is just for easier debugging.
    initExtra = builtins.readFile ./zshrc;
    envExtra = builtins.readFile ./zshenv;
    profileExtra = builtins.readFile ./zprofile;
  };

  # A pretty, modern, terminal.
  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        normal = { family = "Hack"; };
        bold = { family = "Hack"; };
        italic = { family = "Hack"; };
        size = 9.0;
      };
      env = { TERM = "alacritty"; };
      window = { gtk_theme_variant = "nordic"; };
      background_opacity = 0.9;
    };
  };

  # Nordic Terminal
  xresources.extraConfig = builtins.readFile (pkgs.fetchzip {
    url = "https://github.com/arcticicestudio/nord-xresources/archive/v0.1.0.tar.gz";
    sha256 = "1bhlhlk5axiqpm6l2qaij0cz4a53i9hcfsvc3hw9ayn75034xr93";
  } + "/src/nord");

  # Networking utilities # TODO unixtools and system should be sustem level.
  home.packages = (with pkgs.unixtools; [ netstat ifconfig ]) ++ (with pkgs; [
    # System
    htop
    neofetch

    # Autocomplete TODO Checkout and contrast with `programs.fzf` option.
    fzf
  ]);
}
