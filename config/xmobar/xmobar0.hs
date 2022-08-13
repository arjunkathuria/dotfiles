Config { overrideRedirect = False
       , font     = "xft:Source Code Pro-9"
       , additionalFonts = [
                      "xft:FontAwesome-8"
                    , "xft:Font Awesome 6 Free Solid:pixelsize=9"
                    , "xft:Font Awesome 6 Brands:pixelsize=9"
                    , "xft:Nerd Fonts Symbols:pixelsize=9"
                    ]
       , bgColor  = "#1b1b1b"
       , fgColor  = "#f8f8f2"
       , position = TopSize L 94 34
       , commands = [
              Run Weather "VIDD"
              [ "--template", "<weather> <tempC>°C"
              , "-L", "0"
              , "-H", "25"
              , "--low"   , "lightblue"
              , "--normal", "#f8f8f2"
              , "--high"  , "red"
              ] 36000

              , Run Cpu
              [ "-L", "3"
              , "-H", "50"
              , "--high"  , "red"
              , "--normal", "green"
              ] 10

              , Run Alsa "default" "Master"
              [ "--template", "<fn=1>\xf028</fn> <volumestatus>"
              , "--suffix"  , "True"
              , "--"
              , "--on", ""
              ]

              , Run Battery [
              "-t", "<acstatus>: <left>% - <timeleft>",
              "--",
              --"-c", "charge_full",
              "-O", "AC",
              "-o", "Bats",
              "-h", "green",
              "-l", "red"
              ] 10

              , Run BatteryN ["BAT0"]
              ["-t", "<acstatus>"
              , "-S", "Off", "-d", "0", "-m", "3"
              , "-L", "10", "-H", "90", "-p", "3"
              , "-W", "0"
              , "-f", "\xf244\xf243\xf243\xf243\xf242\xf242\xf242\xf241\xf241\xf240"
              , "--"
              , "-P"
              , "-a", "notify-send -u critical 'Battery running out!!!!!!'"
              , "-A", "5"
              , "-i", "<fn=1>\xf1e6</fn>"
              , "-O", "<fn=1><leftbar> \xf1e6</fn>"
              , "-o", "<fn=1><leftbar></fn>"
              , "-H", "10", "-L", "7"
              ] 50 "batt0"

              , Run BatteryP ["BAT0"]
              ["-t", "<acstatus>"
              , "-L", "10", "-H", "80"
              , "-l", "red", "-h", "white"
              , "--", "-O", "Charging", "-o", "<left>% - <timeleft>"
              ] 10

              , Run Memory ["--template", "Mem: <usedratio>%"] 10

              , Run DynNetwork ["--template", "<dev>: IN <rx> <rxvbar> <txvbar> <tx> Out"] 10

              , Run Swap [] 10

              , Run Date "%a %d-%m-%Y <fc=#AAC0F0>%I:%M %p</fc>" "date" 10

              , Run XPropertyLog "_XMONAD_LOG_0"

              , Run Com "/home/arjun/.config/xmobar/scripts/cpu-temp.sh" [] "cpuT" 10
              ]

       , sepChar  = "%"
       , alignSep = "}{"
       , template =
         "\
         \%_XMONAD_LOG_0% }\
         \ %date% \
         \{\
         \<action=`pavucontrol`>%alsa:default:Master% </action>\
         \| \
         \%dynnetwork% \
         \| \
         \<action=`kitty htop`>%cpu% %cpuT% %memory% </action>\
         \| \
         \%batt0% %battery% "
       }
