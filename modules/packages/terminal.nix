{ pkgs, ... }:
{
  hm.home.packages = with pkgs; [
    lsd bat 
  ];

  hm.programs.kitty = {
   enable = true;
    shellIntegration.enableFishIntegration = true;
    extraConfig = "include themes/noctalia.conf";
    font = {
      name = "NotoMonoNerdFont-Regular";
      package = pkgs.nerd-fonts."noto";
    };
    settings = {
      cursor_trail = 1;
      cursor_shape = "underline";
      scrollback_lines = -1;
      pixel_scroll = false;
      enable_audio_bell = false;
      tab_bar_style = "separator";
      background_opacity = 0.8;
    };
  };

  hm.programs.fish = {
    enable = true;
    shellInit = "set fish_greeting";
    shellAliases = {
      ls = "lsd -l";
      cat = "bat -p";
      tree = "lsd --tree";
    };
  };

  hm.programs.starship = {
    enable = true;
    enableFishIntegration = true;
    presets = [ "nerd-font-symbols" ];
  };
}
