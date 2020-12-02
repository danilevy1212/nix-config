let homeDir = builtins.getEnv "HOME";
in { self, config, pkgs, ... }: {
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = builtins.getEnv "USER";
  home.homeDirectory = homeDir;

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.03";

  # Be quiet, will you?
  news.display = "silent";

  imports = [
    # I cannot live without you, my one true love...
    ./modules/emacs.nix

    # Fix for: `can't set the locale; make sure $LC_* and $LANG are correct`
    ./modules/man.nix

    # Networking utilities
    ./modules/networking.nix

    # The functional WM
    ./modules/xmonad.nix
  ];

  # TODO Modulize: https://nixos.wiki/wiki/Module, https://github.com/mjlbach/nix-dotfiles/blob/flakes_v3/nixpkgs/machines/fedora/home.nix
  home.packages = with pkgs; [
    # System
    htop
    neofetch

    # Propietary musicality
    spotify

    # Propietary storage, TODO May switch to gcloud soon.
    dropbox

    # Social closeness
    rambox
  ];

  # Allow fontconfig to discover fonts and configurations installed through home.packages and nix-env
  fonts.fontconfig.enable = true;

  # TODO https://discourse.nixos.org/t/advice-needed-installing-doom-emacs/8806/4 To install my own repos, last comment.
  # ZSH, just as good as eshell
  programs.zsh = {
    enable = true;
    enableCompletion = false;
    dotDir = ".config/nix-zsh";
    initExtra = builtins.readFile "${homeDir}/.config/zsh/.zshrc";
    envExtra = builtins.readFile "${homeDir}/.config/zsh/.zshenv";
    profileExtra = builtins.readFile "${homeDir}/.config/zsh/.zprofile";
  };
}
