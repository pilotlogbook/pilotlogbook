{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE DeriveGeneric #-}

module Data.Aviation.PilotLogbook.Image(
  Image(..)
) where

import Data.Aviation.PilotLogbook.ImageFormat(ImageFormat)
import GHC.Generics(Generic)
import Papa
import Text.URI(URI)

data Image note =
  Image
    URI
    ImageFormat
    String -- name
    String -- caption
    String -- source
    note
  deriving (Eq, Ord, Show, Generic)