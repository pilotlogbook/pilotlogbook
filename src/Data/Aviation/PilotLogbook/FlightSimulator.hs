{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE DeriveGeneric #-}

module Data.Aviation.PilotLogbook.FlightSimulator(
  FlightSimulator(..)
) where

import Data.Aviation.PilotLogbook.FlightSimulatorType(FlightSimulatorType)
import Data.Aviation.PilotLogbook.Media(Media)
import GHC.Generics(Generic)
import Papa

data FlightSimulator note =
  FlightSimulator
    FlightSimulatorType
    (Media note)
    note
  deriving (Eq, Ord, Show, Generic)
