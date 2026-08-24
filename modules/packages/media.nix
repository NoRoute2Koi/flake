{ pkgs, ... }:
{
  hm = {
    programs = {
      mpv.enable = true;
      feh.enable = true;
      beets = {
        enable = true;
        settings.directory = "/mnt/data/music-library/";
      };
    };
    home.packages = with pkgs; [ kew ];
  };
  services.playerctld.enable = true;
}
