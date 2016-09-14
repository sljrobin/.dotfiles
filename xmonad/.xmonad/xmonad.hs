-- xmonad: Configuration
-- Author: Simon L. J. Robin | https://sljrobin.org
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- * `Appearance`               -> Loads colors, dimensions and fonts
-- * `Bindings_Keys`            -> Loads bindings for keyboard
-- * `Bindings_Mouse`           -> Loads bindings for mouse
-- * `Elements`                 -> Loads miscellaneous elements
-- * `Hook_Layout`              -> Loads the LayoutHook
-- * `Hook_Log`                 -> Loads the LogHook
-- * `Hook_Manage`              -> Loads the ManageHook
-- * `Hook_Startup`             -> Loads the StartupHook
-- * `XMonad.Hooks.UrgencyHook` -> Enables urgent focus
-- * `XMonad.Util.EZConfig`     -> Appends key/mouse bindings
-- * `XMonad.Util.Run`          -> Enables `spawnPipe`
-- * `XMonad`                   -> Main library
--------------------------------------------------------------------------------
import XMonad
import XMonad.Hooks.UrgencyHook
import XMonad.Util.EZConfig
import XMonad.Util.Run
import Appearance
import Bindings_Keys
import Bindings_Mouse
import Elements
import Hook_Layout
import Hook_Log
import Hook_Manage
import Hook_Startup


--------------------------------------------------------------------------------
-- Main
--------------------------------------------------------------------------------
main :: IO ()
main = do
    myDzenLeft <- spawnPipe "dzen2 -x '0' -y '0' -w '960' -ta 'l'"
    --myDzenBL <- spawnPipe "./home/sljrobin/.dzen2/bar1&"

    xmonad $ withUrgencyHook NoUrgencyHook $ defaultConfig
        { -- Elements
          terminal           = myTerminal
        , workspaces         = myWorkspaces
         -- Appearance
        , borderWidth        = myBorderWidth
        , focusedBorderColor = myClrFocusedBorder 
        , normalBorderColor  = myClrNormalBorder
         -- Bindings
        , modMask            = myModMask
        , mouseBindings      = myMouseBindings
         -- Hooks
        --, handleEventHook = myEventHook <+> docksEventHook
        , layoutHook         = myLayoutHook
        , logHook            = (myLogHook myDzenLeft) >> myPointerUpdated
        , manageHook         = myManageHook
        , startupHook        = myStartupHook
        }
        `additionalKeysP`      myKeys
