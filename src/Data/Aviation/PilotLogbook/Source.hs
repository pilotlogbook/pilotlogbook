{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE DeriveGeneric #-}

module Data.Aviation.PilotLogbook.Source(
  Source(..)
) where

import GHC.Generics(Generic)
import Papa

newtype Source =
  Source
    String
  deriving (Eq, Ord, Show, Generic)
