module Curve.Binary.SECT283K1
  -- | Types
  ( F2m
  , P
  -- | Parameters
  , _a
  , _b
  , _f
  , _g
  , _h
  , _n
  ) where

import Protolude

import BinaryField (BinaryField)

import Curve.Binary (BCurve(..), BPoint, Point(..))

-------------------------------------------------------------------------------
-- Types
-------------------------------------------------------------------------------

-- | SECT283K1 curve
data SECT283K1

-- | Field of SECT283K1 curve
type F2m = BinaryField 0x800000000000000000000000000000000000000000000000000000000000000000010a1

-- | SECT283K1 curve is a binary curve
instance BCurve SECT283K1 F2m where
  a_ = const _a
  {-# INLINE a_ #-}
  b_ = const _b
  {-# INLINE b_ #-}
  g_ = _g
  {-# INLINE g_ #-}

-- | Point of SECT283K1 curve
type P = BPoint SECT283K1 F2m

-------------------------------------------------------------------------------
-- Parameters
-------------------------------------------------------------------------------

-- | Coefficient @A@ of SECT283K1 curve
_a :: F2m
_a = 0
{-# INLINE _a #-}

-- | Coefficient @B@ of SECT283K1 curve
_b :: F2m
_b = 1
{-# INLINE _b #-}

-- | Polynomial of SECT283K1 curve
_f :: Integer
_f = 0x800000000000000000000000000000000000000000000000000000000000000000010a1
{-# INLINE _f #-}

-- | Generator of SECT283K1 curve
_g :: P
_g = A
     0x503213f78ca44883f1a3b8162f188e553cd265f23c1567a16876913b0c2ac2458492836
     0x1ccda380f1c9e318d90f95d07e5426fe87e45c0e8184698e45962364e34116177dd2259
{-# INLINE _g #-}

-- | Cofactor of SECT283K1 curve
_h :: Integer
_h = 4
{-# INLINE _h #-}

-- | Order of SECT283K1 curve
_n :: Integer
_n = 0x1ffffffffffffffffffffffffffffffffffe9ae2ed07577265dff7f94451e061e163c61
{-# INLINE _n #-}