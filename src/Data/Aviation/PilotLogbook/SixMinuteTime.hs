{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE DeriveGeneric #-}

module Data.Aviation.PilotLogbook.SixMinuteTime(
  SixMinuteTime(..)
) where

import Data.Digit(DecDigit)
import GHC.Generics(Generic)
import Papa

data SixMinuteTime =
  SixMinuteTime
    [DecDigit]
    DecDigit
  deriving (Eq, Ord, Show, Generic)
