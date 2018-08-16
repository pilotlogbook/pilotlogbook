{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE DeriveGeneric #-}

module Data.Aviation.PilotLogbook.Propulsion(
  Propulsion(..)
) where

import Data.Aviation.PilotLogbook.Name(Name)
import Data.Aviation.PilotLogbook.PropulsionLateralPosition(PropulsionLateralPosition)
import Data.Aviation.PilotLogbook.PropulsionType(PropulsionType)
import GHC.Generics(Generic)
import Papa

data Propulsion =
  Propulsion
    Name
    PropulsionType
    PropulsionLateralPosition
  deriving (Eq, Ord, Show, Generic)
