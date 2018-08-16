{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE DeriveGeneric #-}

module Data.Aviation.PilotLogbook.Video(
  Video(..)
) where

import Data.Aviation.PilotLogbook.Caption(Caption)
import Data.Aviation.PilotLogbook.Name(Name)
import Data.Aviation.PilotLogbook.Source(Source)
import Data.Aviation.PilotLogbook.VideoFormat(VideoFormat)
import GHC.Generics(Generic)
import Papa
import Text.URI(URI)

data Video note =
  Video
    URI
    VideoFormat
    Name
    Caption
    Source
    note
  deriving (Eq, Ord, Show, Generic)
