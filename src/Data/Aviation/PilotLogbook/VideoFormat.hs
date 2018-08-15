{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE DeriveGeneric #-}

module Data.Aviation.PilotLogbook.VideoFormat(
  VideoFormat(..)
) where

import GHC.Generics(Generic)
import Papa

data VideoFormat =
  YouTube
  | Vimeo
  | Bambuser
  | Mp4
  | Mpeg
  | WebmVideo
  | Flv
  | Vob
  | Avi
  | Mov
  | OggVideo
  deriving (Eq, Ord, Show, Generic)
