{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DefaultSignatures #-}

module Data.Aviation.PilotLogbook.Waypoint(
  Waypoint(..)
) where

import Data.Aviation.PilotLogbook.Location(Location)
import Data.Aviation.VFR_Waypoints(VFR_Waypoint)
import GHC.Generics(Generic)
import Papa

data Waypoint note =
  LocationWaypoint
    (Location note)
  | VFR
      VFR_Waypoint
      note
  deriving (Eq, Ord, Show, Generic)
