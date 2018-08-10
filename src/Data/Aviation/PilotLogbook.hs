{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE DeriveGeneric #-}

module Data.Aviation.PilotLogbook where

import Data.Char.Alpha
import Data.Digit
import Data.Time.Calendar
import GHC.Generics
import Natural
import Papa

data AircraftRegistration =
  VHAircraftRegistration Upper Upper Upper
  | RA DecDigit DecDigit DecDigit DecDigit DecDigit DecDigit
  | Military String
  | Other String
  deriving (Eq, Ord, Show, Generic)

data JetType =
  Turbojet
  | Turbofan
  | Turboprop
  | Ramjet
  | Scramjet
  deriving (Eq, Ord, Show, Generic)

data PropulsionLateralPosition =
  Centreline
  | RightOfCentreline
  | LeftOfCentreline
  deriving (Eq, Ord, Show, Generic)

data PropulsionType =
  Piston Natural
  | Jet JetType
  | Electric
  | Rocket
  deriving (Eq, Ord, Show, Generic)

data Propulsion =
  Propulsion
    PropulsionType
    PropulsionLateralPosition
    (Maybe String) -- name
  deriving (Eq, Ord, Show, Generic)

data UAVCategory =
  UAVAeroplane (NonEmpty Propulsion)
  | UAVCopter (NonEmpty Propulsion) Natural {- rotors -}
  | UAVAirship (NonEmpty Propulsion)
  | UAVPoweredLift (NonEmpty Propulsion)
  deriving (Eq, Ord, Show, Generic)

data UAVControl =
  RemoteUAV
  | AutonomousUAV
  deriving (Eq, Ord, Show, Generic)

data AircraftCategory =
  Aeroplane (NonEmpty Propulsion)
  | Helicopter (NonEmpty Propulsion) Natural {- rotors -}
  | PoweredLift (NonEmpty Propulsion)
  | Gyroplane (NonEmpty Propulsion)
  | Airship (NonEmpty Propulsion)
  | Balloon
  | UAV UAVCategory UAVControl
  | Glider [Propulsion]
  | Paraglider
  | Paramotor (NonEmpty Propulsion)
  | Trike [Propulsion]
  | PoweredParachute (NonEmpty Propulsion)
  | Hangglider
  deriving (Eq, Ord, Show, Generic)

newtype AircraftType =
  AircraftType
    String
  deriving (Eq, Ord, Show, Generic)

data Aircraft =
  Aircraft
    AircraftRegistration
    AircraftCategory
    AircraftType
    String -- notes
  deriving (Eq, Ord, Show, Generic)

----

newtype ARN =
  ARN
    (NonEmpty DecDigit)
  deriving (Eq, Ord, Show, Generic)

newtype RAMembership =
  RAMembership
    (NonEmpty DecDigit)
  deriving (Eq, Ord, Show, Generic)

newtype HGFAMembership =
  HGFAMembership
    (NonEmpty DecDigit)
  deriving (Eq, Ord, Show, Generic)

newtype Firstname =
  Firstname
    (NonEmpty Char)
  deriving (Eq, Ord, Show, Generic)

newtype Surname =
  Surname
    (NonEmpty Char)
  deriving (Eq, Ord, Show, Generic)

data Aviator =
  Aviator
    (Maybe Firstname)
    (Maybe Surname)
    (Maybe Day)
    (Maybe ARN)
    (Maybe RAMembership)
    (Maybe HGFAMembership)
    String -- notes
  deriving (Eq, Ord, Show, Generic)

----

data CASALicences =
  Recreational
  | Private
  | Commercial
  | AirlineTransport
  deriving (Eq, Ord, Show, Generic)
