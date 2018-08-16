{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DefaultSignatures #-}

module Data.Aviation.PilotLogbook.Location(
  Location(..)
) where

import Data.Aviation.PilotLogbook.Name(Name)
import Geodetics.Types.Latitude(Latitude)
import Geodetics.Types.Longitude(Longitude)
import GHC.Generics(Generic)
import Papa

data Location note =
  Location
    Name
    (Maybe (Latitude, Longitude))
    note
  deriving (Eq, Ord, Show, Generic)
