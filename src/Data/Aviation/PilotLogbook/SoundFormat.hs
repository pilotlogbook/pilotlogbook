{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE DeriveGeneric #-}

module Data.Aviation.PilotLogbook.SoundFormat(
  SoundFormat(..)
) where

import GHC.Generics(Generic)
import Papa

data SoundFormat =
  Mp3
  | Wav
  | Flac
  | M4a
  | OggSound
  | Wma
  | WebmSound
  deriving (Eq, Ord, Show, Generic)
