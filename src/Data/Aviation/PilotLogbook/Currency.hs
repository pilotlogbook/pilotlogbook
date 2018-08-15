{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE DeriveGeneric #-}

module Data.Aviation.PilotLogbook.Currency(
  Currency(..)
) where

import GHC.Generics(Generic)
import Papa

data Currency =
  AUcents
  deriving (Eq, Ord, Show, Generic)
