{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE DeriveGeneric #-}

module Data.Aviation.PilotLogbook.AircraftCategory(
  AircraftCategory(..)
) where

import Data.Aviation.PilotLogbook.Propulsion(Propulsion)
import Data.Aviation.PilotLogbook.UAVCategory(UAVCategory)
import Data.Aviation.PilotLogbook.UAVControl(UAVControl)
import GHC.Generics(Generic)
import Natural(Positive)
import Papa

data AircraftCategory =
  Aeroplane (NonEmpty Propulsion)
  | Helicopter (NonEmpty Propulsion) Positive {- rotors -}
  | PoweredLift (NonEmpty Propulsion)
  | Gyroplane (NonEmpty Propulsion)
  | Airship (NonEmpty Propulsion)
  | Balloon
  | UAV UAVCategory UAVControl
  | Glider [Propulsion]
  | Paraglider
  | Paramotor (NonEmpty Propulsion)
  | Trike [Propulsion]
  | PoweredParachute (NonEmpty Propulsion)
  | Hangglider
  deriving (Eq, Ord, Show, Generic)
