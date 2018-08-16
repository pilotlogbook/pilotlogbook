{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE DeriveGeneric #-}

module Data.Aviation.PilotLogbook.Sound(
  Sound(..)
) where

import Data.Aviation.PilotLogbook.Caption(Caption)
import Data.Aviation.PilotLogbook.Name(Name)
import Data.Aviation.PilotLogbook.SoundFormat(SoundFormat)
import Data.Aviation.PilotLogbook.Source(Source)
import GHC.Generics(Generic)
import Papa
import Text.URI(URI)

data Sound note =
  Sound
    URI
    SoundFormat
    Name
    Caption
    Source
    note
  deriving (Eq, Ord, Show, Generic)
