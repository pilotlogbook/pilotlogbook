{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE DeriveGeneric #-}

module Data.Aviation.PilotLogbook where

import Data.Aviation.PilotLogbook.Aircraft
import Data.Aviation.PilotLogbook.AircraftFlightExpense
import Data.Aviation.PilotLogbook.AircraftFlightTime
import Data.Aviation.PilotLogbook.Media
import Data.Aviation.PilotLogbook.Person
import Data.Aviation.PilotLogbook.Route
import Data.Time.Calendar
import GHC.Generics
import Papa

data Command note =
  InCommand
  | Dual (PilotLogbook note)
  | InCommandUnderInstruction (PilotLogbook note)
  deriving (Eq, Ord, Show, Generic)

data AircraftFlight note =
  AircraftFlight
    String -- name
    (Aircraft note)
    (Command note)
    (Route note)
    [PilotLogbook note] -- including PAX
    (AircraftFlightTime note)
    [Media note]
    [AircraftFlightExpense note]
    Bool -- review flight?
    note
  deriving (Eq, Ord, Show, Generic)

----

data Event note =
  AircraftFlightEvent note
  -- Simulator
  -- Exam
  -- Briefing
  -- LicenceIssued
  -- MedicalIssued
  -- ASICIssued
  deriving (Eq, Ord, Show, Generic)

data PilotLogbookEvent note =
  PilotLogbookEvent
    (Event note)
    Day
  deriving (Eq, Ord, Show, Generic)

----

data PilotLogbook note =
  PilotLogbook
    (Person note)
    [PilotLogbookEvent note]
    note
  deriving (Eq, Ord, Show, Generic)

----

data CASALicences =
  Recreational
  | Private
  | Commercial
  | AirlineTransport
  deriving (Eq, Ord, Show, Generic)
