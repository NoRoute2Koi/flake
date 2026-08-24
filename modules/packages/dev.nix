{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    config.safe.directory = "*";
  };
  hm.programs.git = {
    enable = true;
    settings = {
      user.name = "noroute2koi";
      user.email = "317158418+NoRoute2Koi@users.noreply.github.com";
    };
  };

  hm.programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {
      theme = "noctalia";
      editor = {
        scrolloff = 3;
        gutters = [
          "line-numbers"
          "diff"
        ];
        color-modes = true;
        file-picker.hidden = false;
      };
    };
    languages.language = [{
        name = "nix";
        auto-format = true;
        formatter.command = "${pkgs.nixfmt}/bin/nixfmt";
      }];
  };
}
