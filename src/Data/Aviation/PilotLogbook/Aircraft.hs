{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE DeriveGeneric #-}

module Data.Aviation.PilotLogbook.Aircraft(
  Aircraft(..)
) where

import Data.Aviation.PilotLogbook.AircraftCategory(AircraftCategory)
import Data.Aviation.PilotLogbook.AircraftRegistration(AircraftRegistration)
import Data.Aviation.PilotLogbook.AircraftType(AircraftType)
import Data.Aviation.PilotLogbook.Media(Media)
import GHC.Generics(Generic)
import Papa

data Aircraft note =
  Aircraft
    AircraftRegistration
    AircraftCategory
    AircraftType
    (Media note)
    note
  deriving (Eq, Ord, Show, Generic)
