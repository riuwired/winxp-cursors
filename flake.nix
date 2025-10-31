{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = nixpkgs.legacyPackages.${system};

        winxpCursorDerivation = pkgs.callPackage ./. {
          inherit (pkgs) stdenv lib fetchzip;
        };
      in {
        packages.default = winxpCursorDerivation;
        packages.winxp-cursor-theme = winxpCursorDerivation;
      }
    );
}
