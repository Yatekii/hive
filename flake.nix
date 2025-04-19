{
  description = "A very basic flake";

  inputs = { nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable"; };

  outputs = { self, nixpkgs }: {
    devShells = nixpkgs.lib.genAttrs [
      "x86_64-linux"
      "aarch64-linux"
      "aarch64-darwin"
      "x86_64-darwin"
    ] (system: {
      default = nixpkgs.legacyPackages.${system}.mkShell {
        packages = [ nixpkgs.legacyPackages.${system}.kicad-unstable ];
      };
    });
  };
}
