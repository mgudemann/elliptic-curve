module Curve.Edwards.JubJub
  -- | Types
  ( Fp
  , P
  -- | Parameters
  , _a
  , _d
  , _g
  , _h
  , _n
  , _p
  ) where

import Protolude

import PrimeField (PrimeField)

import Curve.Edwards (ECurve(..), EPoint, Point(..))

-------------------------------------------------------------------------------
-- Types
-------------------------------------------------------------------------------

-- | JubJub curve
data JubJub

-- | Field of JubJub curve
type Fp = PrimeField 0x73eda753299d7d483339d80809a1d80553bda402fffe5bfeffffffff00000001

-- | JubJub curve is an Edwards curve
instance ECurve JubJub Fp where
  a_ = const _a
  {-# INLINE a_ #-}
  d_ = const _d
  {-# INLINE d_ #-}
  g_ = _g
  {-# INLINE g_ #-}

-- | Point of JubJub curve
type P = EPoint JubJub Fp

-------------------------------------------------------------------------------
-- Parameters
-------------------------------------------------------------------------------

-- | Coefficient @A@ of JubJub curve
_a :: Fp
_a = -1
{-# INLINE _a #-}

-- | Coefficient @D@ of JubJub curve
_d :: Fp
_d = 0x2a9318e74bfa2b48f5fd9207e6bd7fd4292d7f6d37579d2601065fd6d6343eb1
{-# INLINE _d #-}

-- | Generator of JubJub curve
_g :: P
_g = A
     0x5183972af8eff38ca624b4df00384882000c546bf2f39ede7f4ecf1a74f976c4
     0x3b43f8472ca2fc2c9e8fcc5abd9dc308096c8707ffa6833b146bad709349702e
{-# INLINE _g #-}

-- | Cofactor of JubJub curve
_h :: Integer
_h = 8
{-# INLINE _h #-}

-- | Order of JubJub curve
_n :: Integer
_n = 0xe7db4ea6533afa906673b0101343b00a6682093ccc81082d0970e5ed6f72cb7
{-# INLINE _n #-}

-- | Characteristic of JubJub curve
_p :: Integer
_p = 0x73eda753299d7d483339d80809a1d80553bda402fffe5bfeffffffff00000001
{-# INLINE _p #-}