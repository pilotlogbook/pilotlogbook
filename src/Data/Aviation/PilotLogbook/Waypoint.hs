{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DefaultSignatures #-}

module Data.Aviation.PilotLogbook.Waypoint(
  Waypoint(..)
) where

import Data.Aviation.VFR_Waypoints(VFR_Waypoint)
import Geodetics.Types.Latitude(Latitude)
import Geodetics.Types.Longitude(Longitude)
import GHC.Generics(Generic)
import Papa

data Waypoint =
  LatLonWaypoint
    String
    (Maybe (Latitude, Longitude))
  | VFR
      VFR_Waypoint
  deriving (Eq, Ord, Show, Generic)
  