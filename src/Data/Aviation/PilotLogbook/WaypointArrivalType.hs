{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE DeriveGeneric #-}

module Data.Aviation.PilotLogbook.WaypointArrivalType(
  WaypointArrivalType(..)
) where

import Data.Aviation.PilotLogbook.Runway(Runway)
import Geodetics.Types.Altitude(Altitude)
import GHC.Generics(Generic)
import Papa

data WaypointArrivalType =
  FullStop Runway
  | TouchAndGo Runway
  | StopAndGo Runway
  | GoAround Runway
  | Overfly (Maybe Altitude)
  deriving (Eq, Ord, Show, Generic)
