{-# LANGUAGE TemplateHaskell #-}

module Data.Aviation.PilotLogbook where

import Control.Lens
import Data.List.NonEmpty

data Coordinate =
  Coordinate
    Double
    Double

data Waypoint =
  Waypoint
    String
    (Maybe Coordinate)
  | VFR
      -- VFR_Waypoint

newtype Runway =
  Runway
    String

data WaypointArrivalType =
  FullStop (Maybe Runway)
  | TouchAndGo (Maybe Runway)
  | StopAndGo (Maybe Runway)
  | GoAround (Maybe Runway)
  | Overfly (Maybe Int) -- height

data WaypointArrival =
  WaypointArrival
    Waypoint
    (NonEmpty WaypointArrivalType)

data WaypointTerminal =
  WaypointTerminal
    Waypoint
    (Maybe Runway)
    
data Route =
  Route
    WaypointTerminal
    [WaypointArrival]
    WaypointTerminal
