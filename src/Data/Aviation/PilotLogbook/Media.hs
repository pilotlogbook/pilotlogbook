{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE DeriveGeneric #-}

module Data.Aviation.PilotLogbook.Media(
  Media(..)
) where

import Data.Aviation.PilotLogbook.Image(Image)
import Data.Aviation.PilotLogbook.Sound(Sound)
import Data.Aviation.PilotLogbook.Video(Video)
import Data.Aviation.PilotLogbook.TrackLog(TrackLog)
import Data.Aviation.PilotLogbook.Visualisation(Visualisation)
import GHC.Generics(Generic)
import Papa

data Media note =
  MediaImage (Image note)
  | MediaVideo (Video note)
  | MediaSound (Sound note)
  | MediaVisualisation (Visualisation note)
  | MediaTrackLog (TrackLog note)
  deriving (Eq, Ord, Show, Generic)
