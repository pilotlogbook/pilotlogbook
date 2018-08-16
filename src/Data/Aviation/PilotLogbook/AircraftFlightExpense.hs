{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE DeriveGeneric #-}

module Data.Aviation.PilotLogbook.AircraftFlightExpense(
  AircraftFlightExpense(..)
) where

import Data.Aviation.PilotLogbook.AircraftFlightExpenseType(AircraftFlightExpenseType)
import Data.Aviation.PilotLogbook.Currency(Currency)
import GHC.Generics(Generic)
import Papa

data AircraftFlightExpense note =
  AircraftFlightExpense
    AircraftFlightExpenseType
    Int
    Currency
    String
    note
  deriving (Eq, Ord, Show, Generic)
