{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE DeriveGeneric #-}

module Data.Aviation.PilotLogbook.TrackLog(
  TrackLog(..)
) where

import Data.Aviation.PilotLogbook.TrackLogFormat(TrackLogFormat)
import GHC.Generics(Generic)
import Papa
import Text.URI(URI)

data TrackLog note =
  TrackLog
    URI
    TrackLogFormat
    String -- name
    String -- caption
    String -- source
    note
  deriving (Eq, Ord, Show, Generic)
