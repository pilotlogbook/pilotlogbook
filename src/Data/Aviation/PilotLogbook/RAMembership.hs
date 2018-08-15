{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE DeriveGeneric #-}

module Data.Aviation.PilotLogbook.RAMembership(
  RAMembership(..)
) where

import Data.Digit(DecDigit)
import GHC.Generics(Generic)
import Papa

newtype RAMembership =
  RAMembership
    (NonEmpty DecDigit)
  deriving (Eq, Ord, Show, Generic)
