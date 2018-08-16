{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE DeriveGeneric #-}

module Data.Aviation.PilotLogbook.Image(
  Image(..)
) where

import Data.Aviation.PilotLogbook.Caption(Caption)
import Data.Aviation.PilotLogbook.ImageFormat(ImageFormat)
import Data.Aviation.PilotLogbook.Name(Name)
import Data.Aviation.PilotLogbook.Source(Source)
import GHC.Generics(Generic)
import Papa
import Text.URI(URI)

data Image note =
  Image
    URI
    ImageFormat
    Name
    Caption
    Source
    note
  deriving (Eq, Ord, Show, Generic)