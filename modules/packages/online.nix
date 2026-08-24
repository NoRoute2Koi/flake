{ pkgs, ... }:
{
  hm.programs.chromium = {
    enable = true;
    package = pkgs.nur.repos.lonerOrz.helium;
    extensions = [
      { id = "eimadpbcbfnmbkopoojfekhnkhdbieeh"; } #darkreader
      { id = "nngceckbapebfimnlniiiahkandclblb"; } #bitwarden
    ];
  };

  hm.programs.vesktop = {
    enable = true;
    settings = {
      arRPC = true;
      checkUpdates = false;
      customTitleBar = false;
      disableMinSize = true;
      minimizeToTray = true;
      hardwareAcceleration = true;
      discordBranch = "stable";
    };
    vencord.settings.plugins = {
      FakeNitro.enable = true;
      CallTimer = true;
      MessageLogger = {
        enable = true;
        ignoreSelf = true;
      };
    };
  };
  
}
