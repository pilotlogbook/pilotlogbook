{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE DeriveGeneric #-}

module Data.Aviation.PilotLogbook.UAVControl(
  UAVControl(..)
) where

import GHC.Generics(Generic)
import Papa

data UAVControl =
  RemoteUAV
  | AutonomousUAV
  deriving (Eq, Ord, Show, Generic)
