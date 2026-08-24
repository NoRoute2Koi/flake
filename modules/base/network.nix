{ hostname, ... }:
{
  networking = {
    hostName = hostname;
    nameservers = [
      "1.1.1.1"
      "1.0.0.1"
    ];
    networkmanager = {
      enable = true;
      dns = "none";
      wifi.powersave = false;
    };
  };
}
