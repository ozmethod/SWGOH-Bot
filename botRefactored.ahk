;initialization
#Persistent
#singleinstance force
#include functionFile.txt

;initialize variables
global FoundX := 0
global FoundY := 0
global timeCheckFlag := 2
global dailyChallenges := 1
global shipmentFlag := 1
global haveEnergy:=1
global character := "none"
SetTimer, timeChecker, 3600000, On

global closeNox := 1

;mainRoutine()

mainRoutine(newCharacter,path){
    sleep 1000
    character:=newCharacter
;    PostMessage, 0x0112, 0x0F060, 0,, A
    sleep % ran(4995, 6999)
	IfWinNotExist, %character%
	{
		Run, C:\Program Files (x86)\Nox\bin\Nox.exe %path%
        sleep % ran(29995, 30999)
	}
	winactivate, %character%
	WinWaitActive, %character%
	Send {Esc}
        sleep % ran(1995, 2999)
	if (imageCheck(*TransBlack "yoda.bmp")) {
        	sleep % ran(1995, 2999)
		Click, %FoundX%, %FoundY%
		sleep 60000
		while (imageCheck("disney.PNG") || imageCheck("capital.PNG") || imageCheck("titleScreen.PNG"))
		{
			sleep % ran(1995, 2999)
		}
	}
	if (imageCheck(*TransBlack "settings.bmp")=false) {
		returnToHome()
	}
 	freePack()
	returnToHome()
	if(imageCheck(*TransBlack "settings.bmp")=true)
	{
		shipments()
	}
	else {
		returnToHome()
		shipments()
	}
	if (imageCheck(*TransBlack "settings.bmp")=false) {
		returnToHome()
	}
	getFreeEnergy()
	if (imageCheck(*TransBlack "settings.bmp")=false) {
		returnToHome()
	}
	if (A_Hour = 18 || A_Hour = 6 || A_Hour = 17 || A_Hour = 5) {
		claimLogin()
	}
	sleep % ran(1995, 2999)
	if (character != "Ozmethod2" && character != "Bossk") {
		dailies()
		if(A_WDay = 1){
			SundayDaily()
		}
	}
	if (A_Hour = 21) {
		sleep % ran(1995, 2999)
		if(imageCheck("settings.png")=true)
		{
			dailyQuest()
		}
	}
	if(character = "Ozmethod2") {
		ticketDailies("Ozmethod2","-clone:Nox_7")
	}
	if(character = "Bossk") {
		bosskDailies("Bossk","-clone:Nox_4")
	}
	if(character = "OzmethodT3") {
		OzTicketDailies("OzmethodT3","-clone:Nox_1")
	}
	if(character = "OzmethodT4") {
		OzTicketDailies("OzmethodT4","-clone:Nox_2")
	}
	if(character = "OzmethodT5") {
		OzTicketDailies("OzmethodT5","-clone:Nox_3")
	}
	if (closeNox = 1){
		Send !{f4}
		sleep % ran(1995, 2999)
		Send {Enter}
	}
}




dailyQuest(){
		if(A_WDay = 1){
			openCantina()
		}
                else if(A_WDay = 6){
			openDark()
		}
		else {
			openLight()
		}
		click, 130, 180
		sleep % ran(1995, 2999)
                if(A_WDay = 4){
			click, 1400, 875
			sleep % ran(1995, 2999)
		}
                else {
			click, 200, 875
			sleep % ran(1995, 2999)
                }
		click, 1400, 775
		sleep % ran(1995, 2999)
		click, 250, 500
		sleep % ran(1995, 2999)
		click, 1400, 875
		sleep % ran(10950, 15990)
		click, 55, 85
		sleep % ran(1995, 2999)
		click, 800, 775
		sleep % ran(1995, 2999)
		click, 600, 600
		sleep % ran(3995, 4999)
	returnToHome()
}

dailies(){
	openChallenges()
	if(imageCheck("enter.bmp", 175, 775, 400, 875) || imageCheck("enter.png", 175, 775, 400, 875))
	{
	Click, %FoundX%, %FoundY%
	sleep % ran(1995, 2999)
	}
	if (character = "OzmethodT3" || character = "OzmethodT5" || character = "OzmethodT4" ||){
		simDaily()
		returnToHome()
		SundayDaily()
		return
	}
	if(imageCheck("actBattle.bmp", 685, 700, 900, 950) || imageCheck("actBattle.png", 685, 750, 900, 950))
	{
		Click, %FoundX%, %FoundY%
		sleep % ran(1995, 2999)
	}
	else if(imageCheck("actBattle.bmp", 200, 700, 400, 958) || imageCheck("actBattle.bmp", 200, 700, 400, 958))
	{
		Click, %FoundX%, %FoundY%
		sleep % ran(1995, 2999)
	}
	else
	{
		returnToHome()
		return
	}
	Click, 250, 500
	sleep % ran(1995, 2999)
	Click, 1380, 870
	sleep % ran(5995, 6999)
	while (imageCheck("autoOff.bmp")=false)
	{
		sleep % ran(1995, 2999)
	}
	Click, 250, 80
	while (imageCheck("challengeVictory.bmp")=false)
	{
		sleep % ran(1995, 2999)
	}
	sleep % ran(995, 2999)
	returnToHome()
}

SundayDaily(){
; daily 2
	openChallenges()
	if(imageCheck("enter.bmp", 675, 775, 800, 875) || imageCheck("enter.png", 675, 775, 800, 875))
	{
		Click, %FoundX%, %FoundY%
		sleep % ran(1995, 2999)
	}
	if (character = "OzmethodT3" || character = "OzmethodT5" || character = "OzmethodT4" ||){
		simDaily()
		returnToHome()
		return
	}
	if(imageCheck("actBattle.bmp", 685, 700, 900, 950) || imageCheck("actBattle.png", 685, 750, 900, 950))
	{
	Click, %FoundX%, %FoundY%
	sleep % ran(1995, 2999)
	}
	else if(imageCheck("actBattle.bmp", 200, 700, 400, 958) || imageCheck("actBattle.bmp", 200, 700, 400, 958))
	{
	Click, %FoundX%, %FoundY%
	sleep % ran(1995, 2999)
	}
	else
	{
	returnToHome()
	return
	}
	Click, 250, 500
	sleep % ran(1995, 2999)
	Click, 1380, 870
	sleep % ran(5995, 6999)
	while (imageCheck("autoOff.bmp")=false)
	{
		sleep % ran(1995, 2999)
	}
	Click, 250, 80
	while (imageCheck("challengeVictory.bmp")=false)
	{
	sleep % ran(1995, 2999)
	}
	sleep % ran(995, 2999)
	returnToHome()
; daily 3
	openChallenges()
	if(imageCheck("enter.bmp", 1125, 775, 1250, 875) || imageCheck("enter.png", 1125, 775, 1250, 875))
	{
	Click, %FoundX%, %FoundY%
	sleep % ran(1995, 2999)
	}
	if (character = "OzmethodT3" || character = "OzmethodT5" || character = "OzmethodT4" ||){
		simDaily()
		returnToHome()
		return
	}
	if(imageCheck("actBattle.bmp", 685, 700, 900, 950) || imageCheck("actBattle.png", 685, 750, 900, 950))
	{
	Click, %FoundX%, %FoundY%
	sleep % ran(1995, 2999)
	}
	else if(imageCheck("actBattle.bmp", 200, 700, 400, 958) || imageCheck("actBattle.bmp", 200, 700, 400, 958))
	{
	Click, %FoundX%, %FoundY%
	sleep % ran(1995, 2999)
	}
	else
	{
	returnToHome()
	return
	}
	Click, 250, 500
	sleep % ran(1995, 2999)
	Click, 1380, 870
	sleep % ran(5995, 6999)
	while (imageCheck("autoOff.bmp")=false)
	{
		sleep % ran(1995, 2999)
	}
	Click, 250, 80
	while (imageCheck("challengeVictory.bmp")=false)
	{
	sleep % ran(1995, 2999)
	}
	sleep % ran(995, 2999)
	returnToHome()
	sleep % ran(995, 2999)
	returnToHome()
}

claimLogin(){
	sleep % ran(995, 2999)
	Click, 75, 600
	sleep % ran(995, 2999)
	Click, 1300, 850
	sleep % ran(995, 2999)
	Click, 1300, 850
	sleep % ran(995, 2999)
	Click, 1300, 850
	sleep % ran(995, 2999)
	Click, 600, 200
	sleep % ran(995, 2999)
	Click, 1300, 800
	sleep % ran(995, 2999)
}


freePack(){
	Click, 915, 250
	sleep % ran(1995, 2999)
	if(imageCheck("free.png"))
	{
		Click, %FoundX%, %FoundY%
		sleep % ran(1995, 2999)
		Click, 1350,850
		sleep % ran(995, 2999)
		Send {Esc}
		sleep % ran(1995, 2999)
		Send {Esc}
		sleep % ran(1995, 2999)
		Send {Esc}
		sleep % ran(1995, 2999)
		Send {Esc}
		sleep % ran(1995, 2999)
		Send {Esc}
		sleep % ran(1995, 2999)
		Send {Esc}
		sleep % ran(1995, 2999)
	}
	returnToHome()
}

getFreeEnergy(){
;open quest screen
sleep % ran(4995, 6999)
Click, 1385, 870
sleep % ran(1995, 2999)
;check if daily quests are currently selected, if not click them.
;while (imageCheck("quests.bmp", 130, 50, 320, 145)=false)
;{
;}
;if (imageCheck("dailies.bmp")=false) {
	Click, 95, 240
sleep % ran(1995, 2999)
;}
while(imageCheck(*TransBlack "energy.bmp", 200, 260, 339, 305)=true || imageCheck(*TransBlack "energy.png", 200, 260, 339, 305)=true) {
sleep % ran(995, 2999)
Click, 1385, 870
;msgBox "Would have clicked"
sleep % ran(995, 2999)
}
Send {Esc}
}

shipments(){
sleep % ran(995, 2999)
;first open shipments
Click, 670, 280
sleep % ran(995, 2999)
;select first shipment
Click, 475, 400
sleep % ran(995, 2999)
;is it available to buy?
if (imageCheck(*TransBlack "buy.bmp",560, 450, 780, 780) = true) {
Click, %FoundX%, %FoundY%
sleep % ran(995, 2999)
}
else {
Send {Esc}
sleep % ran(995, 2999)
returnToHome()
return
}
; second
Click, 820, 400
sleep % ran(995, 2999)
if (imageCheck("buy.png",560, 450, 780, 780) = true) {
Click, %FoundX%, %FoundY%
sleep % ran(995, 2999)
}
else {
Send {Esc}
sleep % ran(995, 2999)
}
; third
Click, 1150, 400
sleep % ran(995, 2999)
if (imageCheck("buy.png",560, 450, 780, 780) = true) {
Click, %FoundX%, %FoundY%
sleep % ran(995, 2999)
}
else {
Send {Esc}
sleep % ran(995, 2999)
}
; fourth
Click, 475, 725
sleep % ran(995, 2999)
if (imageCheck("buy.png",560, 450, 780, 780) = true) {
Click, %FoundX%, %FoundY%
sleep % ran(995, 2999)
}
else {
Send {Esc}
sleep % ran(1995, 2999)
}
; dengar
;if (character != "MotherT" && character != "Bast" && character != "Bast2"){
;	click, 965, 200
;	MouseClickDrag, Left, 1160, 700, 1160, 300, 75
;	if(imageCheck("dengar.png") = true || imageCheck("dengar.bmp") = true){
;		click 500, 700
;		sleep % ran(995, 2999)
;		if (imageCheck("buy.png",560, 450, 780, 780) = true) {
;			Click, %FoundX%, %FoundY%
;			sleep % ran(995, 2999)
;		}
;	}
;}
;talia
;if (character = "MotherT"){
;	click, 965, 200
;	MouseClickDrag, Left, 1160, 700, 1160, 300, 75
;	MouseClickDrag, Left, 1160, 700, 1160, 300, 75
;	if(imageCheck("buyTalia.png") = true || imageCheck("buyTalia.bmp") = true){
;		click 850, 700
;		sleep % ran(995, 2999)
;		if (imageCheck("buy.png",560, 450, 780, 780) = true) {
;			Click, %FoundX%, %FoundY%
;			sleep % ran(995, 2999)
;		}
;	}
;}
;old ben
if (character = "Bast" || character = "MotherT"){
	click, 965, 200
	MouseClickDrag, Left, 1160, 700, 1160, 300, 75
	MouseClickDrag, Left, 1160, 700, 1160, 300, 75
	if(imageCheck("oldBen.png") = true || imageCheck("oldBen.bmp") = true){
		click 450, 700
		sleep % ran(995, 2999)
		if (imageCheck("buy.png",560, 450, 780, 780) = true) {
			Click, %FoundX%, %FoundY%
			sleep % ran(995, 2999)
		}
	}
}
;Han
if (character = "Bast2"){
	click, 965, 200
	if(imageCheck("Han.png") = true || imageCheck("Han.bmp") = true){
		click 450, 700
		sleep % ran(995, 2999)
		if (imageCheck("buy.png",560, 450, 780, 780) = true) {
			Click, %FoundX%, %FoundY%
			sleep % ran(995, 2999)
		}
	}
}
shipmentFlag := 0
returnToHome()
sleep % ran(995, 2999)
}



ticketDailies(newCharacter,path){
    character:=newCharacter
    Send {Shift}
    sleep % ran(4995, 6999)
	IfWinNotExist, %character%
	Run, C:\Program Files (x86)\Nox\bin\Nox.exe %path%
        sleep % ran(1995, 2999)
	winactivate, %character%
	WinWaitActive, %character%
	if (imageCheck(*TransBlack "yoda.bmp")) {
        	sleep % ran(1995, 2999)
		Click, %FoundX%, %FoundY%
		sleep 20
	}
	if (imageCheck(*TransBlack "settings.bmp")=false) {
		returnToHome()
	}
; regular farm, i think
	openDark()
	click 400, 880
	sleep % ran(995, 2999)
	click 1400, 175
	sleep % ran(995, 2999)
	click 1300, 175
	sleep % ran(995, 2999)
	click 400, 880
	sleep % ran(995, 2999)
	; MOVING TO ITEM
	click 225, 450
	sleep % ran(995, 2999)
	click 300, 500
	sleep % ran(995, 2999)
	;SIMMING
	multiSim()
	returnToHome()
;cantina
	openCantina()
	click 100, 175
	sleep % ran(1995, 3999)
	MouseClickDrag, Left, 901, 500, 200, 500, 75
	sleep % ran(1995, 2999)
	click 575, 515
	sleep % ran(1995, 3999)
	multiSim()
	returnToHome()
; mods
	openMods()
	MouseClickDrag, Left, 1500, 500, 150, 500, 75
	sleep % ran(1995, 2999)
	MouseClickDrag, Left, 1500, 500, 150, 500, 75
	sleep % ran(1995, 2999)
	click 1300, 850
	sleep % ran(1995, 3999)
	click 1300, 750
	sleep % ran(1995, 3999)
	click 800, 600
	sleep % ran(2995, 3999)
	returnToHome()
; ships
	openShips()
	click 800, 700
	sleep % ran(1995, 2999)
	click 100, 175
	sleep % ran(1995, 2999)
	click 400, 875
	sleep % ran(1995, 2999)
	click 1200, 775
	sleep % ran(1995, 2999)
	click 800, 600
	sleep % ran(2995, 3999)
	returnToHome()
; extra energy
	if(A_Hour = 18)	{
		buyEnergy()
	; sim bossk
			click 1000, 600
			sleep % ran(995, 2999)
			click 1400, 180
			sleep % ran(995, 2999)
			click 1200, 900
			sleep % ran(995, 2999)
			click 200, 500
			sleep % ran(995, 2999)
			multiSim()
			returnToHome()
		}
; galactic war
	if(A_Hour = 06)	{
		returnToHome()
		click 1400, 300
		sleep % ran(1995, 3999)
		click 300, 900
		sleep % ran(1995, 3999)
		click 800, 900
		sleep % ran(1995, 3999)
		click 800, 600
		sleep % ran(3995, 4999)
		returnToHome()
	}
; arena
	if(A_Hour != 21){
		click 1200, 400
		sleep % ran(1995, 3999)
		click 1300, 825
		sleep % ran(1995, 3999)
		click 1300, 875
		sleep % ran(61995, 63999)
		click 50, 82
		sleep % ran(1995, 3999)
		click 800, 800
		sleep % ran(1995, 3999)
		click 600, 600
		sleep % ran(1995, 3999)
		returnToHome()
	}
; ship challenge
	if(A_Day != 2 && A_Hour = 12)
	{
	MouseClickDrag, Left, 1400, 500, 300, 500, 75
	sleep % ran(1995, 2999)
	click 1325, 325
	sleep % ran(1995, 2999)
	click 400, 500
	sleep % ran(995, 2999)
	click 700, 850
	sleep % ran(995, 2999)
	click 800, 750
	sleep % ran(995, 2999)
	click 800, 600
	sleep % ran(995, 2999)
	click 800, 800
	sleep % ran(5995, 6999)
	click 800, 750
	sleep % ran(995, 2999)
	click 800, 600
	sleep % ran(995, 2999)
	click 800, 800
	sleep % ran(1995, 2999)
	returnToHome()
	}
; challenges
	openChallenges()
	Click, 1300, 200
	sleep % ran(1995, 2999)
	Click, 800, 600
	sleep % ran(2995, 3999)
	Click, 800, 800
	sleep % ran(1995, 2999)
	returnToHome()
; ship arena
	if(A_Hour = 6)
	{
	openShips()
	openShipArena()
	click 1300, 800
	sleep % ran(1995, 2999)
	click 1300, 900
	sleep % ran(21995, 22999)
	click 60, 85
	sleep % ran(1995, 2999)
	click 800, 800
	sleep % ran(1995, 2999)
	click 600, 600
	sleep % ran(1995, 2999)
	returnToHome()
	}
; claim quests
	if(A_Hour = 21){
		Click, 1300, 850
		sleep % ran(1995, 2999)
		Click, 100, 200
		sleep % ran(1995, 2999)
		Loop, 14 {
			Click, 1400, 850
			sleep % ran(995, 999)
		}
		returnToHome()
	}
}

bosskDailies(newCharacter,path){
    character:=newCharacter
    Send {Shift}
    sleep % ran(4995, 6999)
	IfWinNotExist, %character%
	Run, C:\Program Files (x86)\Nox\bin\Nox.exe %path%
        sleep % ran(1995, 2999)
	winactivate, %character%
	WinWaitActive, %character%
	if (imageCheck(*TransBlack "yoda.bmp")) {
        	sleep % ran(1995, 2999)
		Click, %FoundX%, %FoundY%
		sleep 20
	}
	if (imageCheck(*TransBlack "settings.bmp")=false) {
		returnToHome()
	}
;CANTINA
	openCantina()
	click 250, 525
	sleep % ran(1995, 3999)
	multiSim()
	returnToHome()
; SIM light
	if(A_Hour = 18 || A_Hour = 6){
		buyEnergy()
	}
	openLight()
	click 1000, 185
	sleep % ran(995, 2999)
	click 400, 880
	sleep % ran(995, 2999)
	multiSim()
	returnToHome()
}

OzTicketDailies(newCharacter,path){
    character:=newCharacter
    Send {Shift}
    sleep % ran(4995, 6999)
	IfWinNotExist, %character%
	Run, C:\Program Files (x86)\Nox\bin\Nox.exe %path%
        sleep % ran(1995, 2999)
	winactivate, %character%
	WinWaitActive, %character%
	if (imageCheck(*TransBlack "yoda.bmp")) {
        	sleep % ran(1995, 2999)
		Click, %FoundX%, %FoundY%
		sleep 20
	}
	if (imageCheck(*TransBlack "settings.bmp")=false) {
		returnToHome()
	}
;CANTINA
	openCantina()
	click 150, 175
	sleep % ran(1995, 3999)
	click 500, 175
	sleep % ran(1995, 3999)
	click 650, 510
	sleep % ran(1995, 3999)
	multiSim()
	sleep % ran(1995, 3999)
	returnToHome()
; SIM light jedi c
	if(A_Hour = 11){
		openLight()
		MouseClickDrag, Left, 200, 185, 1300,185, 75
		sleep % ran(1995, 2999)
		click 125, 185
		sleep % ran(2995, 3999)
		click 1200, 875
		sleep % ran(1995, 2999)
		click 25, 475
		sleep % ran(995, 2999)
		multiSim()
		returnToHome()
	}
	; SIM light 4-d
	if(A_Hour = 20){
		openLight()
		MouseClickDrag, Left, 200, 185, 1300,185, 75
		sleep % ran(1995, 2999)
		click 700, 185
		sleep % ran(2995, 3999)
		click 1200, 875
		sleep % ran(1995, 2999)
		click 300, 370
		sleep % ran(995, 2999)
		click 185, 485
		sleep % ran(995, 2999)
		multiSim()
		returnToHome()
	}
;dark side jc
	if(A_Hour = 17){
		openDark()
		MouseClickDrag, Left, 200, 185, 1300, 185, 75
		sleep % ran(1995, 2999)
		click 125, 185
		sleep % ran(2995, 3999)
		click 1200, 875
		sleep % ran(1995, 2999)
		multiSim()
		returnToHome()
	}
; mods
	openMods()
	click 300, 850
	sleep % ran(1995, 3999)
	click 1300, 750
	sleep % ran(1995, 3999)
	click 800, 600
	sleep % ran(2995, 3999)
	returnToHome()
; ship energy
	openShips()
	fleetBattles()
	click 350, 185
	sleep % ran(2995, 3999)
	click 300, 540
	sleep % ran(2995, 3999)
	multiSim()
	returnToHome()
;burn energy
	if(A_Hour = 05 || A_Hour = 20 || A_Hour = 11){
		openLight()
		clickNormal()
		click5()
		MouseClickDrag, Left, 950, 485, 50, 485, 75
		sleep % ran(1995, 2999)
		MouseClickDrag, Left, 950, 485, 50, 485, 75
		sleep % ran(1995, 2999)
		click 715, 545
		sleep % ran(2995, 3999)
		click 375, 515
		sleep % ran(2995, 3999)
		multiSim()
	}
	returnToHome()
}

timeChecker:
	if (A_Hour = 12 || A_Hour = 18 || A_Hour = 21 || A_Hour = 0 || A_Hour = 6 || A_Hour = 24)
	{
	mainRoutine("Bast","-clone:Nox_0")
	mainRoutine("MotherT","-clone:Nox_5")
;	mainRoutine("Bast2","-clone:Nox_6")
	mainRoutine("Ozmethod2","-clone:Nox_7")
	mainRoutine("Bossk","-clone:Nox_4")
	}
; FOR TESTING
	if (A_Hour = 11 || A_Hour = 17 || A_Hour = 20 || A_Hour = 23 || A_Hour = 5) {
	mainRoutine("OzmethodT3","-clone:Nox_1")
	mainRoutine("OzmethodT4","-clone:Nox_2")
	mainRoutine("OzmethodT5","-clone:Nox_3")
;		sleep % ran(1995, 2999)
;		dailies()
	}
closeNox := 1
return
