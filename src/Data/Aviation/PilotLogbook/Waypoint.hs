{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE DeriveGeneric #-}

module Data.Aviation.PilotLogbook.Waypoint(
  Waypoint(..)
, AsWaypoint(..)
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
  
class AsWaypoint a where
  _Waypoint ::
    Prism' a Waypoint
  _LatLonWaypoint ::
    Prism' a (String, Maybe (Latitude, Longitude))
  _VFR ::
    Prism' a VFR_Waypoint
  _LatLonWaypoint =
    _Waypoint . _LatLonWaypoint
  _VFR =
    _Waypoint . _VFR

instance AsWaypoint Waypoint where
  _Waypoint =
    id
  _LatLonWaypoint =
    prism
      (\(lat, lon)
        -> LatLonWaypoint lat lon)
      (\x ->
        case x of
          LatLonWaypoint lat lon -> Right (lat, lon)
          _ -> Left x)
  _VFR =
    prism
      VFR
      (\x ->
        case x of
          VFR w -> Right w
          _ -> Left x)
