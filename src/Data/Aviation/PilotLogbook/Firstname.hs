{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE DeriveGeneric #-}

module Data.Aviation.PilotLogbook.Firstname(
  Firstname(..)
) where

import GHC.Generics(Generic)
import Papa

newtype Firstname =
  Firstname
    (NonEmpty Char)
  deriving (Eq, Ord, Show, Generic)
