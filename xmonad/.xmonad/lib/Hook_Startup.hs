-- xmonad: Personal module: Hook Startup
-- Author: Simon L. J. Robin | https://sljrobin.org
--------------------------------------------------------------------------------
module Hook_Startup where

--------------------------------------------------------------------------------
-- * `XMonad.Hooks.SetWMName` -> Sets the WM name
--------------------------------------------------------------------------------
import XMonad.Hooks.SetWMName


--------------------------------------------------------------------------------
-- Hook Startup
--------------------------------------------------------------------------------
myStartupHook = do
    setWMName "LG3D"  -- Detect `_NET_SUPPORTING_WM_CHECK` protocol
