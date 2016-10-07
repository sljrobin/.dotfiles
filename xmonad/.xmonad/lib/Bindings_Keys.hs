-- xmonad: Personal module: Binding Keys
-- Author: Simon L. J. Robin | https://sljrobin.org
--------------------------------------------------------------------------------
module Bindings_Keys where

--------------------------------------------------------------------------------
-- * `Appearance`                     -> Loads colors, dimensions and fonts
-- * `Data.Map`                       -> Mouse bindings
-- * `Data.Monoid`                    -> Allows to create monoids
-- * `Elements`                       -> Loads miscellaneous elements
-- * `System.Exit`                    -> Exits the program
-- * `System.IO`                      -> Standard IO library
-- * `XMonad.Actions.CycleWS`         -> Cycles through the workspaces
-- * `XMonad.Actions.GridSelect`      -> Enables 2D grid
-- * `XMonad.Actions.PhysicalScreens` -> Screens manipulation 
-- * `XMonad.Actions.WindowBringer`   -> Navigates through apps with menu bar
-- * `XMonad.Hooks.ManageDocks`       -> Enables `ToggleStruts`
-- * `XMonad.Hooks.ManageHelpers`     -> Enables `FullFloat` mode
-- * `XMonad.Hooks.UrgencyHook`       -> Enables urgent focus
-- * `XMonad.Layout.Minimize`         -> Allows to minimize a window
-- * `XMonad.Layout.ResizableTile`    -> Allows to change window dimensions
-- * `XMonad.Layout.ToggleLayouts`    -> Toggles two different layouts
-- * `XMonad.StackSet`                -> ManageHook rules
-- * `XMonad`                         -> Main library
--------------------------------------------------------------------------------
import Data.Monoid
import System.Exit (exitSuccess)
import System.IO
import XMonad
import qualified Data.Map        as M
import qualified XMonad.StackSet as W
import XMonad.Actions.CycleWS
import XMonad.Actions.GridSelect
import XMonad.Actions.PhysicalScreens
import XMonad.Actions.WindowBringer
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.UrgencyHook
import XMonad.Layout.Minimize
import XMonad.Layout.ResizableTile
import XMonad.Layout.ToggleLayouts
import Appearance
import Elements


--------------------------------------------------------------------------------
-- <Mod> key
--------------------------------------------------------------------------------
myModMask = mod4Mask  -- Use <Windows> key instead of <Alt> key for <Mod>


--------------------------------------------------------------------------------
-- Binding keys
--------------------------------------------------------------------------------
-- * `C`   -> <Control>
-- * `C-S` -> <Control> + <Shift>
-- * `M`   -> <Mod>
-- * `M-S` -> <Mod> + <Shift>
--------------------------------------------------------------------------------
myKeys :: [(String, X())]
myKeys =
    ----------------------------------------------------------------------------
    -- Applications: launching
    ----------------------------------------------------------------------------
    -- * `M-<Return>`   -> Launches `tmux` within a terminal
    -- * `M-S-<Return>` -> Launches a terminal
    -- * `M-x`          -> Launches `Rofi`
    ----------------------------------------------------------------------------
    [ ("M-<Return>"  , spawn myTmux)
    , ("M-S-<Return>", spawn myTerminal)
    , ("M-x"         , spawn myRofi)
    ]
    ++

    ----------------------------------------------------------------------------
    -- Applications: using
    ----------------------------------------------------------------------------
    -- * `<Print>`  -> Takes a screenshot
    -- * `M-<F1>`   -> Mutes/Unmutes volume
    -- * `M-<F2>`   -> Decreases volume
    -- * `M-<F3>`   -> Toggles MPC
    -- * `M-<F4>`   -> Switches to the next song on the playlist
    -- * `M-S-<F1>` -> Mutes/Unmutes volume
    -- * `M-S-<F2>` -> Increases volume
    -- * `M-S-<F3>` -> Stops MPC
    -- * `M-S-<F4>` -> Switches to the previous song on the playlist
    -- * `M-S-b`    -> Increases to 5% the brightness
    -- * `M-S-s`    -> Changes the keyboard layout to FR
    -- * `M-S-z`    -> Locks screen
    -- * `M-b`      -> Decreases to 5% the brightness
    -- * `M-s`      -> Changes the keyboard layout to US
    ----------------------------------------------------------------------------
    [ ("M-<F1>"  , spawn "amixer -q -D pulse set Master toggle")
    , ("M-S-<F1>", spawn "amixer -q set Master toggle")
    , ("M-<F2>"  , spawn "amixer -q set Master 2%-")
    , ("M-S-<F2>", spawn "amixer -q set Master 2%+")
    , ("M-<F3>"  , spawn "mpc toggle")
    , ("M-S-<F3>", spawn "mpc stop")
    , ("M-<F4>"  , spawn "mpc next")
    , ("M-S-<F4>", spawn "mpc prev")
    , ("M-b"     , spawn "xbacklight -dec 5")
    , ("M-S-b"   , spawn "xbacklight -inc 5")
    , ("M-s"     , spawn "setxkbmap us")
    , ("M-S-s"   , spawn "setxkbmap fr")
    , ("M-S-z"   , spawn "xscreensaver-command --lock")
    , ("<Print>" , spawn "scrot ~/Downloads/temp/scrshot_%Y-%m-%d_%H-%M-%S.png")
    ]
    ++

    ----------------------------------------------------------------------------
    -- Applications: killing
    ----------------------------------------------------------------------------
    -- * `M-S-c` -> Closes the focused window
    -- * `M-S-q` -> Closes XMonad
    -- * `M-q`   -> Closes Dzen
    ----------------------------------------------------------------------------
    [ ("M-S-c", kill)
    , ("M-q"  , spawn "killall dzen2")
    , ("M-S-q", io exitSuccess)
    ]
    ++
    
    ----------------------------------------------------------------------------
    -- GUI: focus
    ----------------------------------------------------------------------------
    -- * `M-,`             -> Swaps the focused window with the previous window
    -- * `M-.`             -> Swaps the focused window with the next window
    -- * `M-<Backspace>`   -> Focus the most recently urgent window
    -- * `M-<Tab>`         -> Moves focus to the next window
    -- * `M-<Up>`          -> Goes to an application
    -- * `M-S-<Backspace>` -> Cleans the urgents
    -- * `M-S-<Tab>`       -> Moves focus to the previous window
    -- * `M-S-<Up>`        -> Moves an application to the current workspace
    -- * `M-S-m`           -> Swaps the focused window and the master window
    -- * `M-j`             -> Moves focus to the next window
    -- * `M-k`             -> Moves focus to the previous window
    -- * `M-m`             -> Moves focus to the master window
    -- * `M-t`             -> Pushes window back into tiling
    ----------------------------------------------------------------------------
    [ ("M-<Tab>"        , windows W.focusDown)
    , ("M-S-<Tab>"      , windows W.focusUp)
    , ("M-j"            , windows W.focusDown)
    , ("M-k"            , windows W.focusUp)
    , ("M-m"            , windows W.focusMaster)
    , ("M-<Backspace>"  , focusUrgent)
    , ("M-S-<Backspace>", clearUrgents)
    , ("M-S-m"          , windows W.swapMaster)
    , ("M-."            , windows W.swapDown)
    , ("M-,"            , windows W.swapUp)
    , ("M-t"            , withFocused $ windows . W.sink)
    , ("M-<Up>"         , gotoMenu)
    , ("M-S-<Up>"       , bringMenu)
    ]
    ++
    
    ----------------------------------------------------------------------------
    -- GUI: layouts
    ----------------------------------------------------------------------------
    -- * `M-<Space>`   -> Rotates through the available layout algorithms
    -- * `M-S-<Space>` -> Resets the layouts on the current workspace
    -- * `M-S-d`       -> Restores the last minimized window
    -- * `M-S-f`       -> Exits `FullFloatFocused` mode
    -- * `M-S-h`       -> Shrinks the master area horizontally 
    -- * `M-S-j`       -> Shrinks the master area vertically
    -- * `M-S-k`       -> Expands the master area vertically
    -- * `M-S-l`       -> Expands the master area horizontally
    -- * `M-S-n`       -> Increments the number of windows in the master area
    -- * `M-d`         -> Minimizes the current window
    -- * `M-f`         -> Puts the focused window in `FullFloatFocused` mode
    -- * `M-n`         -> Decrements the number of windows in the master area
    -- * `M-r`         -> Resizes viewed windows to the correct size
    -- * `M-z`         -> Toggles the struts
    ----------------------------------------------------------------------------
    [ ("M-<Space>"  , sendMessage NextLayout)
    , ("M-S-<Space>", asks (XMonad.layoutHook . config) >>= setLayout)
    , ("M-S-h"      , sendMessage Shrink)
    , ("M-S-j"      , sendMessage MirrorShrink)
    , ("M-S-k"      , sendMessage MirrorExpand)
    , ("M-S-l"      , sendMessage Expand)
    , ("M-f"        , sendMessage (Toggle "Full"))
    , (("M-S-f")    , do --
                        sendMessage (Toggle "Full")
                        sendMessage ToggleStruts)
    , ("M-d"        , withFocused minimizeWindow)
    , ("M-S-d"      , sendMessage RestoreNextMinimizedWin)
    , ("M-r"        , refresh)
    , ("M-S-n"      , sendMessage (IncMasterN 1))
    , ("M-n"        , sendMessage (IncMasterN (-1)))
    , ("M-z"        , sendMessage $ ToggleStruts)
    ]
    ++
    
    ----------------------------------------------------------------------------
    -- GUI: grid
    ----------------------------------------------------------------------------
    -- * `M-S-g` -> Brings the selected application
    -- * `M-g`   -> Goes to the selected application
    ----------------------------------------------------------------------------
    [ ("M-g"  , goToSelected $ myGridConfig myGridColorizer)
    , ("M-S-g", bringSelected $ myGridConfig myGridColorizer)
    ]
    ++
    
    ----------------------------------------------------------------------------
    -- GUI: workspaces
    ----------------------------------------------------------------------------
    -- * `M-1`         -> Moves to workspace 1
    -- * `M-2`         -> Moves to workspace 2
    -- * `M-3`         -> Moves to workspace 3
    -- * `M-4`         -> Moves to workspace 4
    -- * `M-5`         -> Moves to workspace 5
    -- * `M-6`         -> Moves to workspace 6
    -- * `M-7`         -> Moves to workspace 7
    -- * `M-8`         -> Moves to workspace 8
    -- * `M-9`         -> Moves to workspace 9
    -- * `M-<Down>`    -> Toggles workspace
    -- * `M-<Left>`    -> Moves to the previous non empty workspace
    -- * `M-<Right>`   -> Moves to the next non empty workspace
    -- * `M-S-1`       -> Sends current window and moves focus to workspace 1
    -- * `M-S-2`       -> Sends current window and moves focus to workspace 2
    -- * `M-S-3`       -> Sends current window and moves focus to workspace 3
    -- * `M-S-4`       -> Sends current window and moves focus to workspace 4
    -- * `M-S-5`       -> Sends current window and moves focus to workspace 5
    -- * `M-S-6`       -> Sends current window and moves focus to workspace 6
    -- * `M-S-7`       -> Sends current window and moves focus to workspace 7
    -- * `M-S-8`       -> Sends current window and moves focus to workspace 8
    -- * `M-S-9`       -> Sends current window and moves focus to workspace 9
    -- * `M-S-<Left>`  -> Moves to the previous empty workspace
    -- * `M-S-<Right>` -> Moves to the next empty workspace
    ----------------------------------------------------------------------------
    [ ("M-<Down>"   , toggleWS)
    , ("M-<Left>"   , moveTo Prev NonEmptyWS)
    , ("M-<Right>"  , moveTo Next NonEmptyWS)
    , ("M-S-<Left>" , moveTo Prev EmptyWS)
    , ("M-S-<Right>", moveTo Next EmptyWS)
    , ("M-1"        , windows $ W.greedyView "1")
    , ("M-2"        , windows $ W.greedyView "2")
    , ("M-3"        , windows $ W.greedyView "3")
    , ("M-4"        , windows $ W.greedyView "4")
    , ("M-5"        , windows $ W.greedyView "5")
    , ("M-6"        , windows $ W.greedyView "6")
    , ("M-7"        , windows $ W.greedyView "7")
    , ("M-8"        , windows $ W.greedyView "8")
    , ("M-9"        , windows $ W.greedyView "9")
    , ("M-S-1"      , windows $ W.greedyView "1" . W.shift "1")
    , ("M-S-2"      , windows $ W.greedyView "2" . W.shift "2")
    , ("M-S-3"      , windows $ W.greedyView "3" . W.shift "3")
    , ("M-S-4"      , windows $ W.greedyView "4" . W.shift "4")
    , ("M-S-5"      , windows $ W.greedyView "5" . W.shift "5")
    , ("M-S-6"      , windows $ W.greedyView "6" . W.shift "6")
    , ("M-S-7"      , windows $ W.greedyView "7" . W.shift "7")
    , ("M-S-8"      , windows $ W.greedyView "8" . W.shift "8")
    , ("M-S-9"      , windows $ W.greedyView "9" . W.shift "9")
    ]
    ++
    
    ----------------------------------------------------------------------------
    -- GUI: screens
    ----------------------------------------------------------------------------
    -- * `C-1`         -> Moves to physical screen 1
    -- * `C-2`         -> Moves to physical screen 2
    -- * `C-3`         -> Moves to physical screen 3
    -- * `C-4`         -> Moves to physical screen 4
    -- * `C-5`         -> Moves to physical screen 5
    -- * `C-6`         -> Moves to physical screen 6
    -- * `C-7`         -> Moves to physical screen 7
    -- * `C-8`         -> Moves to physical screen 8
    -- * `C-9`         -> Moves to physical screen 9
    -- * `C-S-1`       -> Sends current window and moves focus to screen 1
    -- * `C-S-2`       -> Sends current window and moves focus to screen 2
    -- * `C-S-3`       -> Sends current window and moves focus to screen 3
    -- * `C-S-4`       -> Sends current window and moves focus to screen 4
    -- * `C-S-5`       -> Sends current window and moves focus to screen 5
    -- * `C-S-6`       -> Sends current window and moves focus to screen 6
    -- * `C-S-7`       -> Sends current window and moves focus to screen 7
    -- * `C-S-8`       -> Sends current window and moves focus to screen 8
    -- * `C-S-9`       -> Sends current window and moves focus to screen 9
    -- * `M-C-<Left>`  -> Moves to the previous screen
    -- * `M-C-<Right>` -> Moves to the next screen
    ----------------------------------------------------------------------------
    [ ("M-C-<Left>" , prevScreen)
    , ("M-C-<Right>", nextScreen)
    , ("C-1"        , viewScreen 0)
    , ("C-2"        , viewScreen 1)
    , ("C-3"        , viewScreen 2)
    , ("C-4"        , viewScreen 3)
    , ("C-5"        , viewScreen 4)
    , ("C-6"        , viewScreen 5)
    , ("C-7"        , viewScreen 6)
    , ("C-8"        , viewScreen 7)
    , ("C-9"        , viewScreen 8)
    , ("C-S-1"      , sendToScreen 0 >> viewScreen 0)
    , ("C-S-2"      , sendToScreen 1 >> viewScreen 1)
    , ("C-S-3"      , sendToScreen 2 >> viewScreen 2)
    , ("C-S-4"      , sendToScreen 3 >> viewScreen 3)
    , ("C-S-5"      , sendToScreen 4 >> viewScreen 4)
    , ("C-S-6"      , sendToScreen 5 >> viewScreen 5)
    , ("C-S-7"      , sendToScreen 6 >> viewScreen 6)
    , ("C-S-8"      , sendToScreen 7 >> viewScreen 7)
    , ("C-S-9"      , sendToScreen 8 >> viewScreen 8)
    ]
