{ pkgs, ... }:
{
  hm = {
    programs = {
      mpv.enable = true;
      feh.enable = true;
      beets = {
        enable = true;
        settings = {
          directory = "/mnt/data/music-library/";
          library = "/mnt/data/music-library/.musiclibrary.db";
          duplicate_action = "skip";
          quiet = true;
        };
      };
    };
    home.packages = with pkgs; [
      kew
      nicotine-plus
    ];
  };
  services.playerctld.enable = true;
}
