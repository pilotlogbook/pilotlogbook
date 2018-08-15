{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE DeriveGeneric #-}

module Data.Aviation.PilotLogbook.JetType(
  JetType(..)
) where

import GHC.Generics(Generic)
import Papa

data JetType =
  Turbojet
  | Turbofan
  | Turboprop
  | Ramjet
  | Scramjet
  deriving (Eq, Ord, Show, Generic)
