{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE DeriveGeneric #-}

module Data.Aviation.PilotLogbook.Visualisation(
  Visualisation(..)
) where

import Data.Aviation.PilotLogbook.Caption(Caption)
import Data.Aviation.PilotLogbook.Name(Name)
import Data.Aviation.PilotLogbook.Source(Source)
import Data.Aviation.PilotLogbook.VisualisationFormat(VisualisationFormat)
import GHC.Generics(Generic)
import Papa
import Text.URI(URI)

data Visualisation note =
  Visualisation
    URI
    VisualisationFormat
    Name
    Caption
    Source
    note
  deriving (Eq, Ord, Show, Generic)

