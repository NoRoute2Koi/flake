{
  services.syncthing = {
    enable = true;
    settings = {
      devices."iqoo" = {
        id = "";
        autoAcceptFolders = true;
      };
    };
  };
}
