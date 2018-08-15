{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE DeriveGeneric #-}

module Data.Aviation.PilotLogbook.HGFAMembership(
  HGFAMembership(..)
) where

import Data.Digit(DecDigit)
import GHC.Generics(Generic)
import Papa

newtype HGFAMembership =
  HGFAMembership
    (NonEmpty DecDigit)
  deriving (Eq, Ord, Show, Generic)
