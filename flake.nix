{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-26.05";

    flake-parts.url = "github:hercules-ci/flake-parts";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia-greeter = {
      url = "github:noctalia-dev/noctalia-greeter";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      home-manager,
      niri,
      noctalia-greeter,
      ...
    }:
    let
      system = "x86_64-linux";
      stateVersion = "26.05";
      hostName = "nixos";
      defaultUsername = "cutie";

      gitUser = "";
      gitEmail = "";

    in
    {
      nixosConfigurations = {

        base = nixpkgs.lib.nixosSystem {

          inherit system;

          specialArgs = {
            inherit inputs;
            inherit hostName;
            inherit stateVersion;
            inherit defaultUsername;
          };

          modules = [
            ./configs/system
            ./hardware-configuration.nix

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = {
                inherit inputs;
                inherit gitUser;
                inherit gitEmail;
                inherit defaultUsername;
                inherit hostName;
                inherit stateVersion;

              };

              home-manager.users.${defaultUsername} = ./configs/home;
            }
          ];

        };
      };
    };

}
