#Persistent
#singleinstance force
global FoundX := 0 
global FoundY := 0
global character := "MotherT"
global haveEnergy := 1

    Send {Shift}
    sleep % ran(4995, 6999)
	IfWinNotExist, %character%
	Run, C:\Program Files (x86)\Nox\bin\Nox.exe -clone:Nox_3
        sleep % ran(18995, 19999)
	winactivate, %character%
	WinWaitActive, %character%
	if (imageCheck(*TransBlack "yoda.bmp")) {
        	sleepRan(2)
		Click, %FoundX%, %FoundY% 
		sleep 20
	}
	msgBox "Got here 1"
	if (imageCheck(*TransBlack "settings.bmp")=false) {
		returnToHome()
	}
        msgBox "Got Here"



imageCheck(fileName, x1:=0, y1:=0, x2:=0, y2:=0)
{
winactivate, %character%
WinWaitActive, %character%
WinGetActiveStats, Title, ww, hh, xx, yy
if(x2=0) {
x2:=ww
}
if(y2=0) {
y2:=hh
}
ImageSearch, FoundX, FoundY, x1, y1, x2, y2,*120 %fileName%
if ErrorLevel = 2 
		{
;		msgBox Error
    }
else if ErrorLevel = 1
{
 ;   msgbox %fileName%notfound
    return false
    }
else
    return true
}

returnToHome(){
	while (imageCheck("settings.png") = false) {
	if (imageCheck("yoda.png")) {
	Click, %FoundX%, %FoundY% 
	return
	}
	Send {Esc}
	sleep 1000
	}
}

ran(min,max) {
	random, ran, min, max
	return ran
}