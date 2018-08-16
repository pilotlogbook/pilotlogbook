{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE DeriveGeneric #-}

module Data.Aviation.PilotLogbook.ExpenseRate(
  ExpenseRate(..)
) where

import GHC.Generics(Generic)
import Papa

data ExpenseRate =
  ExpenseRate
    Int -- quantity
    Int -- rate
  deriving (Eq, Ord, Show, Generic)
