{ nixpkgs ? import <nixpkgs> {}, compiler ? "default" }:
let
  inherit (nixpkgs) pkgs;
  haskellPackages = if compiler == "default"
                       then pkgs.haskellPackages
                       else pkgs.haskell.packages.${compiler};

  tasty-hedgehog-github = pkgs.callPackage (pkgs.fetchFromGitHub {
    owner = "qfpl";
    repo = "tasty-hedgehog";
    rev = "5da389f5534943b430300a213c5ffb5d0e13459e";
    sha256 = "04pmr9q70gakd327sywpxr7qp8jnl3b0y2sqxxxcj6zj2q45q38m";
  }) {};

  vfr-waypoints-github = pkgs.callPackage (pkgs.fetchFromGitHub {
    owner = "qfpl";
    repo = "vfr-waypoints";
    rev = "0f4a9228a6abcc09a0b59fd7dca05b9fe833c12f";
    sha256 = "0sf8qf8hna5g6348pj0n422jjng7l9g2bjvwjxg4gxyhjkqqfncv";
  }) {};

  modifiedHaskellPackages = haskellPackages.override {
    overrides = self: super: {
      tasty-hedgehog =
        if super ? tasty-hedgehog
        then super.tasty-hedgehog
        else tasty-hedgehog-github;
      vfr-waypoints =
        if super ? vfr-waypoints
        then super.vfr-waypoints
        else vfr-waypoints-github;
    };
  };

  pilotlogbook = modifiedHaskellPackages.callPackage ./pilotlogbook.nix {};
in
  pilotlogbook
