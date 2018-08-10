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
      rev = "ab84d98fb9b2d50a2b08a255893ec9351706db00";
      sha256 = "0nwaidy06phwq3h8ard2ms2ipzhf99m1dhrm4z27i4hgdx1raxdc";
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
      rev = "6e41e9c638a1349743842056a400797f60122f13";
      sha256 = "1gb6b4dcs3d2rv19gp2kg1rlaccvirr5gphh47q3h57rnnv9rnki";
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
