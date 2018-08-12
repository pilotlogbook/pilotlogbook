{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE DeriveGeneric #-}

module Data.Aviation.PilotLogbook.Route(
  Route(..)
) where

import Data.Aviation.PilotLogbook.WaypointTerminal(WaypointTerminal)
import Data.Aviation.PilotLogbook.WaypointArrival(WaypointArrival)
import GHC.Generics(Generic)
import Papa

data Route note =
  Route
    (WaypointTerminal note)
    [WaypointArrival note]
    (WaypointTerminal note)
    note
  deriving (Eq, Ord, Show, Generic)
