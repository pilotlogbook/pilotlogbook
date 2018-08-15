{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE DeriveGeneric #-}

module Data.Aviation.PilotLogbook.VisualisationFormat(
  VisualisationFormat(..)
) where

import GHC.Generics(Generic)
import Papa

data VisualisationFormat =
  Doarama
  deriving (Eq, Ord, Show, Generic)
