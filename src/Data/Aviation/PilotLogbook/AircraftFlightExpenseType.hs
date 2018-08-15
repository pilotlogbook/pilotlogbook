{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE DeriveGeneric #-}

module Data.Aviation.PilotLogbook.AircraftFlightExpenseType(
  AircraftFlightExpenseType(..)
) where

import GHC.Generics(Generic)
import Papa

data AircraftFlightExpenseType =
  AircraftFlightRentalExpense
  | AircraftFlightLandingExpense
  | AircraftInstructorExpense
  deriving (Eq, Ord, Show, Generic)
