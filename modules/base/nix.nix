{
  version,
  user,
  lib,
  ...
}:
{

  imports = [
    (lib.mkAliasOptionModule [ "hm" ] [ "home-manager" "users" user ])
    (lib.mkAliasOptionModule [ "env" ] [ "environment" ])
  ];

  system.stateVersion = version;
  hm.home.stateVersion = version;

  nix = {
    enable = true;
    settings = {
      trusted-users = [ user ];
      always-allow-substitutes = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      max-jobs = 6;
      extra-substituters = [ "https://noctalia.cachix.org" ];
      extra-trusted-public-keys = [
        "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
      ];
    };
  };

  nixpkgs = {
    config.allowUnfree = true;
  };

  programs.nh = {
    enable = true;
    flake = "flake/";
    clean = {
      enable = true;
      dates = "weekly";
    };
  };
}
