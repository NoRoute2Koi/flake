{ pkgs, user, ... }:
{
  users.users.${user} = {
    enable = true;
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = [
      "wheel"
      "network"
      "audio"
      "video"
    ];
  };
}
