{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE DeriveGeneric #-}

module Data.Aviation.PilotLogbook.Surname(
  Surname(..)
) where

import GHC.Generics(Generic)
import Papa

newtype Surname =
  Surname
    (NonEmpty Char)
  deriving (Eq, Ord, Show, Generic)
