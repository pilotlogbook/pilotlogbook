{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE DeriveGeneric #-}

module Data.Aviation.PilotLogbook.FlightSimulatorType(
  FlightSimulatorType(..)
) where

import GHC.Generics(Generic)
import Papa

newtype FlightSimulatorType =
  FlightSimulatorType
    String
  deriving (Eq, Ord, Show, Generic)
  