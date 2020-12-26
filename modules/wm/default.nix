{ config, lib, pkgs, ... }: {
  home.packages = with pkgs; [
    # Development.
    stack
    cabal-install
    haskellPackages.hoogle
  ];

  # FIXME
  home.sessionVariables = { STACK_ROOT = "~/.local/share/stack"; };

  # TODO Customize
  services.dunst = {
    enable = true;
    settings = rec {
      global = {
        markup = "none";
        format = "<big><b>%s</b></big>%b";
        sort = false;
        alignment = "left";
        bounce_freq = 0;
        word_wrap = true;
        ignore_newline = false;
        geometry = "450x100-15+49";
        transparency = 10;
        separator_height = 2;
        padding = 12;
        horizontal_padding = 20;
        line_height = 3;
        separator_color = "frame";
        frame_width = 2;
        frame_color = "#EC5F67";
      };

      urgency_normal = {
        foreground = "#CDD3DE";
        background = "#101010";
        timeout = 6;
      };
      urgency_low = urgency_normal;
      urgency_critical = urgency_normal;
    };
  };

  # TODO I may replace this with TaffyBar eventually.
  services.polybar = {
    enable = true;
    package = pkgs.polybar.override { pulseSupport = true; };
    extraConfig = builtins.readFile "${builtins.toString ./.}/config.ini";
    script = builtins.readFile "${builtins.toString ./.}/run-polybar.sh";
  };
}
