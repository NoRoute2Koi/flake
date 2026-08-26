{ pkgs, ... }:
{
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = [
      "loglevel=3"
    ];
    kernel.sysctl."net.ipv4.ip_default_ttl" = 65;
    loader.limine = {
      enable = true;
      efiInstallAsRemovable = true;
      maxGenerations = 5;
      style.wallpapers = [ ];
    };
  };
}
