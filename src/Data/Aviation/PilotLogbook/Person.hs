{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE DeriveGeneric #-}

module Data.Aviation.PilotLogbook.Person(
  Person(..)
) where

import Data.Aviation.PilotLogbook.ARN(ARN)
import Data.Aviation.PilotLogbook.Firstname(Firstname)
import Data.Aviation.PilotLogbook.HGFAMembership(HGFAMembership)
import Data.Aviation.PilotLogbook.RAMembership(RAMembership)
import Data.Aviation.PilotLogbook.Surname(Surname)
import Data.Time.Calendar(Day)
import GHC.Generics(Generic)
import Papa

data Person note =
  Person
    (Maybe Firstname)
    (Maybe Surname)
    (Maybe Day)
    (Maybe ARN)
    (Maybe RAMembership)
    (Maybe HGFAMembership)
    note
  deriving (Eq, Ord, Show, Generic)

