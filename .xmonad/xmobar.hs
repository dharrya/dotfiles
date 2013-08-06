Config {
    font = "xft:Terminus-9"
    --font = "-*-terminus-*-r-*-*-12-*-*-*-*-*-*-*"
    , bgColor = "#222222"
    , fgColor = "#bbbbbb"
    , position = Static { xpos = 0, ypos = 0, width = 1480, height = 18 }
    , lowerOnStart = True
    
    , sepChar = "%"
    , alignSep = "}{"
    , template = "%StdinReader% }{ [ %cpu% ][ %memory% ][ %battery% ][ %wlp2s0wi% %wlp2s0% ][ %disku% ][ <icon=/home/dharrya/.xmonad/icons/xbm8x8/vol.xbm/> %volume% ] %date%"

    , commands = [
        Run Cpu
            ["-t","<icon=/home/dharrya/.xmonad/icons/xbm8x8/cpu.xbm/> <total>%","-L","3","-H","50","--normal","green","--high","red"]
            10
        
        , Run Memory
            ["-t","<icon=/home/dharrya/.xmonad/icons/xbm8x8/mem.xbm/> <usedratio>%","-H","7000","-L","2048","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC"]
            10
        
        , Run Battery
            ["-t","<icon=/home/dharrya/.xmonad/icons/xbm8x8/bat_full_01.xbm/> <left>%","-L","25","-H","75","--low","#FF0000","--normal","#F9FF00","--high","#00FF00"]
            600
        
        , Run Wireless "wlp2s0"
            ["-t","<icon=/home/dharrya/.xmonad/icons/xbm8x8/wifi_02.xbm/> <quality>%","-L","32","-H","80","--low","#FF0000","--normal","#F9FF00","--high","#00FF00"]
            10

        , Run Network "wlp2s0"
            ["-t","<rx>, <tx>","-H","200","-L","10","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC","-S","True"]
            10
        
        , Run DiskU 
            [("/home", "<icon=/home/dharrya/.xmonad/icons/xbm8x8/diskette.xbm/> <free>")]
            ["-L", "20", "-H", "100", "-m", "1", "-p", "3", "-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC"]
            10

        , Run Com 
            "/home/dharrya/.xmonad/bin/getvolume" [] "volume"
            10    
        
        , Run Date
            "%a %b %_d ((( <fc=#ee9a00>%H:%M</fc> )))" "date"
            10
        
        , Run StdinReader
    ]
}