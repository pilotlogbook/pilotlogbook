{ mkDerivation, alphachar, base, checkers, digit, dimensional
, geodetic-types, hedgehog, lens, natural, papa, QuickCheck, stdenv
, tasty, tasty-hedgehog, tasty-hunit, tasty-quickcheck, time
, transformers, vfr-waypoints
}:
mkDerivation {
  pname = "pilotlogbook";
  version = "0.0.1";
  src = ./.;
  libraryHaskellDepends = [
    alphachar base digit dimensional geodetic-types lens natural papa
    time vfr-waypoints
  ];
  testHaskellDepends = [
    base checkers hedgehog QuickCheck tasty tasty-hedgehog tasty-hunit
    tasty-quickcheck transformers
  ];
  homepage = "https://github.com/pilotlogbook/pilotlogbook";
  description = "Pilot Logbook";
  license = stdenv.lib.licenses.bsd3;
}
