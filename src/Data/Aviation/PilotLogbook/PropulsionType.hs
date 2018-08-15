{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE DeriveGeneric #-}

module Data.Aviation.PilotLogbook.PropulsionType(
  PropulsionType(..)
) where

import Data.Aviation.PilotLogbook.JetType(JetType)
import GHC.Generics(Generic)
import Natural(Positive)
import Papa

data PropulsionType =
  Piston Positive
  | Jet JetType
  | Electric
  | Rocket
  deriving (Eq, Ord, Show, Generic)
