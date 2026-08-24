{ pkgs, inputs, ... }:
{
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    kernel.sysctl."net.ipv4.ip_default_ttl" = 65;
    plymouth = {
      enable = true;
      themePackages = inputs.bad-apple-plymouth.package.${pkgs.system}.plymouth-bad-apple;
      theme = "bad_apple";
    };
    loader.limine = {
      enable = true;
      efiInstallAsRemovable = true;
      maxGenerations = 5;
      style.wallpapers = null;
    };
  };
}
