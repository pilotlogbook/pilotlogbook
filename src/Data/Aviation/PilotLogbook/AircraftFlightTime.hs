{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE DeriveGeneric #-}

module Data.Aviation.PilotLogbook.AircraftFlightTime(
  AircraftFlightTime(..)
) where

import Data.Aviation.PilotLogbook.SixMinuteTime(SixMinuteTime)
import GHC.Generics(Generic)
import Papa

data AircraftFlightTime note =
  AircraftFlightTime
    SixMinuteTime note -- day
    SixMinuteTime note -- night
    SixMinuteTime note -- instrument
  deriving (Eq, Ord, Show, Generic)
