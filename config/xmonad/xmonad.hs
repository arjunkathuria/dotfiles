import System.Exit (exitSuccess)
import XMonad
import XMonad.Actions.CycleWS (nextWS, prevWS, toggleWS)
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers (doCenterFloat, isDialog)
import XMonad.Hooks.RefocusLast (isFloat)
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP
import XMonad.Layout.Magnifier
import XMonad.Layout.Master
import XMonad.Layout.MultiColumns
import XMonad.Layout.NoBorders (smartBorders)
import XMonad.Layout.Spacing (smartSpacing, smartSpacingWithEdge, spacingWithEdge)
import XMonad.Layout.Tabbed
import XMonad.Layout.ThreeColumns
import XMonad.Prompt.ConfirmPrompt
import XMonad.Util.EZConfig
import XMonad.Util.Loggers
import XMonad.Util.SpawnOnce
import XMonad.Util.Ungrab (unGrab)

main :: IO ()
main =
  xmonad
    . ewmhFullscreen
    . ewmh
    . docks
    . dynamicEasySBs statusBarsSpawner
    $ myConfig

myConfig =
  def
    { modMask = mod4Mask, -- Rebind Mod to the Super key
      terminal = "kitty",
      startupHook = myStartupHook,
      manageHook = myManageHook, -- Match on certain windows
      layoutHook = myLayout, -- Use custom layouts
      focusedBorderColor = "#4c7899"
    }
    `additionalKeysP` myKeymap

myManageHook :: ManageHook
myManageHook =
  composeAll
    [ className =? "Gimp" --> doFloat,
      className =? "Pavucontrol" --> doCenterFloat,
      appName =? "REAPER" --> doCenterFloat,
      className =? "REAPER" --> doCenterFloat,
      isDialog --> doFloat,
      isFloat --> doCenterFloat
    ]

myKeymap =
  [ ("M-<Return>", spawn $ terminal myConfig),
    ("M-S-z", spawn "xflock4"),
    ("M-S-q", confirmPrompt def "exit" $ io exitSuccess),
    -- screenshots
    ("M-S-=", unGrab *> spawn "scrot -s"),
    ("M-S-v", unGrab >> spawn "scrot -m ~/Pictures/screenshots/screenshot-%Y%m%dT%H%M%S.png"),
    ("M-]", spawn "firefox"),
    -- rofi
    ("M-d", spawn "rofi -show combi"),
    ("M1-<Tab>", spawn "rofi -show window"),
    -- volume and brightness keys
    ("<XF86AudioRaiseVolume>", spawn "pactl set-sink-volume 0 +5%"),
    ("<XF86AudioLowerVolume>", spawn "pactl set-sink-volume 0 -5%"),
    ("<XF86AudioMute>", spawn "pactl set-sink-mute 0 toggle"),
    ("<XF86MonBrightnessDown>", spawn "brightnessctl set 5%-"),
    ("<XF86MonBrightnessUp>", spawn "brightnessctl set 5%+"),
    ("M-b", sendMessage ToggleStruts),
    -- screens config refresh (when i connect or disconnect more screen)
    ("M-S-d", spawn "autorandr -c"),
    -- workspace switching keys
    ("M-n", nextWS),
    ("M-p", prevWS),
    ("M-o", toggleWS),
    -- hide polybar
    ("M-S-b", spawn "polybar-msg cmd toggle"),
    -- resart xmonad
    ("M-S-r", spawn "killall xmobar; xmonad --recompile; xmonad --restart")
  ]

myStartupHook :: X ()
myStartupHook = do
  spawnOnce "xrandr --dpi 124 &"
  spawnOnce "picom -b --config ~/.config/picom/picom.conf &" -- picom composite manager
  -- systray applets
  spawn "killall trayer"
  spawn "sleep 2 && trayer --edge top --align right --widthtype percent --width 6 --height 34 --transparent true --tint 0x1b1b1b"

  spawnOnce "nm-applet &" -- network manager
  -- spawnOnce "pasystray" -- pasystray
  spawnOnce "blueman-applet &" -- bluetooth applet
  -- spawnOnce "xscreensaver --no-splash &" -- lock-screen and screen-saver
  spawnOnce "nitrogen --restore &" -- set wallpaper
  spawnOnce "setxkbmap -option ctrl:nocaps" -- caps to ctrl
  spawnOnce "xsetroot -cursor_name left_ptr &" -- set cursor icon
  spawnOnce "xfce4-power-manager &" -- power-manager
  -- spawnOnce "/usr/libexec/polkit-gnome-authentication-agent-1"
  spawnOnce "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &" -- polkit authentication
  -- spawnOnce "$HOME/.config/polybar/launch.sh &"
  spawnOnce "xinput set-prop 'ETPS/2 Elantech Touchpad' 'libinput Natural Scrolling Enabled' 1 &" -- natural scrolling

myLayout =
  smartSpacingWithEdge 5 $
    smartBorders $
      avoidStruts
        (tiled ||| Mirror tiled ||| Full ||| tabz ||| tabzRight ||| masterAndTabs ||| threeCol)
  where
    threeCol = magnifiercz' 1.3 $ ThreeColMid nmaster delta ratio
    tiled = Tall nmaster delta ratio
    nmaster = 1 -- Default number of windows in the master pane
    ratio = 1 / 2 -- Default proportion of screen occupied by master pane
    delta = 3 / 100 -- Percent of screen to increment by when resizing panes
    tabz =
      tabbed
        shrinkText
        def
          { fontName = "xft:Hack:size=8",
            decoHeight = 32,
            activeColor = "#FFFFFF",
            inactiveColor = "#333333",
            activeTextColor = "#000000",
            inactiveTextColor = "#bbbbbb"
          }
    tabzRight =
      tabbedRight
        shrinkText
        def
          { fontName = "xft:Hack:size=8",
            decoHeight = 32,
            activeColor = "#FFFFFF",
            inactiveColor = "#333333",
            activeTextColor = "#000000",
            inactiveTextColor = "#bbbbbb"
          }

    masterAndTabs = mastered (1 / 100) (1 / 2) $ tabbed shrinkText theme
      where
        theme =
          def
            { fontName = "xft:FreeSans:size=11",
              activeBorderColor = "#81A1C1",
              inactiveBorderColor = "#3B4252"
            }

makeXmobarPPTop :: ScreenId -> PP
makeXmobarPPTop screenId =
  def
    { ppSep = magenta " • ",
      ppTitleSanitize = xmobarStrip,
      ppCurrent = wrap " " "" . xmobarBorder "Top" "#8be9fd" 2,
      ppHidden = white . wrap " " "",
      ppHiddenNoWindows = lowWhite . wrap " " "",
      ppUrgent = red . wrap (yellow "!") (yellow "!"),
      ppOrder = \[ws, l, _, wins] -> [ws, wins],
      ppExtras = [(logTitlesOnScreen screenId) formatFocused formatUnfocused]
    }
  where
    formatFocused = wrap (white "[") (white "]") . magenta . ppWindow
    formatUnfocused = wrap (lowWhite "[") (lowWhite "]") . blue . ppWindow

    -- \| Windows should have *some* title, which should not not exceed a
    -- sane length.
    ppWindow :: String -> String
    ppWindow = xmobarRaw . (\w -> if null w then "untitled" else w) . shorten 30

    blue, lowWhite, magenta, red, white, yellow :: String -> String
    magenta = xmobarColor "#ff79c6" ""
    blue = xmobarColor "#bd93f9" ""
    white = xmobarColor "#f8f8f2" ""
    yellow = xmobarColor "#f1fa8c" ""
    red = xmobarColor "#ff5555" ""
    lowWhite = xmobarColor "#bbbbbb" ""

topStatusBarSpawner screenId@(S s) =
    statusBarPropTo
      ("_XMONAD_LOG_" <> show s)
      ("xmobar -x " <> show s <> " ~/.config/xmobar/xmobar" <> show s <> ".hs")
      (pure $ makeXmobarPPTop screenId)

statusBarsSpawner :: ScreenId -> IO StatusBarConfig
statusBarsSpawner screenId@(S s) =
  pure $ topStatusBarSpawner screenId
