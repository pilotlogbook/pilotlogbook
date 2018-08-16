{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE DeriveGeneric #-}

module Data.Aviation.PilotLogbook where

import Data.Aviation.PilotLogbook.Aircraft
import Data.Aviation.PilotLogbook.AircraftFlightExpense
import Data.Aviation.PilotLogbook.AircraftFlightTime
import Data.Aviation.PilotLogbook.FlightSimulator
import Data.Aviation.PilotLogbook.Media
import Data.Aviation.PilotLogbook.Name
import Data.Aviation.PilotLogbook.Person
import Data.Aviation.PilotLogbook.Route
import Data.Aviation.PilotLogbook.SimulatorFlightExpense
import Data.Aviation.PilotLogbook.SimulatorFlightTime
import Data.Time.Calendar
import GHC.Generics
import Papa

data AircraftFlightCommand note =
  AircraftFlightInCommand
  | AircraftFlightDual (PilotLogbook note)
  | AircraftFlightInCommandUnderInstruction (PilotLogbook note)
  | AircraftFlightReview (PilotLogbook note)
  deriving (Eq, Ord, Show, Generic)

data AircraftFlight note =
  AircraftFlight
    Name
    Day
    (Aircraft note)
    (AircraftFlightCommand note)
    (Route note)
    [PilotLogbook note] -- including PAX
    (AircraftFlightTime note)
    [Media note]
    [AircraftFlightExpense note]
    note
  deriving (Eq, Ord, Show, Generic)

----

data SimulatorFlightCommand note =
  SimulatorFlightInCommand
  | SimulatorFlightUnderInstruction (PilotLogbook note)
  deriving (Eq, Ord, Show, Generic)

data SimulatorFlight note =
  SimulatorFlight
    Name
    Day
    (FlightSimulator note)
    (SimulatorFlightCommand note)
    (SimulatorFlightTime note)
    [Media note]
    [SimulatorFlightExpense note]
    note
  deriving (Eq, Ord, Show, Generic)

----

data Event note =
  AircraftFlightEvent (AircraftFlight note)
  | SimulatorFlightEvent (SimulatorFlight note)
  -- Exam
  -- Briefing
  -- LicenceIssued
  -- MedicalIssued
  -- ASICIssued
  -- GeneralPurchase
  deriving (Eq, Ord, Show, Generic)

----

data PilotLogbook note =
  PilotLogbook
    (Person note)
    [Event note]
    note
  deriving (Eq, Ord, Show, Generic)

----

data CASALicences =
  Recreational
  | Private
  | Commercial
  | AirlineTransport
  deriving (Eq, Ord, Show, Generic)
