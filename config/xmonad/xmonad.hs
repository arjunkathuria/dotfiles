import XMonad

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP

import XMonad.Util.EZConfig
import XMonad.Util.Loggers
import XMonad.Util.Ungrab

import XMonad.Layout.Magnifier
import XMonad.Layout.ThreeColumns
import XMonad.Layout.SubLayouts

import XMonad.Hooks.EwmhDesktops
import XMonad.Layout.Spacing

import XMonad.Util.SpawnOnce

import XMonad.Layout.Tabbed
import XMonad.Hooks.Rescreen

import XMonad.Actions.CycleWS (nextWS, prevWS, toggleWS)

import System.Exit

main :: IO ()
main = xmonad
     . rescreenHook rescreenCfg
     . ewmhFullscreen
     . ewmh
     . docks
     -- . withEasySB (origXmobar) defToggleStrutsKey
     . dynamicEasySBs barSpawner
     $ myConfig

origXmobar = statusBarProp "xmobar" (pure myXmobarPP)
xmobarScreen1 = statusBarProp "xmobar -x 0" (pure myXmobarPP)
xmobarScreen2 = statusBarPropTo "_XMONAD_LOG_1" "xmobar -x 1 ~/.config/xmobar/xmobarrc-1" (pure myXmobarPP')
xmobars = xmobarScreen1 <> xmobarScreen2

barSpawner :: ScreenId -> IO StatusBarConfig
barSpawner 0 = pure $ xmobarScreen1
barSpawner 1 = pure $ xmobarScreen2
barSpawner _ = mempty -- nothing on the rest of the screens

myConfig = def
    { modMask    = mod4Mask      -- Rebind Mod to the Super key
    , layoutHook = spacingWithEdge 5 $ myLayout      -- Use custom layouts
    , manageHook = myManageHook  -- Match on certain windows
    , terminal   = "alacritty"
    , startupHook = myStartupHook
    , focusedBorderColor = "#4c7899"
    }
  `removeKeysP` defaultKeysRemoved
  `additionalKeysP` (myKeys)


myKeys = myKeymap
    where
      newDefaultBindings = map snd defaultKeyOverrides

defaultBindingsThatAreRemoved = map fst defaultKeyOverrides

myKeymap = [
      ("M-<Return>", spawn $ terminal myConfig)
    , ("M-S-z", spawn "xscreensaver-command -lock")
    -- screenshots
    , ("M-S-=", unGrab *> spawn "scrot -s"        )
    , ("M-S-v", unGrab >> spawn "scrot -m ~/Pictures/screenshots/screenshot-%Y%m%dT%H%M%S.png")
    , ("M-]"  , spawn "firefox")
    --rofi
    , ("M-d"  , spawn "rofi -show combi")
    , ("M1-<Tab>", spawn "rofi -show window")
    -- volume and brightness keys
    , ("<XF86AudioRaiseVolume>", spawn "pactl set-sink-volume 0 +5%")
    , ("<XF86AudioLowerVolume>", spawn "pactl set-sink-volume 0 -5%")
    , ("<XF86AudioMute>", spawn "pactl set-sink-mute 0 toggle")
    , ("<XF86MonBrightnessDown>", spawn "brightnessctl set 5%-")
    , ("<XF86MonBrightnessUp>", spawn "brightnessctl set 5%+")
    , ("M-b", sendMessage ToggleStruts)
    -- screens config refresh (when i connect or disconnect more screen)
    , ("M-S-d", spawn "autorandr -c")
    -- workspace switching keys
    , ("M-n", nextWS)
    , ("M-p", prevWS)
    , ("M-o", toggleWS)
    ]

defaultKeyOverrides = [ 
      ("M-q", ("M-S-r", spawn "if type xmonad; then xmonad --recompile && xmonad --restart; else xmessage xmonad not in \\$PATH: \"$PATH\"; fi")) -- %! Restart xmonad)
    -- , ("M-S-q", ("M-S-e", exitWi1th ExitSuccess))
    , ("M-S-c", ("M-S-q", kill))
    ]

defaultKeysRemoved = ["M-p"]

myRandrHook :: X ()
myRandrHook = do
    spawn "autorandr --change"
    spawn "nitrogen --restore"

rescreenCfg = def {
    randrChangeHook = myRandrHook
}

myStartupHook :: X ()
myStartupHook = do
    spawn "killall conky"   -- kill current conky on each restart
    spawn "killall trayer"  -- kill current trayer on each restart
    -- spawnOnce "xrandr --dpi 156"
    -- spawn "xrandr --dpi 156"
    -- spawnOnce "gnome-session"
    spawnOnce "picom --config ~/.config/picom/picom.conf" -- picom composite manager
    
    -- systray applets
    spawnOnce "nm-applet" -- network manager
    spawnOnce "pasystray" -- pasystray
    spawnOnce "blueman-applet" -- bluetooth applet
    spawnOnce "xscreensaver --no-splash &" -- lock-screen and screen-saver
    
    -- spawnOnce "volumeicon"
    -- spawnOnce "/usr/local/bin/emacs --daemon" -- emacs daemon for the emacsclient
    spawnOnce "nitrogen --restore &" -- set wallpaper
    spawnOnce "setxkbmap -option ctrl:nocaps" -- caps to ctrl
    spawnOnce "xsetroot -cursor_name left_ptr &" -- set cursor icon
    spawnOnce "xfce4-power-manager" -- power-manager
    spawnOnce "/usr/libexec/polkit-gnome-authentication-agent-1" -- polkit authentication

    spawnOnce "xinput set-prop 'ETPS/2 Elantech Touchpad' 'libinput Natural Scrolling Enabled' 1" -- natural scrolling
    
    spawn "sleep 2 && trayer --edge top --align right --SetDockType true --SetPartialStrut true --expand true --width 8 --transparent true --alpha 30 --tint 0x1b1b1b --height 30 --monitor \"primary\" &"

myManageHook :: ManageHook
myManageHook = composeAll
    [ className =? "Gimp" --> doFloat
    , className =? "Pavucontrol" --> doCenterFloat
    , isDialog            --> doFloat
    ]

myLayout = (tiled ||| Mirror tiled ||| Full ||| tabz ||| tabzRight ||| threeCol)
  where
    threeCol = magnifiercz' 1.3 $ ThreeColMid nmaster delta ratio
    tiled    = avoidStruts $ Tall nmaster delta ratio
    nmaster  = 1      -- Default number of windows in the master pane
    ratio    = 1/2    -- Default proportion of screen occupied by master pane
    delta    = 3/100  -- Percent of screen to increment by when resizing panes
    tabz     = tabbed shrinkText def { fontName = "xft:Hack:size=8"
                                     , decoHeight = 32
                                     , activeColor = "#FFFFFF"
                                     , inactiveColor = "#333333"
                                     , activeTextColor = "#000000"
                                     , inactiveTextColor = "#bbbbbb"
                                     }
    tabzRight = tabbedRight shrinkText def { fontName = "xft:Hack:size=8"
                                     , decoHeight = 32
                                     , activeColor = "#FFFFFF"
                                     , inactiveColor = "#333333"
                                     , activeTextColor = "#000000"
                                     , inactiveTextColor = "#bbbbbb"
                                     }

myXmobarPP :: PP
myXmobarPP = def
    { ppSep             = magenta " • "
    , ppTitleSanitize   = xmobarStrip
    , ppCurrent         = wrap " " "" . xmobarBorder "Top" "#8be9fd" 2
    , ppHidden          = white . wrap " " ""
    , ppHiddenNoWindows = lowWhite . wrap " " ""
    , ppUrgent          = red . wrap (yellow "!") (yellow "!")
    , ppOrder           = \[ws, l, _, wins] -> [ws, l, wins]
    , ppExtras          = [(logTitlesOnScreen 0) formatFocused formatUnfocused]
    }
  where
    formatFocused   = wrap (white    "[") (white    "]") . magenta . ppWindow
    formatUnfocused = wrap (lowWhite "[") (lowWhite "]") . blue    . ppWindow

    -- | Windows should have *some* title, which should not not exceed a
    -- sane length.
    ppWindow :: String -> String
    ppWindow = xmobarRaw . (\w -> if null w then "untitled" else w) . shorten 30

    blue, lowWhite, magenta, red, white, yellow :: String -> String
    magenta  = xmobarColor "#ff79c6" ""
    blue     = xmobarColor "#bd93f9" ""
    white    = xmobarColor "#f8f8f2" ""
    yellow   = xmobarColor "#f1fa8c" ""
    red      = xmobarColor "#ff5555" ""
    lowWhite = xmobarColor "#bbbbbb" ""


myXmobarPP' :: PP
myXmobarPP' = def
    { ppSep             = magenta " • "
    , ppTitleSanitize   = xmobarStrip
    , ppCurrent         = wrap " " "" . xmobarBorder "Top" "#8be9fd" 2
    , ppHidden          = white . wrap " " ""
    , ppHiddenNoWindows = lowWhite . wrap " " ""
    , ppUrgent          = red . wrap (yellow "!") (yellow "!")
    , ppOrder           = \[ws, l, _, wins] -> [ws, l, wins]
    , ppExtras          = [(logTitlesOnScreen 1) formatFocused formatUnfocused]
    }
  where
    formatFocused   = wrap (white    "[") (white    "]") . magenta . ppWindow
    formatUnfocused = wrap (lowWhite "[") (lowWhite "]") . blue    . ppWindow

    -- | Windows should have *some* title, which should not not exceed a
    -- sane length.
    ppWindow :: String -> String
    ppWindow = xmobarRaw . (\w -> if null w then "untitled" else w) . shorten 30

    blue, lowWhite, magenta, red, white, yellow :: String -> String
    magenta  = xmobarColor "#ff79c6" ""
    blue     = xmobarColor "#bd93f9" ""
    white    = xmobarColor "#f8f8f2" ""
    yellow   = xmobarColor "#f1fa8c" ""
    red      = xmobarColor "#ff5555" ""
    lowWhite = xmobarColor "#bbbbbb" ""
