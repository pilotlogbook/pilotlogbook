{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE DeriveGeneric #-}

module Data.Aviation.PilotLogbook.ARN (
  ARN(..)
) where

import Data.Digit(DecDigit)
import GHC.Generics(Generic)
import Papa

newtype ARN =
  ARN
    (NonEmpty DecDigit)
  deriving (Eq, Ord, Show, Generic)
