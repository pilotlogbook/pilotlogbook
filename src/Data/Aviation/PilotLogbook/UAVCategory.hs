{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE DeriveGeneric #-}

module Data.Aviation.PilotLogbook.UAVCategory(
  UAVCategory(..)
) where

import Data.Aviation.PilotLogbook.Propulsion(Propulsion)
import GHC.Generics(Generic)
import Natural(Positive)
import Papa

data UAVCategory =
  UAVAeroplane (NonEmpty Propulsion)
  | UAVCopter (NonEmpty Propulsion) Positive {- rotors -}
  | UAVAirship (NonEmpty Propulsion)
  | UAVPoweredLift (NonEmpty Propulsion)
  deriving (Eq, Ord, Show, Generic)
