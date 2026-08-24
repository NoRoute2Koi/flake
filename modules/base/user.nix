{ pkgs, user, ... }:
{
  users.users.${user} = {
    enable = true;
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "network"
      "audio"
      "video"
    ];
  };
}
