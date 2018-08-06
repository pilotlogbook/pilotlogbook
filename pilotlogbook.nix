{ mkDerivation, base, checkers, hedgehog, lens, QuickCheck, stdenv
, tasty, tasty-hedgehog, tasty-hunit, tasty-quickcheck
, transformers
}:
mkDerivation {
  pname = "pilotlogbook";
  version = "0.1.0.1";
  src = ./.;
  libraryHaskellDepends = [ base lens ];
  testHaskellDepends = [
    base checkers hedgehog lens QuickCheck tasty tasty-hedgehog
    tasty-hunit tasty-quickcheck transformers
  ];
  homepage = "https://github.com/pilotlogbook/pilotlogbook";
  description = "Pilot Logbook";
  license = stdenv.lib.licenses.bsd3;
}
