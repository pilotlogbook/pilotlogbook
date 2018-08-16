{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE DeriveGeneric #-}

module Data.Aviation.PilotLogbook.Name(
  Name(..)
) where

import GHC.Generics(Generic)
import Papa

newtype Name =
  Name
    String
  deriving (Eq, Ord, Show, Generic)
