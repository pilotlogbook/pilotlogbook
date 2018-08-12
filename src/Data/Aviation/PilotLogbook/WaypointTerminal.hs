{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE DeriveGeneric #-}

module Data.Aviation.PilotLogbook.WaypointTerminal(
  WaypointTerminal(..)
) where

import Data.Aviation.PilotLogbook.Runway(Runway)
import Data.Aviation.PilotLogbook.Waypoint(Waypoint)
import GHC.Generics(Generic)
import Papa

data WaypointTerminal note =
  WaypointTerminal
    (Waypoint note)
    (Maybe Runway)
  deriving (Eq, Ord, Show, Generic)
