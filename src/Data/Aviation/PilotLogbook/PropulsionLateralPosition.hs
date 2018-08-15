{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE DeriveGeneric #-}

module Data.Aviation.PilotLogbook.PropulsionLateralPosition(
  PropulsionLateralPosition(..)
) where

import GHC.Generics(Generic)
import Papa

data PropulsionLateralPosition =
  Centreline
  | RightOfCentreline
  | LeftOfCentreline
  deriving (Eq, Ord, Show, Generic)
