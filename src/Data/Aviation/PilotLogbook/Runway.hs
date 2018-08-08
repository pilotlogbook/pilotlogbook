{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE DeriveDataTypeable #-}

module Data.Aviation.PilotLogbook.Runway(
  Runway(..)
) where

import Data.Data(Data)
import GHC.Generics(Generic)
import Papa

newtype Runway =
  Runway
    String
  deriving (Eq, Ord, Show, Data, Generic)

instance Runway ~ a =>
  Rewrapped Runway a

instance Wrapped Runway where
  type Unwrapped Runway =
    String
  _Wrapped' =
    iso
      (\(Runway x) -> x)
      Runway

instance Semigroup Runway where
instance Monoid Runway where
  mempty =
    Runway ""
  Runway a `mappend` Runway b =
    Runway (case a of
              [] ->
                b
              _ ->
                a)

instance AsEmpty Runway where
  _Empty =
    _Wrapped . _Empty

instance Cons Runway Runway Char Char where
  _Cons =
    prism'
      (\(c, Runway r) -> Runway (c `cons` r))
      (\(Runway r) -> (_Just . _2 %~ Runway) (uncons r))

instance Snoc Runway Runway Char Char where
  _Snoc =
    prism'
      (\(Runway r, c) -> Runway (r `snoc` c))
      (\(Runway r) -> (_Just . _1 %~ Runway) (unsnoc r))

instance Each Runway Runway Char Char where
  each =
    _Wrapped' . each

type instance Index Runway = Int
type instance IxValue Runway = Char
instance Ixed Runway where
  ix i f (Runway r) =
    Runway <$> ix i f r

instance Reversing Runway where
  reversing (Runway r) =
    Runway (reversing r)

instance Plated Runway where
  plate =
    gplate
