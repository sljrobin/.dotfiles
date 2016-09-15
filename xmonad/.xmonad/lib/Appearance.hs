-- xmonad: Personal module: Appearance
-- Author: Simon L. J. Robin | https://sljrobin.org
--------------------------------------------------------------------------------
module Appearance where

--------------------------------------------------------------------------------
-- * `XMonad.Layout.Decoration` -> Enable the creation of decorated layouts
-- * `XMonad`                   -> Main library
--------------------------------------------------------------------------------
import XMonad
import XMonad.Layout.Decoration


--------------------------------------------------------------------------------
-- Colors
--------------------------------------------------------------------------------
myClrBlue  = "#7CAFC2"  -- Blue
myClrDGrey = "#585858"  -- Dark Grey
myClrLGrey = "#ABABAB"  -- Light Grey
myClrRed   = "#AB4642"  -- Red
myClrWhite = "#F8F8F8"  -- White


--------------------------------------------------------------------------------
-- Borders
--------------------------------------------------------------------------------
myBorderWidth     :: Dimension   -- Border width declaration
myBorderWidth      = 1           -- Border width
myClrNormalBorder  = myClrDGrey  -- Normal border
myClrFocusedBorder = myClrLGrey  -- Focused border


--------------------------------------------------------------------------------
-- Fonts
--------------------------------------------------------------------------------
myFnt       = "xft:DejaVu Sans Mono:pixelsize=12:Book"  -- Main font
myFntLayTab = myFnt                                     -- Font for Tabbed
myFntGrid   = myFnt                                     -- Font for Grid


--------------------------------------------------------------------------------
-- Theme 'Tabbed' Layout
--------------------------------------------------------------------------------
myThemeLayoutTabbed :: Theme
myThemeLayoutTabbed = defaultTheme
    -- Active tab
    { activeColor         = myClrLGrey  -- Color
    , activeBorderColor   = myClrWhite  -- Border
    , activeTextColor     = myClrWhite  -- Text
    -- Inactive tab
    , inactiveColor       = myClrDGrey  -- Color
    , inactiveBorderColor = myClrWhite  -- Border
    , inactiveTextColor   = myClrWhite  -- Text
    -- Urgent tab
    , urgentColor         = myClrDGrey  -- Color
    , urgentBorderColor   = myClrRed    -- Border
    , urgentTextColor     = myClrRed    -- Text
    -- Font
    , fontName            = myFntLayTab
    }
