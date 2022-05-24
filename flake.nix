{
  description = "Development environment";

  inputs = {
    nixpkgs = { url = "github:NixOS/nixpkgs/nixpkgs-unstable"; };
    flake-utils = { url = "github:numtide/flake-utils"; };
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        inherit (nixpkgs.lib) optional;
        pkgs = import nixpkgs { inherit system; };
        locales = pkgs.glibcLocales;
      in {
        devShell = pkgs.mkShell {
          shellHook = ''
              export VAULT_ADDR="http://127.0.0.1:8200"
          '';
          buildInputs = with pkgs; [ vault terraform ];
        };
      });
}
