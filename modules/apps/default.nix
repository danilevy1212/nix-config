{ config, lib, pkgs, ... }: {
  # TODO Modulize: https://nixos.wiki/wiki/Module, https://github.com/mjlbach/nix-dotfiles/blob/flakes_v3/nixpkgs/machines/fedora/home.nix
  home.packages = with pkgs; [
    # Proprietary musicality
    spotify

    # Social closeness
    rambox
    skype

    # Browser for the...
    brave
  ];
}
