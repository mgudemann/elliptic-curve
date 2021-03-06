module Generate.Weierstrass.Curve
  ( prettyCurve
  ) where

import Protolude

import Text.PrettyPrint.Leijen.Text

import Generate.Curve
import Generate.Pretty
import Generate.Weierstrass.Types

-------------------------------------------------------------------------------
-- Curve
-------------------------------------------------------------------------------

prettyImports :: Text -> Types -> Doc
prettyImports name Types{..}
  =    "module Data.Curve.Weierstrass." <> pretty name
  <$$> indent 2
    (    "( module Data.Curve.Weierstrass"
    <$$> ", Point(..)"
    <$$> "-- *" <+> pretty curve <+> "curve"
    <$$> ", module Data.Curve.Weierstrass." <> pretty name
    <$$> ") where"
    )
  <>   prettyBreak
  <$$> prettyImport
  <>   prettyBreak
  <$$> "import Data.Curve.Weierstrass"
  <$$> if curve == name then mempty else "import Data.Curve.Weierstrass."
  <>   pretty curve <+> "(" <> pretty curve <> ", Fq, Fr)"

prettyTypes :: Types -> Parameters -> Doc
prettyTypes Types{..} Parameters{..}
  =    prettySection "Types"
  <$$> prettyType curve field q r
  <>   prettyBreak
  <$$> prettyComment (curve' <+> "is a Weierstrass curve")
  <$$> "instance Curve 'Weierstrass c" <+> pretty curve <+> prettyField field
  <+>  "Fr => WCurve c" <+> pretty curve <+> prettyField field <+> "Fr where"
  <$$> indent 2
    (    "a_ = const _a"
    <$$> prettyInline "a_"
    <$$> "b_ = const _b"
    <$$> prettyInline "b_"
    <$$> "h_ = const _h"
    <$$> prettyInline "h_"
    <$$> "q_ = const _q"
    <$$> prettyInline "q_"
    <$$> "r_ = const _r"
    <$$> prettyInline "r_"
    )
  <>   prettyBreak
  <$$> prettyDocumentation ("Affine" <+> curve' <+> "point")
  <$$> "type PA = WAPoint" <+> pretty curve <+> prettyField field <+> "Fr"
  <>   prettyBreak
  <$$> prettyComment ("Affine" <+> curve' <+> "is a Weierstrass affine curve")
  <$$> "instance WACurve" <+> pretty curve <+> prettyField field <+> "Fr where"
  <$$> indent 2
    (    "gA_ = gA"
    <$$> prettyInline "gA_"
    )
  <>   prettyBreak
  <$$> prettyDocumentation ("Jacobian" <+> pretty curve <+> "point")
  <$$> "type PJ = WJPoint" <+> pretty curve <+> prettyField field <+> "Fr"
  <>   prettyBreak
  <$$> prettyComment ("Jacobian" <+> curve' <+> "is a Weierstrass Jacobian curve")
  <$$> "instance WJCurve" <+> pretty curve <+> prettyField field <+> "Fr where"
  <$$> indent 2
    (    "gJ_ = gJ"
    <$$> prettyInline "gJ_"
    )
  <>   prettyBreak
  <$$> prettyDocumentation ("Projective" <+> pretty curve <+> "point")
  <$$> "type PP = WPPoint" <+> pretty curve <+> prettyField field <+> "Fr"
  <>   prettyBreak
  <$$> prettyComment ("Projective" <+> curve' <+> "is a Weierstrass projective curve")
  <$$> "instance WPCurve" <+> pretty curve <+> prettyField field <+> "Fr where"
  <$$> indent 2
    (    "gP_ = gP"
    <$$> prettyInline "gP_"
    )
  where
    curve' :: Doc
    curve' = pretty curve <+> "curve"

prettyParameters :: Types -> Parameters -> Doc
prettyParameters Types{..} Parameters{..}
  =    prettySection "Parameters"
  <$$> prettyDocumentation ("Coefficient @A@ of" <+> curve')
  <$$> "_a ::" <+> prettyField field
  <$$> "_a =" <+> prettyElement a
  <$$> prettyInline "_a"
  <>   prettyBreak
  <$$> prettyDocumentation ("Coefficient @B@ of" <+> curve')
  <$$> "_b ::" <+> prettyField field
  <$$> "_b =" <+> prettyElement b
  <$$> prettyInline "_b"
  <>   prettyBreak
  <$$> prettyDocumentation ("Cofactor of" <+> curve')
  <$$> "_h :: Natural"
  <$$> "_h =" <+> prettyNatural h
  <$$> prettyInline "_h"
  <>   prettyBreak
  <$$> prettyDocumentation ("Characteristic of" <+> curve')
  <$$> "_q :: Natural"
  <$$> "_q =" <+> prettyNatural q
  <$$> prettyInline "_q"
  <>   prettyBreak
  <$$> prettyDocumentation ("Order of" <+> curve')
  <$$> "_r :: Natural"
  <$$> "_r =" <+> prettyNatural r
  <$$> prettyInline "_r"
  <>   prettyBreak
  <$$> prettyDocumentation ("Coordinate @X@ of" <+> curve')
  <$$> "_x ::" <+> prettyField field
  <$$> "_x =" <+> prettyElement x
  <$$> prettyInline "_x"
  <>   prettyBreak
  <$$> prettyDocumentation ("Coordinate @Y@ of" <+> curve')
  <$$> "_y ::" <+> prettyField field
  <$$> "_y =" <+> prettyElement y
  <$$> prettyInline "_y"
  <>   prettyBreak
  <$$> prettyDocumentation ("Generator of affine" <+> curve')
  <$$> "gA :: PA"
  <$$> "gA = A _x _y"
  <$$> prettyInline "gA"
  <>   prettyBreak
  <$$> prettyDocumentation ("Generator of Jacobian" <+> curve')
  <$$> "gJ :: PJ"
  <$$> "gJ = J _x _y 1"
  <$$> prettyInline "gJ"
  <>   prettyBreak
  <$$> prettyDocumentation ("Generator of projective" <+> curve')
  <$$> "gP :: PP"
  <$$> "gP = P _x _y 1"
  <$$> prettyInline "gP"
  where
    curve' :: Doc
    curve' = pretty curve <+> "curve"

prettyCurve :: Curve -> Doc
prettyCurve (Curve name types parameters)
  =    prettyImports name types
  <>   prettyBreak
  <$$> prettyTypes types parameters
  <>   prettyBreak
  <$$> prettyParameters types parameters
  <>   prettyBreak
