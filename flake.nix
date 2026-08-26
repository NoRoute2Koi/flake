{

  description = "flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    bad-apple-plymouth.url = "github:ruanyouxing/bad-apple-plymouth";
    nur.url = "github:nix-community/NUR";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia.url = "github:noctalia-dev/noctalia/e52d10e55c0171fd82f1785719ad6a0e4eac430e";
  };

  outputs =
    inputs@{
      nixpkgs,
      bad-apple-plymouth,
      nur,
      home-manager,
      noctalia,
      ...
    }:
    let
      user = "koishi";
      hostname = "home-pc";
      locale = "en_US.UTF-8";
      timezone = "Europe/Moscow";
      version = "26.11";
    in
    {
      nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit
            inputs
            noctalia
            user
            hostname
            locale
            timezone
            version
            ;
        };
        modules = [
          nur.modules.nixos.default
          home-manager.nixosModules.home-manager
          ./hosts/home-pc/fstab.nix
          ./hosts/home-pc/hardware.nix
          ./hosts/home-pc/boot.nix
          ./modules/base/network.nix
          ./modules/base/user.nix
          ./modules/base/nix.nix
          ./modules/base/locale.nix
          ./modules/packages/dev.nix
          ./modules/packages/online.nix
          ./modules/packages/vpn.nix
          ./modules/packages/media.nix
          ./modules/packages/terminal.nix
          ./modules/desktop/theming.nix
          ./modules/desktop/niri.nix
          ./modules/desktop/noctalia.nix
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = { inherit inputs; };
            };
          }
        ];
      };
    };
}
