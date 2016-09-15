-- xmonad: Personal module: Hook Manage
-- Author: Simon L. J. Robin | https://sljrobin.org
--------------------------------------------------------------------------------
module Hook_Manage where

--------------------------------------------------------------------------------
-- * `XMonad.Hooks.ManageDocks`   -> Provide tools to manage docks
-- * `XMonad.Hooks.ManageHelpers` -> Enable `FullFloat` mode
-- * `XMonad`                     -> Main library
--------------------------------------------------------------------------------
import XMonad
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers


--------------------------------------------------------------------------------
-- Hook Manage
--------------------------------------------------------------------------------
myManageHook = composeAll
    [ -- Do not try to tile windows
      manageDocks
    , isFullscreen --> doFullFloat
--    , className =? "Vlc" --> doFloat
    , manageHook defaultConfig
    ]
