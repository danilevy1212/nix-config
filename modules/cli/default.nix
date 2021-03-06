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
      colors = {
        primary = {
          background = "#2e3440";
          foreground = "#d8dee9";
          dim_foreground = "#a5abb6";
        };
        cursor = {
          text = "#2e3440";
          cursor = "#d8dee9";
        };
        vi_mode_cursor = {
          text = "#2e3440";
          cursor = "#d8dee9";
        };
        selection = {
          text = "CellForeground";
          background = "#4c566a";
        };
        search = {
          matches = {
            foreground = "CellBackground";
            background = "#88c0d0";
          };
          bar = {
            background = "#434c5e";
            foreground = "#d8dee9";
          };
        };
        normal = {
          black = "#3b4252";
          red = "#bf616a";
          green = "#a3be8c";
          yellow = "#ebcb8b";
          blue = "#81a1c1";
          magenta = "#b48ead";
          cyan = "#88c0d0";
          white = "#e5e9f0";
        };
        bright = {
          black = "#4c566a";
          red = "#bf616a";
          green = "#a3be8c";
          yellow = "#ebcb8b";
          blue = "#81a1c1";
          magenta = "#b48ead";
          cyan = "#8fbcbb";
          white = "#eceff4";
        };
        dim = {
          black = "#373e4d";
          red = "#94545d";
          green = "#809575";
          yellow = "#b29e75";
          blue = "#68809a";
          magenta = "#8c738c";
          cyan = "#6d96a5";
          white = "#aeb3bb";
        };
      };
    };
  };

  # Autocomplete
  programs.fzf = {
    enable = true;
    enableBashIntegration = false;
    enableFishIntegration = false;
    enableZshIntegration = true;
    defaultCommand = "fd --type f --type l ";
  };

  # Nordic Terminal
  xresources.extraConfig = builtins.readFile (pkgs.fetchzip {
    url =
      "https://github.com/arcticicestudio/nord-xresources/archive/v0.1.0.tar.gz";
    sha256 = "1bhlhlk5axiqpm6l2qaij0cz4a53i9hcfsvc3hw9ayn75034xr93";
  } + "/src/nord");

  # Networking utilities
  home.packages = with pkgs; [
    # System
    neofetch
  ];
}
