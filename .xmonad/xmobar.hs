Config {
    --font = "xft:Fixed-8",
    font = "-*-terminus-*-r-normal-*-8-120-*-*-*-*-iso8859-*",
    bgColor = "#000000",
    fgColor = "#ffffff",
    position = Static { xpos = 0, ypos = 0, width = 1480, height = 16 },
    lowerOnStart = True,
    commands = [
        Run Cpu ["-L","3","-H","50","--normal","green","--high","red"] 10,
        Run Memory ["-t","Mem: <usedratio>%","-H","8192","-L","4096","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC"] 10,
        Run Wireless "wlp2s0" ["-t","wlp2s0: <essid> <quality>%","-L","32","-H","80","--low","#FF0000","--normal","#F9FF00","--high","#00FF00"] 10,
        Run Battery ["-t","Batt: <left>%","-L","25","-H","75","--low","#FF0000","--normal","#F9FF00","--high","#00FF00"] 600,
        Run Network "wlp2s0" ["-t","<rx>, <tx>","-H","200","-L","10","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC","-S","True"] 10,
        Run Com "~/.xmonad/bin/getvolume" [] "volume" 10,   
        Run DiskU [("/", "Disk: <free>")]
                  ["-L", "20", "-H", "100", "-m", "1", "-p", "3", "-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC"] 10,
        Run Date "%a %b %_d %H:%M" "date" 10,
        Run StdinReader
    ],
    sepChar = "%",
    alignSep = "}{",
    template = "%StdinReader% }{ %cpu% %memory% %battery% %wlp2s0wi% %wlp2s0% %disku% Vol: %volume% <fc=#FFFFCC>%date%</fc>"
}
