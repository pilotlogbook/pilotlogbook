{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE DeriveGeneric #-}

module Data.Aviation.PilotLogbook.AircraftType(
  AircraftType(..)
) where

import GHC.Generics(Generic)
import Papa

newtype AircraftType =
  AircraftType
    String
  deriving (Eq, Ord, Show, Generic)
