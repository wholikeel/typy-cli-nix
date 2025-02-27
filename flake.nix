{
  description = "typy-cli";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, utils, ... }@inputs: utils.lib.eachDefaultSystem
    (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShells.default = pkgs.callPackage ./shell.nix { };
        packages = {
            default = pkgs.callPackage ./default.nix { };
            setup = pkgs.callPackage ./setup-resources.nix { };
        };

        apps = {
          default = {
            type = "app";
            program = "${self.packages.${system}.default}/bin/typy-cli";
          };
          setup = {
            type = "app";
            program = "${self.packages.${system}.setup}/bin/typy-cli-setup";
          };
        };
      });
}

