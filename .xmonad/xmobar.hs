-- xmobar config used by Vic Fryzel
-- Author: Vic Fryzel
-- http://github.com/vicfryzel/xmonad-config

-- This is setup for dual 1920x1080 monitors, with the right monitor as primary
Config {
    --font = "xft:Fixed-8",
    font = "-*-terminus-*-r-normal-*-8-120-*-*-*-*-iso8859-*",
    bgColor = "#000000",
    fgColor = "#ffffff",
    position = Static { xpos = 0, ypos = 0, width = 1480, height = 16 },
    lowerOnStart = True,
    commands = [
        --Run Weather "KPAO" ["-t","<tempF>F <skyCondition>","-L","64","-H","77","-n","#CEFFAC","-h","#FFB6B0","-l","#96CBFE"] 36000,
        --Run MultiCpu ["-t","Cpu: <total>%","-L","30","-H","60","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC","-w","3"] 10,
        Run Cpu ["-L","3","-H","50","--normal","green","--high","red"] 10,
        Run Memory ["-t","Mem: <usedratio>%","-H","8192","-L","4096","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC"] 10,
        --Run Swap ["-t","Swap: <usedratio>%","-H","1024","-L","512","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC"] 10,
        Run Wireless "wlp2s0" ["-t","wlp2s0: %","-L","0","-H","32","--normal","green","--high","red"] 10,
        Run Battery ["-t","Batt: <left>%","-L","25","-H","75","--low","#FF0000","--normal","#F9FF00","--high","#00FF00"] 600,
        --Run Battery ["Bat0"] 600,
        Run Network "wlp2s0" ["-t","Net: <rx>, <tx>","-H","200","-L","10","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC","-S","True"] 10,
        Run Com "~/.xmonad/bin/getvolume" [] "volume" 10,
        Run DiskU [("/", "Disk: <free>")]
                  ["-L", "20", "-H", "100", "-m", "1", "-p", "3", "-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC"] 10,
        Run Date "%a %b %_d %H:%M" "date" 10,
        Run StdinReader
    ],
    sepChar = "%",
    alignSep = "}{",
    --template = "%StdinReader% }{ %multicpu%   %memory%   %swap%   %eth0%   <fc=#FFFFCC>%date%</fc>   %KPAO%"
    template = "%StdinReader% }{ %cpu% %memory% %battery% %wlp2s0% %disku% Vol: %volume% <fc=#FFFFCC>%date%</fc>"
}
