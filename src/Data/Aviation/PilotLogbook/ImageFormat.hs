{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE DeriveGeneric #-}

module Data.Aviation.PilotLogbook.ImageFormat(
  ImageFormat(..)
) where

import GHC.Generics(Generic)
import Papa

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
