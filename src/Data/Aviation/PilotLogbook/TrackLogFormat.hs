{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE DeriveGeneric #-}

module Data.Aviation.PilotLogbook.TrackLogFormat(
  TrackLogFormat(..)
) where

import GHC.Generics(Generic)
import Papa

data TrackLogFormat =
  Gpx
  | Kml
  | Kmz
  deriving (Eq, Ord, Show, Generic)
