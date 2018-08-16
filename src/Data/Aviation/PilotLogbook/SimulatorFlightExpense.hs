{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE DeriveGeneric #-}

module Data.Aviation.PilotLogbook.SimulatorFlightExpense(
  SimulatorFlightExpense(..)
) where

import Data.Aviation.PilotLogbook.ExpenseTotal(ExpenseTotal)
import Data.Aviation.PilotLogbook.SimulatorFlightExpenseType(SimulatorFlightExpenseType)
import Data.Aviation.PilotLogbook.Currency(Currency)
import Data.Aviation.PilotLogbook.Name(Name)
import GHC.Generics(Generic)
import Papa

data SimulatorFlightExpense note =
  SimulatorFlightExpense
    Name
    SimulatorFlightExpenseType
    ExpenseTotal
    Currency
    note
  deriving (Eq, Ord, Show, Generic)
