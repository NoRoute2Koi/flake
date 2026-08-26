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
    home.packages = with pkgs; [
      kew
      nicotine-plus
    ];
  };
  services.playerctld.enable = true;
}
