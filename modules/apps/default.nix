{ config, lib, pkgs, ... }: {
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
