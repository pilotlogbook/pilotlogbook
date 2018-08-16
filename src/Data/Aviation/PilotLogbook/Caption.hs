{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE DeriveGeneric #-}

module Data.Aviation.PilotLogbook.Caption(
  Caption(..)
) where

import GHC.Generics(Generic)
import Papa

newtype Caption =
  Caption
    String
  deriving (Eq, Ord, Show, Generic)
