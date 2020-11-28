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

  # Sorry Stallman... TODO Put this in `config.nix`
  nixpkgs.config.allowUnfree = true;

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

    # Doom emacs dependencies
    fd
    ripgrep
    ## nix-mode
    nixfmt
    ## eshell
    fish
  ];

  # TODO Modulize: https://nixos.wiki/wiki/Module, https://github.com/mjlbach/nix-dotfiles/blob/flakes_v3/nixpkgs/machines/fedora/home.nix
  # I cannot live without you, my one true love...
  programs.emacs = {
    enable = true;
    # Unfortunately, vterm doesn't work installing it with doom.
    extraPackages = epkgs: [ epkgs.vterm ];
  };

  # ZSH, just as good as eshell
  programs.zsh = {
    enable = true;
    enableCompletion = false;
    dotDir = ".config/nix-zsh";
    initExtra = builtins.readFile "${homeDir}/.config/zsh/.zshrc";
    envExtra = builtins.readFile "${homeDir}/.config/zsh/.zshenv";
    profileExtra = builtins.readFile "${homeDir}/.config/zsh/.zprofile";
  };

  # Be quiet, will you?
  news.display = "silent";
}