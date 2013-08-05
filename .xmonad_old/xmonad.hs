import XMonad                         -- No this, No XMonad
import Graphics.X11.ExtraTypes.XF86
import XMonad.Hooks.DynamicLog        --
import XMonad.Hooks.ManageDocks       -- Because people love their statusbar
import XMonad.Hooks.UrgencyHook
import XMonad.Layout.NoBorders        -- No Borders, why not?
import XMonad.Util.Run                -- 
import System.Exit                    -- Used for exiting Xmonad

import qualified XMonad.StackSet as W -- Used for Workspace Keybind
import qualified Data.Map        as M -- Used for Keybind



-- Behavior
slTerm         = "terminator"
slFileMan      = "thunar"
slMouseFocus  :: Bool
slMouseFocus   = True

-- Style 
slNormalBorder = "#1a1a1a"
slFocusBorder  = "#c28d1d"
slBorderWidth  = 1 

-- Layout
slWorkspaces = ["www", "terms", "dev", "misc", "vm", "etc"]

slLayout = tiled ||| Mirror tiled ||| maximized
   where
      maximized   = noBorders $ Full
      tiled       = smartBorders $ Tall nmaster delta ratio
      nmaster     = 1
      ratio       = 1/2
      delta       = 5/100

-- Keybind
slKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
    -- Application launching
    [ ((modm,               xK_Return), spawn $ XMonad.terminal conf)
    , ((modm .|. shiftMask, xK_Return), spawn "thunar"                     )              
    , ((modm .|. shiftMask, xK_l     ), spawn "xautolock -locknow"         ) 
    , ((modm,               xK_r     ), spawn "/home/dharrya/.xmonad/script/mydmenu" )
    , ((modm,               xK_q     ), kill                               )
    , ((   0,               xK_Print ), spawn "scrot"                      )
    -- XMonad Behaviour
    , ((modm .|. shiftMask, xK_r     ), spawn "xmonad --restart"           ) -- Refresh XMonad
    , ((modm              , xK_b     ), sendMessage ToggleStruts           ) -- Toggle status bar
    , ((modm,               xK_space ), sendMessage NextLayout             ) -- Switch to next layout
    , ((modm .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf ) -- Reset Layout
    , ((modm .|. shiftMask, xK_t     ), withFocused $ windows . W.sink     ) -- Force window to tile pane
    , ((modm .|. shiftMask, xK_q     ), io (exitWith ExitSuccess)          ) -- Quit XMonad
--    , ((modm              , xK_q     ), spawn "xmonad --recompile && xmonad --restart") -- Recompile then refresh XMonad
    -- Pane Switching
    , ((modm,               xK_Tab   ), windows W.focusDown    ) -- Focus to next pane
    , ((modm,               xK_Right ), windows W.focusDown    )
    , ((modm .|. shiftMask, xK_Tab   ), windows W.focusUp      ) -- Focus to previous pane
    , ((modm,               xK_Left  ), windows W.focusUp      )
    , ((modm,               xK_Down  ), windows W.focusMaster  ) -- Focus to Master pane
    -- Pane Swapping
    , ((modm .|. shiftMask, xK_Right ), windows W.swapDown     ) -- Swap current with next pane
    , ((modm .|. shiftMask, xK_Left  ), windows W.swapUp       ) -- Swap current with previous pane
    , ((modm .|. shiftMask, xK_Down  ), windows W.swapMaster   ) -- Swap current with master pane
    -- Pane sizing
    , ((modm,               xK_comma ), sendMessage Shrink           ) -- Shrink master pane
    , ((modm,               xK_period), sendMessage Expand           ) -- Expand master pane
    , ((modm .|. shiftMask, xK_comma ), sendMessage (IncMasterN 1)   ) -- Increase number of master pane  
    , ((modm .|. shiftMask, xK_period), sendMessage (IncMasterN (-1))) -- Decrease number of master pane
    -- Laptop key binding 
    --- MPD key binding
    , ((  shiftMask, xF86XK_AudioPlay), spawn "mpc clear && /home/lily/.bin/mpdaddrandom && mpc play"  )
    , ((   0,        xF86XK_AudioPlay), spawn "mpc toggle"  )
    , ((   0,        xF86XK_AudioStop), spawn "mpc stop"    )
    , ((   0,        xF86XK_AudioPrev), spawn "mpc prev"    )
    , ((   0,        xF86XK_AudioNext), spawn "mpc next"    )
    --- Other key binding
    , ((  shiftMask, xF86XK_Display  ), spawn "lxrandr"     )
    , ((   0, xF86XK_AudioMute       ), spawn "amixer set Master toggle_mute"                )
    , ((   0, xF86XK_AudioLowerVolume), spawn "amixer set PCM 3- ;amixer set Master unmute"  )
    , ((   0, xF86XK_AudioRaiseVolume), spawn "amixer set PCM 3+ ;amixer set Master unmute"  )
    ]
    ++
    -- Binding for switching workspaces
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]


------------------------------------------------------------------------
-- Mouse bindings: default actions bound to mouse events
--
slMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList $

    -- mod-button1, Set the window to floating mode and move by dragging
    [ ((modm, button1), (\w -> focus w >> mouseMoveWindow w
                                       >> windows W.shiftMaster))

    -- mod-button2, Raise the window to the top of the stack
    , ((modm, button2), (\w -> focus w >> windows W.shiftMaster))

    -- mod-button3, Set the window to floating mode and resize by dragging
    , ((modm, button3), (\w -> focus w >> mouseResizeWindow w
                                       >> windows W.shiftMaster))

    -- you may also bind events to the mouse scroll wheel (button4 and button5)
    ]

-- Manage Hook
myManageHook = composeAll
    [ resource  =? "desktop_window" --> doIgnore
    , resource  =? "kdesktop"       --> doIgnore ]

-- LogHook
slLogHook h = dynamicLogWithPP $ defaultPP
    { ppCurrent         = dzenColor "#c28d1d" "" . pad
    , ppHidden          = dzenColor "#c9bdbd" "" . pad
    , ppHiddenNoWindows = dzenColor "#707070" "" . pad
    , ppLayout          = dzenColor "#ab1048" "" . pad
    , ppUrgent          = dzenColor "#ab1048" "" . pad . dzenStrip
    , ppTitle           = const "" 
    , ppWsSep           = dzenColor "#707070" "" "/"
    , ppSep             = ":"
  --  , ppOrder           = reverse
    , ppOutput          = hPutStrLn h
    }


slDzenFGColor = "#ff0000"
slDzenBGColor = "#1a1a1a"
slDzenHeight  = "18"
slDzenFonts   = "-*-terminus-*-r-normal-*-11-120-*-*-*-*-iso8859-*"

main = do
   d <- spawnPipe "dzen2 -p -ta l -h '16' -w '1000' -e 'onstart=lower' -bg '#1a1a1a' -fg '#c9bdbd' -fn '-*-terminus-*-r-normal-*-11-120-*-*-*-*-iso8859-*'"
   spawn $ "conky -c /home/dharrya/.xmonad/dzConky | dzen2 -p -ta r -h '16' -w '1000' -x '-1000' -e 'onstart=lower' -bg '#1a1a1a' -fg '#c28d1d' -fn '-*-terminus-*-r-normal-*-11-120-*-*-*-*-iso8859-*'"
--   spawn $ "conky -c /home/lily/.xmonad/dzConky2 | dzen2 -p -ta l -h '16' -w '700' -x '0' -y '-16' -e 'onstart=lower' -bg '#1a1a1a' -fg '#c28d1d' -fn '-*-terminus-*-r-normal-*-11-120-*-*-*-*-iso8859-*'"
--   spawn $ "conky -c /home/lily/.xmonad/dzConky3 | dzen2 -p -ta r -h '16' -w '700' -x '666' -y '-16' -e 'onstart=lower' -bg '#1a1a1a' -fg '#c28d1d' -fn '-*-terminus-*-r-normal-*-11-120-*-*-*-*-iso8859-*'"
   xmonad $ withUrgencyHook NoUrgencyHook $ defaultConfig 
      { terminal     = slTerm
      , modMask      = mod4Mask
      , workspaces   = slWorkspaces
      , layoutHook   = avoidStruts slLayout
      , manageHook   = myManageHook <+> manageDocks
      -- Style
      , borderWidth        = slBorderWidth
      , normalBorderColor  = slNormalBorder
      , focusedBorderColor = slFocusBorder
      , logHook            = slLogHook d
      -- Behavior
      , keys               = slKeys
      , mouseBindings      = slMouseBindings
      , focusFollowsMouse  = slMouseFocus

   }

