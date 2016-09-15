-- xmonad: Personal module: Hook Layout
-- Author: Simon L. J. Robin | https://sljrobin.org
--------------------------------------------------------------------------------
module Hook_Layout where

--------------------------------------------------------------------------------
-- * `Appearance`                      -> Loads colors, dimensions and fonts
-- * `XMonad.Hooks.ManageDocks`        -> Provide tools to manage docks
-- * `XMonad.Layout.Grid`              -> Puts windows in a grid
-- * `XMonad.Layout.LayoutCombinators` -> Combines multiple layouts
-- * `XMonad.Layout.Minimize`          -> Allows to minimize a window
-- * `XMonad.Layout.NoBorders`         -> Detects smart borders
-- * `XMonad.Layout.ResizableTile`     -> Allows to change window dimensions
-- * `XMonad.Layout.SimplestFloat`     -> Allows window to be simplest float
-- * `XMonad.Layout.Spiral`            -> Puts windows in a spiral
-- * `XMonad.Layout.Tabbed`            -> Puts windows in several tabs
-- * `XMonad.Layout.ThreeColumns`      -> Puts windows in three columns
-- * `XMonad`                          -> Main library
--------------------------------------------------------------------------------
import XMonad hiding ((|||))
import XMonad.Layout.Grid
import XMonad.Layout.LayoutCombinators
import XMonad.Layout.Minimize
import XMonad.Layout.NoBorders
import XMonad.Layout.ResizableTile
import XMonad.Layout.SimplestFloat
import XMonad.Layout.Spiral
import XMonad.Layout.Tabbed
import XMonad.Layout.ThreeColumns
import XMonad.Hooks.ManageDocks
import Appearance


--------------------------------------------------------------------------------
-- Hook Layout
--------------------------------------------------------------------------------
-- * `lay_float`    -> SimplestFloat
-- * `lay_full`     -> Full
-- * `lay_grid`     -> Grid
-- * `lay_min`      -> Minimize
-- * `lay_spiral`   -> Spiral
-- * `lay_tabbed`   -> Tabbed
-- * `lay_threecol` -> Three Columns
-- * `lay_tiled`    -> Tiled
--------------------------------------------------------------------------------
myLayoutHook = smartBorders . avoidStrutsOn [U,D] $ myLayouts
    where
        myLayouts = (lay_tiled    |||
                     lay_grid     ||| 
                     lay_tabbed   ||| 
                     lay_threecol ||| 
                     lay_spiral   ||| 
                     lay_full     ||| 
                     lay_min      ||| 
                     lay_float)
        -- Layouts
        lay_float    = simplestFloat
        lay_full     = Full
        lay_grid     = Grid
        lay_min      = minimize (Tall 1 (3/100) (1/2))
        lay_spiral   = spiral (toRational (2/(1+sqrt(5)::Double)))
        lay_tabbed   = minimize $ tabbed shrinkText myThemeLayoutTabbed
        lay_threecol = ThreeColMid 1 (3/100) (1/2)
        lay_tiled    = ResizableTall 1 (3/100) (1/2) []
