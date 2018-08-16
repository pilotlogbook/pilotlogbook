{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE DeriveGeneric #-}

module Data.Aviation.PilotLogbook.ExpenseTotal(
  ExpenseTotal(..)
) where

import Data.Aviation.PilotLogbook.ExpenseRate(ExpenseRate)
import GHC.Generics(Generic)
import Papa

data ExpenseTotal =
  RatedTotal ExpenseRate
  | ValueTotal Int
  deriving (Eq, Ord, Show, Generic)
