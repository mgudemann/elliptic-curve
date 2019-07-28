module Curve.Weierstrass.BN384
  ( Curve(..)
  , Fq
  , Fr
  , Group(..)
  , P
  , Point(..)
  , WPoint
  , WCurve(..)
  , _a
  , _b
  , _g
  , _h
  , _q
  , _r
  , _x
  , _y
  ) where

import Protolude

import PrimeField (PrimeField)

import Curve (Curve(..))
import Curve.Weierstrass (Point(..), WCurve(..), WPoint)
import Group (Group(..))

-------------------------------------------------------------------------------
-- Types
-------------------------------------------------------------------------------

-- | BN384 curve.
data BN384

-- | Field of points of BN384 curve.
type Fq = PrimeField 0xfffffffffffffffffff2a96823d5920d2a127e3f6fbca024c8fbe29531892c79534f9d306328261550a7cabd7cccd10b

-- | Field of coefficients of BN384 curve.
type Fr = PrimeField 0xfffffffffffffffffff2a96823d5920d2a127e3f6fbca023c8fbe29531892c795356487d8ac63e4f4db17384341a5775

-- | BN384 curve is a Weierstrass curve.
instance WCurve BN384 Fq where
  a_ = const _a
  {-# INLINE a_ #-}
  b_ = const _b
  {-# INLINE b_ #-}
  g_ = _g
  {-# INLINE g_ #-}
  h_ = const _h
  {-# INLINE h_ #-}
  q_ = const _q
  {-# INLINE q_ #-}
  r_ = const _r
  {-# INLINE r_ #-}
  x_ = const _x
  {-# INLINE x_ #-}
  y_ = const _y
  {-# INLINE y_ #-}

-- | Point of BN384 curve.
type P = WPoint BN384 Fq

-------------------------------------------------------------------------------
-- Parameters
-------------------------------------------------------------------------------

-- | Coefficient @A@ of BN384 curve.
_a :: Fq
_a = 0x0
{-# INLINE _a #-}

-- | Coefficient @B@ of BN384 curve.
_b :: Fq
_b = 0x3
{-# INLINE _b #-}

-- | Generator of BN384 curve.
_g :: P
_g = A _x _y
{-# INLINE _g #-}

-- | Cofactor of BN384 curve.
_h :: Integer
_h = 0x1
{-# INLINE _h #-}

-- | Characteristic of BN384 curve.
_q :: Integer
_q = 0xfffffffffffffffffff2a96823d5920d2a127e3f6fbca024c8fbe29531892c79534f9d306328261550a7cabd7cccd10b
{-# INLINE _q #-}

-- | Order of BN384 curve.
_r :: Integer
_r = 0xfffffffffffffffffff2a96823d5920d2a127e3f6fbca023c8fbe29531892c795356487d8ac63e4f4db17384341a5775
{-# INLINE _r #-}

-- | Coordinate @X@ of BN384 curve.
_x :: Fq
_x = 0x1
{-# INLINE _x #-}

-- | Coordinate @Y@ of BN384 curve.
_y :: Fq
_y = 0x2
{-# INLINE _y #-}
