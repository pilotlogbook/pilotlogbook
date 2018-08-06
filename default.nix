{ nixpkgs ? import <nixpkgs> {}, compiler ? "default" }:
let
  inherit (nixpkgs) pkgs;
  haskellPackages = if compiler == "default"
                       then pkgs.haskellPackages
                       else pkgs.haskell.packages.${compiler};

  tasty-hedgehog-github = pkgs.fetchFromGitHub {
    owner = "qfpl";
    repo = "tasty-hedgehog";
    rev = "5da389f5534943b430300a213c5ffb5d0e13459e";
    sha256 = "04pmr9q70gakd327sywpxr7qp8jnl3b0y2sqxxxcj6zj2q45q38m";
  };

  vfr-waypoints-github = pkgs.fetchFromGitHub {
    owner = "qfpl";
    repo = "vfr-waypoints";
    rev = "0f4a9228a6abcc09a0b59fd7dca05b9fe833c12f";
    sha256 = "0sf8qf8hna5g6348pj0n422jjng7l9g2bjvwjxg4gxyhjkqqfncv";
  };

  dimensional-github = pkgs.fetchFromGitHub {
    owner = "bjornbm";
    repo = "dimensional";
    rev = "8e1aa6ebd23cdd4b515f1ea44a9820f96ec71083";
    sha256 = "1g6l128fc5grnivqjll74ppr24jw66yhvi0hbiyp66zpgs9a65bx";
  };

  geodetic-types-github = pkgs.fetchFromGitHub {
    owner = "geodetic-types";
    repo = "dimensional";
    rev = "b9cf90cbd4be0a8942ba5f8c1b6244c739ce5ff2";
    sha256 = "0zaid43yl0jyl614n8q5hsg34hgzkkyr6d6ksbvzirs29kp9bq3j";
  };

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
      dimensional =
        if super ? dimensional
        then super.dimensional
        else dimensional-github;
      geodetic-types =
        if super ? geodetic-types
        then super.geodetic-types
        else geodetic-types-github;
    };
  };

  pilotlogbook = modifiedHaskellPackages.callPackage ./pilotlogbook.nix {};
in
  pilotlogbook
