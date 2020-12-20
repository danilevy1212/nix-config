{ self, config, pkgs, ... }: {
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = builtins.getEnv "USER";
  home.homeDirectory = builtins.getEnv "HOME";

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
    # Ma Shell
    ./modules/cli.nix

    # XDG Base Dir.
    ./modules/xdg.nix

    # Golang
    ./modules/golang.nix

    # I cannot live without you, my one true love...
    ./modules/emacs.nix

    # Fix for: can't set the locale; make sure $LC_* and $LANG are correct`
    ./modules/man.nix

    # Networking utilities
    ./modules/networking.nix

    # Xmonad, the functional WM.
    ./modules/wm.nix

    # The functional lisp
    ./modules/clojure.nix

    # It's all there, in the ☁.
    ./modules/cloud.nix
  ];

  # TODO Modulize: https://nixos.wiki/wiki/Module, https://github.com/mjlbach/nix-dotfiles/blob/flakes_v3/nixpkgs/machines/fedora/home.nix
  home.packages = with pkgs; [
    # System
    htop
    neofetch

    # Propietary musicality
    spotify

    # Social closeness
    rambox
    skype
  ];
}
