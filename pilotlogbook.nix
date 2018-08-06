{ mkDerivation, base, checkers, geodetic-types, hedgehog, lens
, QuickCheck, stdenv, tasty, tasty-hedgehog, tasty-hunit
, tasty-quickcheck, transformers, vfr-waypoints
}:
mkDerivation {
  pname = "pilotlogbook";
  version = "0.0.1";
  src = ./.;
  libraryHaskellDepends = [ base geodetic-types lens vfr-waypoints ];
  testHaskellDepends = [
    base checkers hedgehog QuickCheck tasty tasty-hedgehog tasty-hunit
    tasty-quickcheck transformers
  ];
  homepage = "https://github.com/pilotlogbook/pilotlogbook";
  description = "Pilot Logbook";
  license = stdenv.lib.licenses.bsd3;
}
