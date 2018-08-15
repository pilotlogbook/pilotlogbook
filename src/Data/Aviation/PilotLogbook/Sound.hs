{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE DeriveGeneric #-}

module Data.Aviation.PilotLogbook.Sound(
  Sound(..)
) where

import Data.Aviation.PilotLogbook.SoundFormat(SoundFormat)
import GHC.Generics(Generic)
import Papa
import Text.URI(URI)

data Sound note =
  Sound
    URI
    SoundFormat
    String -- name
    String -- caption
    String -- source
    note
  deriving (Eq, Ord, Show, Generic)
