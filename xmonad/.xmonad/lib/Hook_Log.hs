-- xmonad: Personal module: Hook Log
-- Author: Simon L. J. Robin | https://sljrobin.org
--------------------------------------------------------------------------------
module Hook_Log where

--------------------------------------------------------------------------------
-- * `System.IO`                    -> Standard IO library
-- * `XMonad.Actions.UpdatePointer` -> Update Pointer position
-- * `XMonad.Hooks.DynamicLog`      -> Use `dynamicLogWithPP`
-- * `XMonad`                       -> Main library
--------------------------------------------------------------------------------
import System.IO
import XMonad
import XMonad.Actions.UpdatePointer
import XMonad.Hooks.DynamicLog


--------------------------------------------------------------------------------
-- Hook Log
--------------------------------------------------------------------------------
-- * `ppCurrent`         -> Displays current Workspace
-- * `ppHiddenNoWindows` -> Displays other Workspaces with no windows
-- * `ppHidden`          -> Displays other Workspaces which contain windows
-- * `ppLayout`          -> Displays current Layout
-- * `ppOrder`           -> Orders the different log sections
-- * `ppOutput`          -> Outputs to the handle given as an argument
-- * `ppSep`             -> Character which separates each object
-- * `ppTitle`           -> Shortens title if > 100 characters
-- * `ppUrgent`          -> Colors a window on a hidden Workspace if activity
-- * `ppWsSep`           -> Character which separates each Workspace
--------------------------------------------------------------------------------
myLogHook h = dynamicLogWithPP $ dzenPP
    { ppCurrent         = dzenColor "#303030" "#909090" . pad
    , ppHidden          = dzenColor "#909090" "#282828" . pad
    , ppHiddenNoWindows = dzenColor "#909090" "#282828" . pad
    , ppLayout          = dzenColor "#ebac54" "#1B1D1E" .
        (\x -> case x of
        "ResizableTall"            -> "R"
        "Grid"                     -> "G"
        "Minimize Tabbed Simplest" -> "T"
        "ThreeCol"                 -> "3"
        "Spiral"                   -> "@"
        "Full"                     -> "F"
        "Minimize Tall"            -> "M"
        "SimplestFloat"            -> "f"
        _                          -> x)
    , ppOrder           = \(t:ws:l:_) -> [ws, t, l]
    , ppOutput          = hPutStrLn h
    , ppSep             = " "
    , ppTitle           = shorten 120
    , ppUrgent          = dzenColor "#ff0000" "" .pad . dzenStrip
    , ppWsSep           = ""
    }


----------------------------------------------------------------------------
-- Pointer
----------------------------------------------------------------------------
myPointerUpdated = updatePointer (0.075, 0.075) (0.075, 0.075)
