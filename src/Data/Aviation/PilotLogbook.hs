{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric #-}

module Data.Aviation.PilotLogbook where

import Data.Aviation.PilotLogbook.Runway
import Data.Aviation.PilotLogbook.Waypoint
import Data.Aviation.VFR_Waypoints(VFR_Waypoint)
import Data.Data(Data)
import Geodetics.Types.Altitude
import Geodetics.Types.Latitude
import Geodetics.Types.Longitude
import GHC.Generics(Generic)
import Papa

data WaypointArrivalType =
  FullStop Runway
  | TouchAndGo Runway
  | StopAndGo Runway
  | GoAround Runway
  | Overfly (Maybe Altitude)

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
