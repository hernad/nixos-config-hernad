{
  description = "hernad's NixOS configuration";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    # You can access packages and modules from different nixpkgs revs
    # at the same time. Here's an working example:
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-23.05";

    # Also see the 'unstable-packages' overlay at 'overlays/default.nix'.

    # Home manager
    home-manager.url = "github:nix-community/home-manager/release-23.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    sops-nix.url = "github:mic92/sops-nix";

    impermanence.url = "github:nix-community/impermanence";

    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs-stable";
    };




    # TODO: Add any other flake you might need
    # hardware.url = "github:nixos/nixos-hardware";

    # Shameless plug: looking for a way to nixify your themes and make
    # everything match nicely? Try nix-colors!
    # nix-colors.url = "github:misterio77/nix-colors";
  };

  outputs = { self, nixpkgs, home-manager, nixos-generators, nixpkgs-stable, ... }@inputs:
    let
      inherit (self) outputs;
      forAllSystems = nixpkgs.lib.genAttrs [
        "x86_64-linux"
      ];

      

      mkNixosSystem = modules: nixpkgs.lib.nixosSystem {
        inherit modules;
        specialArgs = { inherit inputs outputs; };
      };

      mkHomeConfiguration = modules: pkgs: home-manager.lib.homeManagerConfiguration {
        inherit modules pkgs;
        extraSpecialArgs = { inherit inputs outputs; };
      };
      lib = nixpkgs.lib;

    in
    rec {
      
      # Custom packages
      # Acessible through 'nix build', 'nix shell', etc
      packages = forAllSystems (system:
        let pkgs = nixpkgs.legacyPackages.${system};
        in import ./pkgs { inherit self nixpkgs pkgs nixos-generators; }
      );

      lib = import ./lib {
          inherit self inputs;
          defaultNixpkgs = nixpkgs-stable;
      };

      # Devshell for bootstrapping
      # Acessible through 'nix develop' or 'nix-shell' (legacy)
      devShells = forAllSystems (system:
        let pkgs = nixpkgs.legacyPackages.${system};
        in import ./shell.nix { inherit pkgs; }
      );

      homeManagerModules = import ./modules/home-manager;
      
      # Your custom packages and modifications, exported as overlays
      overlays = import ./overlays { inherit inputs self nixos-generators nixpkgs; };
      # Reusable nixos modules you might want to export
      # These are usually stuff you would upstream into nixpkgs
      nixosModules = import ./modules/nixos;
      
      
      # Reusable home-manager modules you might want to export
      # These are usually stuff you would upstream into home-manager
      #homeManagerModules = import ./modules/home-manager;

      # NixOS configuration entrypoint
      # Available through 'nixos-rebuild --flake .#your-hostname'
      nixosConfigurations = {
        hped800g3-1 = mkNixosSystem [
           ./hosts/hped800g3-1
        ];

        hped800g3-4 = mkNixosSystem [
            ./hosts/hped800g3-4
        ];
        hped800g3-3 = mkNixosSystem [
            ./hosts/hped800g3-3
        ];
        hpdl380pg8-1 = mkNixosSystem [
            ./hosts/hpdl380pg8-1
        ];
        router = mkNixosSystem [
            ./hosts/router
        ];
        router2 = mkNixosSystem [
            ./hosts/router2
        ];
        guest31 = mkNixosSystem [
            ./hosts/guest31
        ];

        node1 = mkNixosSystem [
            ./hosts/node1
        ];
        node2 = mkNixosSystem [
            ./hosts/node2
        ];
        node3 = mkNixosSystem [
            ./hosts/node3
        ];

        #your-hostname = nixpkgs.lib.nixosSystem {
        #  specialArgs = { inherit inputs outputs; };
        #  modules = [
        #    # > Our main nixos configuration file <
        #    ./nixos/configuration.nix
        #  ];
        #};
      };

      # Standalone home-manager configuration entrypoint
      # Available through 'home-manager --flake .#your-username@your-hostname'
      #homeConfigurations = {
      #  # FIXME replace with your username@hostname
      #  "your-username@your-hostname" = home-manager.lib.homeManagerConfiguration {
      #    pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
      #    extraSpecialArgs = { inherit inputs outputs; };
      #    modules = [
      #      # > Our main home-manager configuration file <
      #      ./home-manager/home.nix
      #    ];
      #  };
      #};

      homeConfigurations = {
        "hernad@hped800g3-4" = mkHomeConfiguration [ ./home-manager/hernad/hped800g3-4.nix ] nixpkgs.legacyPackages."x86_64-linux";
      };

    };
}
