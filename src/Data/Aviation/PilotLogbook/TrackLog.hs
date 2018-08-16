{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE DeriveGeneric #-}

module Data.Aviation.PilotLogbook.TrackLog(
  TrackLog(..)
) where

import Data.Aviation.PilotLogbook.Caption(Caption)
import Data.Aviation.PilotLogbook.Name(Name)
import Data.Aviation.PilotLogbook.Source(Source)
import Data.Aviation.PilotLogbook.TrackLogFormat(TrackLogFormat)
import GHC.Generics(Generic)
import Papa
import Text.URI(URI)

data TrackLog note =
  TrackLog
    URI
    TrackLogFormat
    Name
    Caption
    Source
    note
  deriving (Eq, Ord, Show, Generic)
