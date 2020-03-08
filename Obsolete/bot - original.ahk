;initialization
#Persistent
#singleinstance force

;load nox
Run, C:\Program Files (x86)\Nox\bin\Nox.exe

;initialize variables
global FoundX := 0 
global FoundY := 0
global timeCheckFlag := 2
global dailyChallenges := 1
global shipmentFlag := 1
global cEnergy := 1
SetTimer, timeChecker, 3600000, On

Loop {
	IfWinNotExist, NoxPlayer
	Run, C:\Program Files (x86)\Nox\bin\Nox.exe
	winactivate, NoxPlayer
	WinWaitActive, NoxPlayer
	if (imageCheck("yoda.bmp")) {
	Click, %FoundX%, %FoundY% 
	sleep 20
	}
	if (imageCheck("settings.bmp")=false) 
	{
	returnToHome()
	}
	if(shipmentFlag > 0 && imageCheck("settings.bmp")=true)
	{
	shipments()
	}
	if (timeCheckflag > 0) 
	{
	getFreeEnergy()
	}
	if(dailyChallenges > 0 && imageCheck("settings.bmp")=true)
	{
	dalies()
	}
	;if(cEnergy > 0 && imageCheck("settings.bmp")=true)
	;{
	;cantAttack()
	;}
	if(imageCheck("store.bmp", 845, 245, 885, 330))
	{
	Click, %FoundX%, %FoundY% 
	sleep 1000
	Click, 250, 500
	sleep 1000
	Click, 1385, 870
	returnToHome()
	}
	timeCheck()
}


dalies(){
MouseClickDrag, Left, 250, 500, 950, 500, 75
sleep 2000
Click, 500, 540
sleep 2000
if(imageCheck("challenge.bmp", 685, 810, 775, 850))
{
Click, %FoundX%, %FoundY% 
sleep 2000
}
if(imageCheck("challenge.bmp", 215, 810, 315, 850))
{
Click, %FoundX%, %FoundY% 
sleep 2000
}
if(imageCheck("challenge2.bmp", 685, 810, 775, 850))
{
Click, %FoundX%, %FoundY% 
sleep 2000
}
if(imageCheck("challenge2.bmp", 200, 820, 355, 858))
{
Click, %FoundX%, %FoundY% 
sleep 2000
}
else
{
Click, 75, 240
sleep 1000
Click, 75, 240
sleep 1000
dailyChallenges --
return
}
Click, 250, 500
sleep 2000
Click, 1380, 870
sleep 1000
	while (imageCheck("autoOff.bmp")=false)
	{
	sleep 1000
	}
	Click, 60, 180
	while (imageCheck("win.bmp",560, 450, 780, 780)=false)
	{
	sleep 1000
	}
	sleep 1000
	returnToHome()
	dailyChallenges --
}

cantAttack(){
;open cantina
Click, 400, 375
sleep 1000
;check which target?
if(imageCheck("talia.bmp"))
{
Click, 650, 515
sleep 1000
}
if(imageCheck("hera.bmp"))
{
Click, 1410, 780
sleep 2000
while (imageCheck("ooe.bmp", 545, 585, 570, 625) =false && imageCheck("battle.bmp") =false && imageCheck("borrow.bmp") = false)
{
sleep 1000
}
if(imageCheck("ooe.bmp", 545, 585, 570, 625))
{
cEnergy := 0
return
}
if imageCheck("battle.bmp") =false Click, 250, 500
sleep 2000
Click, 1380, 870
sleep 1000
while (imageCheck("autoOff.bmp")=false)
{
sleep 1000
}
Click, 60, 180
while (imageCheck("win.bmp",560, 450, 780, 780)=false)
{
sleep 1000
}
returnToHome()
sleep 1000
}
return
}

shipments(){
;first open shipments
Click, 670, 280
sleep 1000
;select first shipment
Click, 475, 400
sleep 1000
;is it available to buy?
if (imageCheck("buy.bmp",560, 450, 780, 780) = true) {
Click, %FoundX%, %FoundY% 
sleep 1000
}
else {
Send {Esc}
sleep 1000
}
Click, 820, 400
sleep 1000
if (imageCheck("buy.bmp",560, 450, 780, 780) = true) {
Click, %FoundX%, %FoundY% 
sleep 1000
}
else {
Send {Esc}
sleep 1000
}
Click, 1150, 400
sleep 1000
if (imageCheck("buy.bmp",560, 450, 780, 780) = true) {
Click, %FoundX%, %FoundY% 
sleep 1000
}
else {
Send {Esc}
sleep 1000
}
Click, 475, 725
sleep 1000
if (imageCheck("buy.bmp",560, 450, 780, 780) = true) {
Click, %FoundX%, %FoundY% 
sleep 1000
}
else {
Send {Esc}
sleep 2000
}
shipmentFlag := 0
returnToHome()
sleep 1000
}

timeCheck(){
;check what the minute is, if on the hour check the hour
if(A_Min = 00) 
{	
	;if the hour is relevant update check flag
	if (A_Hour = 09 || A_Hour = 15 || A_Hour = 18)
	{
	timeCheckFlag ++
	timeCheckFlag ++
	}
	}
}

getFreeEnergy(){
;open quest screen
sleep 5000
Click, 1385, 870
sleep 1000
;check if daily quests are currently selected, if not click them.
while (imageCheck("quests.bmp", 130, 50, 320, 145)=false)
{
}
if (imageCheck("dailies.bmp")=false) {
	Click, 95, 240
sleep 2000
}
if(imageCheck("energy.bmp", 200, 260, 235, 305)=true) {
sleep 1000
Click, 1385, 870
sleep 1000
}
timeCheckFlag --
}

returnToHome(){
	while (imageCheck("settings.bmp") = false) {
	if (imageCheck("yoda.bmp")) {
	Click, %FoundX%, %FoundY% 
	return
	}
	Send {Esc}
	sleep 1000
	}
}

imageCheck(fileName, x1:=0, y1:=0, x2:=0, y2:=0)
{
winactivate, NoxPlayer
WinWaitActive, NoxPlayer
WinGetActiveStats, Title, ww, hh, xx, yy
if(x2=0) x2:=ww
if(y2=0) y2:=hh
ImageSearch, FoundX, FoundY, x1, y1, x2, y2, %fileName%
if ErrorLevel = 2 
		{
		msgBox Error
    }
else if ErrorLevel = 1
{
    return false
    }
else
    return true
}

timeChecker:
cEnergy ++
dailyChallenges ++
shipmentFlag ++
timeCheckFlag ++
timeCheckFlag ++
return