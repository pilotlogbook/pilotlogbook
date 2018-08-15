{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE DeriveGeneric #-}

module Data.Aviation.PilotLogbook.Video(
  Video(..)
) where

import Data.Aviation.PilotLogbook.VideoFormat(VideoFormat)
import GHC.Generics(Generic)
import Papa
import Text.URI(URI)

data Video note =
  Video
    URI
    VideoFormat
    String -- name
    String -- caption
    String -- source
    note
  deriving (Eq, Ord, Show, Generic)
