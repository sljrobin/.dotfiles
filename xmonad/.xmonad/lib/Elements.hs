-- xmonad: Personal module: Elements
-- Author: Simon L. J. Robin | https://sljrobin.org
--------------------------------------------------------------------------------
module Elements where

--------------------------------------------------------------------------------
-- * `Appearance`                -> Loads colors, dimensions and fonts
-- * `XMonad.Actions.GridSelect` -> Enables 2D Grid
-- * `XMonad`                    -> Main library
--------------------------------------------------------------------------------
import XMonad
import XMonad.Actions.GridSelect
import Appearance


--------------------------------------------------------------------------------
-- Grid
--------------------------------------------------------------------------------
-- Colorizer
myGridColorizer :: Window -> Bool -> X (String, String)
myGridColorizer = colorRangeFromClassName
    (0x58,0x58,0x58)  -- Lowest inactive background
    (0x58,0x58,0x58)  -- Highest inactive background
    (0x7C,0xAF,0xC2)  -- Active background
    (0xF8,0xF8,0xF8)  -- Inactive foreground
    (0xF8,0xF8,0xF8)  -- Active foreground

-- Configuration
myGridConfig :: t -> GSConfig Window
myGridConfig colorizer = (buildDefaultGSConfig myGridColorizer)
    { gs_cellheight  = 65         -- Cell height 
    , gs_cellwidth   = 120        -- Cell width
    , gs_cellpadding = 10         -- Cell padding
    , gs_font        = myFntGrid  -- Font
    }


--------------------------------------------------------------------------------
-- Terminals
--------------------------------------------------------------------------------
myRofi     = "rofi -show run"   -- Rofi
myTerminal = "urxvtc"           -- Terminal
myTmux     = "urxvtc -e 'tmux'" -- tmux


--------------------------------------------------------------------------------
-- Workspaces
--------------------------------------------------------------------------------
myWorkspaces :: [WorkspaceId]
myWorkspaces = map show [1 .. 9]
