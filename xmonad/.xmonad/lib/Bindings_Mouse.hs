-- xmonad: Personal module: Binding Mouse
-- Author: Simon L. J. Robin | https://sljrobin.org
--------------------------------------------------------------------------------
module Bindings_Mouse where

--------------------------------------------------------------------------------
-- * `Data.Map`        -> Mouse bindings
-- * `XMonad.StackSet` -> ManageHook rules
-- * `XMonad`          -> Main library
--------------------------------------------------------------------------------
import XMonad
import qualified Data.Map        as M
import qualified XMonad.StackSet as W


--------------------------------------------------------------------------------
-- Enable/Disable Focus with mouse
--------------------------------------------------------------------------------
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True


--------------------------------------------------------------------------------
-- Binding mouse
--------------------------------------------------------------------------------
-- * `M`       -> <Mod>
-- * `button1` -> Left click
-- * `button2` -> Middle click
-- * `button3` -> Right click
--------------------------------------------------------------------------------
-- * `M-button1` -> Enables floating mode and drags the current window
-- * `M-button2` -> Raises the window to the top of the stack
-- * `M-button3` -> Enables floating mode and resizes by dragging
--------------------------------------------------------------------------------
myMouseBindings (XConfig {XMonad.modMask = modMask}) = M.fromList $
    [ ((modMask, button1), (\w -> focus w >> mouseMoveWindow w
                                          >> windows W.shiftMaster  ))
    , ((modMask, button2), windows . (W.swapMaster .) . W.focusWindow)
    , ((modMask, button3), (\w -> focus w >> mouseResizeWindow w
                                          >> windows W.shiftMaster  ))
    ]
