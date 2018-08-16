{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE DeriveGeneric #-}

module Data.Aviation.PilotLogbook.SimulatorFlightExpenseType(
  SimulatorFlightExpenseType(..)
) where

import GHC.Generics(Generic)
import Papa

data SimulatorFlightExpenseType =
  SimulatorFlightRentalExpense
  | SimulatorInstructorExpense
  deriving (Eq, Ord, Show, Generic)
