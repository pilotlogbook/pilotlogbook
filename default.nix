{ nixpkgs ? import <nixpkgs> {}, compiler ? "default" }:
let
  inherit (nixpkgs) pkgs;
  haskellPackages = if compiler == "default"
                       then pkgs.haskellPackages
                       else pkgs.haskell.packages.${compiler};

  sources = {
    vfr-waypoints = pkgs.fetchFromGitHub {
      owner = "qfpl";
      repo = "vfr-waypoints";
      rev = "0f4a9228a6abcc09a0b59fd7dca05b9fe833c12f";
      sha256 = "0sf8qf8hna5g6348pj0n422jjng7l9g2bjvwjxg4gxyhjkqqfncv";
    };

    hedgehog = pkgs.fetchFromGitHub {
      owner  = "hedgehogqa";
      repo   = "haskell-hedgehog";
      rev    = "0.6";
      sha256 = "101bxgnxdmjg6x5jdjgbzayb747lxv8yv28bjg0kr6xw4kqi8kpw";
    };

    tasty-hedgehog = pkgs.fetchFromGitHub {
      owner  = "qfpl";
      repo   = "tasty-hedgehog";
      rev    = "9797ca980e547c160b5e9e3f07d7b0d1d5c40fee";
      sha256 = "039r8hay6cyq762ajn89nj4bfgz50br15x4nkracw3kzdyikn5xh";
    };

    dimensional = pkgs.fetchFromGitHub {
      owner = "bjornbm";
      repo = "dimensional";
      rev = "8e1aa6ebd23cdd4b515f1ea44a9820f96ec71083";
      sha256 = "1g6l128fc5grnivqjll74ppr24jw66yhvi0hbiyp66zpgs9a65bx";
    };

    geodetic-types = pkgs.fetchFromGitHub {
      owner = "qfpl";
      repo = "geodetic-types";
      rev = "b9cf90cbd4be0a8942ba5f8c1b6244c739ce5ff2";
      sha256 = "0zaid43yl0jyl614n8q5hsg34hgzkkyr6d6ksbvzirs29kp9bq3j";
    };

    alphachar = pkgs.fetchFromGitHub {
      owner = "qfpl";
      repo = "alphachar";
      rev = "0402a8d58b1b0f626d5583109f5c6dfd60a84bb0";
      sha256 = "14j7g52rdqw04zhfk1qykmnga69l1ljiq0d2wimh9dhz0lp6wkhs";
    };

  };

  modifiedHaskellPackages = haskellPackages.override {
    overrides = self: super: {
      vfr-waypoints = import sources.vfr-waypoints { inherit nixpkgs compiler; };
      hedgehog = super.callCabal2nix "hedgehog" "${sources.hedgehog}/hedgehog" {};
      tasty-hedgehog = super.callCabal2nix "tasty-hedgehog" "${sources.tasty-hedgehog}" {};
      dimensional = super.callCabal2nix "dimensional" "${sources.dimensional}" {};
      geodetic-types = import sources.geodetic-types { inherit nixpkgs compiler; };
      alphachar = import sources.alphachar { inherit nixpkgs compiler; };
    };
  };

  pilotlogbook = modifiedHaskellPackages.callPackage ./pilotlogbook.nix {};
in
  pilotlogbook
