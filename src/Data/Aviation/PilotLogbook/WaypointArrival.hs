{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE DeriveGeneric #-}

module Data.Aviation.PilotLogbook.WaypointArrival(
  WaypointArrival(..)
) where

import Data.Aviation.PilotLogbook.Waypoint(Waypoint)
import Data.Aviation.PilotLogbook.WaypointArrivalType(WaypointArrivalType)
import GHC.Generics(Generic)
import Papa

data WaypointArrival =
  WaypointArrival
    Waypoint
    (NonEmpty WaypointArrivalType)
  deriving (Eq, Ord, Show, Generic)
