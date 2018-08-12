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

data Waypoint note =
  LatLonWaypoint
    String
    (Maybe (Latitude, Longitude))
    note
  | VFR
      VFR_Waypoint
      note
  deriving (Eq, Ord, Show, Generic)
  