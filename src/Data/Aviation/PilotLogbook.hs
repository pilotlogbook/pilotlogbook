{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE DeriveGeneric #-}

module Data.Aviation.PilotLogbook where

import Data.Aviation.PilotLogbook.Route
import Data.Char.Alpha
import Data.Digit
import Data.Time.Calendar
import GHC.Generics
import Natural
import Papa
import Text.URI
  
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
  Piston Positive
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
  | UAVCopter (NonEmpty Propulsion) Positive {- rotors -}
  | UAVAirship (NonEmpty Propulsion)
  | UAVPoweredLift (NonEmpty Propulsion)
  deriving (Eq, Ord, Show, Generic)

data UAVControl =
  RemoteUAV
  | AutonomousUAV
  deriving (Eq, Ord, Show, Generic)

data AircraftCategory =
  Aeroplane (NonEmpty Propulsion)
  | Helicopter (NonEmpty Propulsion) Positive {- rotors -}
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

data Aircraft note =
  Aircraft
    AircraftRegistration
    AircraftCategory
    AircraftType
    (Media note)
    note
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

----

data Command note =
  InCommand
  | Dual (PilotLogbook note)
  | InCommandUnderInstruction (PilotLogbook note)
  deriving (Eq, Ord, Show, Generic)

data SixMinuteTime =
  SixMinuteTime
    [DecDigit]
    DecDigit
  deriving (Eq, Ord, Show, Generic)

data AircraftFlightTime note =
  AircraftFlightTime
    SixMinuteTime note -- day
    SixMinuteTime note -- night
    SixMinuteTime note -- instrument
  deriving (Eq, Ord, Show, Generic)

data AircraftFlight note =
  AircraftFlight
    (Aircraft note)
    (Command note)
    (Route note)
    [PilotLogbook note] -- including PAX
    (AircraftFlightTime note)
    [Media note]
    [AircraftFlightExpense note]
    note
  deriving (Eq, Ord, Show, Generic)

----

data CASALicences =
  Recreational
  | Private
  | Commercial
  | AirlineTransport
  deriving (Eq, Ord, Show, Generic)

data ImageFormat =
  Jpeg
  | Png
  | Gif
  | Tif
  | Svg
  | Bmp 
  | Eps
  | Ai
  deriving (Eq, Ord, Show, Generic)

data Image note =
  Image
    URI
    ImageFormat
    String -- name
    String -- caption
    String -- source
    note
  deriving (Eq, Ord, Show, Generic)

data VideoFormat =
  YouTube
  | Vimeo
  | Bambuser
  | Mp4
  | Mpeg
  | WebmVideo
  | Flv
  | Vob
  | Avi
  | Mov
  | OggVideo
  deriving (Eq, Ord, Show, Generic)

data Video note =
  Video
    URI
    VideoFormat
    String -- name
    String -- caption
    String -- source
    note
  deriving (Eq, Ord, Show, Generic)

data SoundFormat =
  Mp3
  | Wav
  | Flac
  | M4a
  | OggSound
  | Wma
  | WebmSound
  deriving (Eq, Ord, Show, Generic)

data Sound note =
  Sound
    URI
    SoundFormat
    String -- name
    String -- caption
    String -- source
    note
  deriving (Eq, Ord, Show, Generic)

data VisualisationFormat =
  Doarama
  deriving (Eq, Ord, Show, Generic)

data Visualisation note =
  Visualisation
    URI
    VisualisationFormat
    String -- name
    String -- caption
    String -- source
    note
  deriving (Eq, Ord, Show, Generic)

data TrackLogFormat =
  Gpx
  | Kml
  | Kmz
  deriving (Eq, Ord, Show, Generic)

data TrackLog note =
  TrackLog
    URI
    TrackLogFormat
    String -- name
    String -- caption
    String -- source
    note
  deriving (Eq, Ord, Show, Generic)

data Media note =
  MediaImage (Image note)
  | MediaVideo (Video note)
  | MediaSound (Sound note)
  | MediaVisualisation (Visualisation note)
  | MediaTrackLog (TrackLog note)
  deriving (Eq, Ord, Show, Generic)

data AircraftFlightExpenseType =
  AircraftFlightRentalExpense
  | AircraftFlightLandingExpense
  | AircraftInstructorExpense
  deriving (Eq, Ord, Show, Generic)

data Currency =
  AUcents
  deriving (Eq, Ord, Show, Generic)

data AircraftFlightExpense note =
  AircraftFlightExpense
    AircraftFlightExpenseType
    Int
    Currency
    String
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
