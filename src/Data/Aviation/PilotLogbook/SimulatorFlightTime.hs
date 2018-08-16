{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE DeriveGeneric #-}

module Data.Aviation.PilotLogbook.SimulatorFlightTime(
  SimulatorFlightTime(..)
) where

import Data.Aviation.PilotLogbook.SixMinuteTime(SixMinuteTime)
import GHC.Generics(Generic)
import Papa

data SimulatorFlightTime note =
  SimulatorFlightTime
    SixMinuteTime note -- day
    SixMinuteTime note -- night
    SixMinuteTime note -- instrument
  deriving (Eq, Ord, Show, Generic)
