{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE DeriveGeneric #-}

module Data.Aviation.PilotLogbook.AircraftRegistration(
  AircraftRegistration(..)
) where

import Data.Char.Alpha(Upper)
import Data.Digit(DecDigit)
import GHC.Generics(Generic)
import Papa

data AircraftRegistration =
  VHAircraftRegistration Upper Upper Upper
  | RA DecDigit DecDigit DecDigit DecDigit DecDigit DecDigit
  | Military String
  | Other String
  deriving (Eq, Ord, Show, Generic)
