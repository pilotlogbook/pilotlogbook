{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE DeriveGeneric #-}

module Data.Aviation.PilotLogbook.Visualisation(
  Visualisation(..)
) where

import Data.Aviation.PilotLogbook.VisualisationFormat(VisualisationFormat)
import GHC.Generics(Generic)
import Papa
import Text.URI(URI)

data Visualisation note =
  Visualisation
    URI
    VisualisationFormat
    String -- name
    String -- caption
    String -- source
    note
  deriving (Eq, Ord, Show, Generic)

