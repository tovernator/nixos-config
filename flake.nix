{
  description = "Personal Nixos Config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/";
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

    umbriel = {
      url = "git+https://github.com/noctalia-dev/umbriel";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      home-manager,
      noctalia-greeter,
      umbriel,
      ...
    }:
    let
      system = "x86_64-linux";
      stateVersion = "26.05";
      hostName = "battlestation";
      defaultUsername = "cutie";
      defaultPassword = "cutie";

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
            inherit defaultPassword;
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
