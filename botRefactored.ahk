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
    character:=newCharacter
;    PostMessage, 0x0112, 0x0F060, 0,, A
    sleepRan(5)
	IfWinNotExist, %character% 
	{
		Run, C:\Program Files (x86)\Nox\bin\Nox.exe %path%
        sleepRan(26)
	}
	winactivate, %character%
	WinWaitActive, %character%
	if (imageCheck(*TransBlack "yoda.bmp")) {
        sleepRan(2)
		Click, %FoundX%, %FoundY% 
		sleepRan(40)
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
	sleepRan(2)	
	if (character != "Ozmethod2" && character != "Bossk") {
		dailies()
		if(A_WDay = 1){
			SundayDaily()
		}
	}		
	if (A_Hour = 21) {
		sleepRan(2)	
		if(imageCheck("settings.png")=true)
		{
			dailyQuest()
		}
	}
	if(character = "Ozmethod2") {
		ticketDailies("Ozmethod2","-clone:Nox_1")
	}
	if(character = "Bossk") {
		bosskDailies("Bossk","-clone:Nox_2")
	}
	if(character = "OzmethodT3") {
		OzTicketDailies("OzmethodT3","-clone:Nox_4")
	}
	if(character = "OzmethodT4") {
		OzTicketDailies("OzmethodT4","-clone:Nox_5")
	}
	if(character = "OzmethodT5") {
		OzTicketDailies("OzmethodT5","-clone:Nox_7")
	}
	if (closeNox = 1){
		Send !{f4}
		sleepRan(2)	
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
		sleepRan(2)
                if(A_WDay = 4){
			click, 1400, 875
			sleepRan(2)
		}
                else {
			click, 200, 875
			sleepRan(2)
                }
		click, 1400, 775
		sleepRan(2)
		click, 250, 500
		sleepRan(2)
		click, 1400, 875
		sleepRan(15)
		click, 55, 85
		sleepRan(2)
		click, 800, 775
		sleepRan(2)
		click, 600, 600
		sleepRan(4)
	returnToHome()
}

dailies(){
	openChallenges()
	if(imageCheck("enter.bmp", 175, 775, 400, 875) || imageCheck("enter.png", 175, 775, 400, 875))
	{
	Click, %FoundX%, %FoundY% 
	sleepRan(2)
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
		sleepRan(2)
	}
	else if(imageCheck("actBattle.bmp", 200, 700, 400, 958) || imageCheck("actBattle.png", 200, 700, 400, 958))
	{
		Click, %FoundX%, %FoundY% 
		sleepRan(2)
	}
	else
	{
		returnToHome()
		return
	}
	Click, 250, 500
	sleepRan(2)
	Click, 1380, 870
	sleepRan(6)
	while (imageCheck("autoOff.bmp")=false)
	{
		sleepRan(2)
	}
	Click, 250, 80
	while (imageCheck("challengeVictory.bmp")=false) 
	{
		sleepRan(2)
	}
	sleepRan(3)
	returnToHome()
}

SundayDaily(){
; daily 2
	openChallenges()
	if(imageCheck("enter.bmp", 675, 775, 800, 875) || imageCheck("enter.png", 675, 775, 800, 875))
	{
		Click, %FoundX%, %FoundY% 
		sleepRan(2)
	}
	if (character = "OzmethodT3" || character = "OzmethodT5" || character = "OzmethodT4" ||){
		simDaily()
		returnToHome()
		return
	}
	if(imageCheck("actBattle.bmp", 685, 700, 900, 950) || imageCheck("actBattle.png", 685, 750, 900, 950))
	{
	Click, %FoundX%, %FoundY% 
	sleepRan(2)
	}
	else if(imageCheck("actBattle.bmp", 200, 700, 400, 958) || imageCheck("actBattle.png", 200, 700, 400, 958))
	{
	Click, %FoundX%, %FoundY% 
	sleepRan(2)
	}
	else
	{
	returnToHome()
	return
	}
	Click, 250, 500
	sleepRan(2)
	Click, 1380, 870
	sleepRan(6)
	while (imageCheck("autoOff.bmp")=false)
	{
		sleepRan(2)
	}
	Click, 250, 80
	while (imageCheck("challengeVictory.bmp")=false) 
	{
	sleepRan(2)
	}
	sleepRan(3)
	returnToHome()
; daily 3
	openChallenges()
	if(imageCheck("enter.bmp", 1125, 775, 1250, 875) || imageCheck("enter.png", 1125, 775, 1250, 875))
	{
	Click, %FoundX%, %FoundY% 
	sleepRan(2)
	}
	if (character = "OzmethodT3" || character = "OzmethodT5" || character = "OzmethodT4" ||){
		simDaily()
		returnToHome()
		return
	}
	if(imageCheck("actBattle.bmp", 685, 700, 900, 950) || imageCheck("actBattle.png", 685, 750, 900, 950))
	{
	Click, %FoundX%, %FoundY% 
	sleepRan(2)
	}
	else if(imageCheck("actBattle.bmp", 200, 700, 400, 958) || imageCheck("actBattle.png", 200, 700, 400, 958))
	{
	Click, %FoundX%, %FoundY% 
	sleepRan(2)
	}
	else
	{
	returnToHome()
	return
	}
	Click, 250, 500
	sleepRan(2)
	Click, 1380, 870
	sleepRan(6)
	while (imageCheck("autoOff.bmp")=false)
	{
		sleepRan(2)
	}
	Click, 250, 80
	while (imageCheck("challengeVictory.bmp")=false) 
	{
	sleepRan(2)
	}
	sleepRan(3)
	returnToHome()
	sleepRan(3)
	returnToHome()
}

claimLogin(){
	sleepRan(3)
	Click, 75, 600
	sleepRan(3)
	Click, 1300, 850
	sleepRan(3)
	Click, 1300, 850
	sleepRan(3)
	Click, 1300, 850
	sleepRan(3)
	Click, 600, 200
	sleepRan(3)
	Click, 1300, 800
	sleepRan(3)
}


freePack(){
	Click, 915, 250 
	sleepRan(2)
	if(imageCheck("free.png"))
	{
		Click, %FoundX%, %FoundY% 
		sleepRan(2)
		Click, 1350,850
		sleepRan(3)
		Send {Esc}
		sleepRan(2)
		Send {Esc}
		sleepRan(2)
		Send {Esc}
		sleepRan(2)
		Send {Esc}
		sleepRan(2)
		Send {Esc}
		sleepRan(2)
		Send {Esc}
		sleepRan(2)
	}
	returnToHome()
}

getFreeEnergy(){
;open quest screen
sleepRan(5)
Click, 1385, 870
sleepRan(2)
;check if daily quests are currently selected, if not click them.
;while (imageCheck("quests.bmp", 130, 50, 320, 145)=false)
;{
;}
;if (imageCheck("dailies.bmp")=false) {
	Click, 95, 240
sleepRan(2)
;}
while(imageCheck(*TransBlack "energy.bmp", 200, 260, 339, 305)=true || imageCheck(*TransBlack "energy.png", 200, 260, 339, 305)=true) {
sleepRan(3)
Click, 1385, 870
;msgBox "Would have clicked"
sleepRan(3)
}
Send {Esc}
}

shipments(){
sleepRan(3)
;first open shipments
Click, 670, 280
sleepRan(3)
;select first shipment
Click, 475, 400
sleepRan(3)
;is it available to buy?
if (imageCheck(*TransBlack "buy.bmp",560, 450, 780, 780) = true) {
Click, %FoundX%, %FoundY% 
sleepRan(3)
}
else {
Send {Esc}
sleepRan(3)
returnToHome()
return
}
; second
Click, 820, 400
sleepRan(3)
if (imageCheck("buy.png",560, 450, 780, 780) = true) {
Click, %FoundX%, %FoundY% 
sleepRan(3)
}
else {
Send {Esc}
sleepRan(3)
}
; third
Click, 1150, 400
sleepRan(3)
if (imageCheck("buy.png",560, 450, 780, 780) = true) {
Click, %FoundX%, %FoundY% 
sleepRan(3)
}
else {
Send {Esc}
sleepRan(3)
}
; fourth
Click, 475, 725
sleepRan(3)
if (imageCheck("buy.png",560, 450, 780, 780) = true) {
Click, %FoundX%, %FoundY% 
sleepRan(3)
}
else {
Send {Esc}
sleepRan(2)
}
; dengar
;if (character != "MotherT" && character != "Bast" && character != "Bast2"){
;	click, 965, 200
;	MouseClickDrag, Left, 1160, 700, 1160, 300, 75
;	if(imageCheck("dengar.png") = true || imageCheck("dengar.bmp") = true){
;		click 500, 700
;		sleepRan(3)
;		if (imageCheck("buy.png",560, 450, 780, 780) = true) {
;			Click, %FoundX%, %FoundY% 
;			sleepRan(3)
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
;		sleepRan(3)
;		if (imageCheck("buy.png",560, 450, 780, 780) = true) {
;			Click, %FoundX%, %FoundY% 
;			sleepRan(3)
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
		sleepRan(3)
		if (imageCheck("buy.png",560, 450, 780, 780) = true) {
			Click, %FoundX%, %FoundY% 
			sleepRan(3)
		}
	}
}
;Han
if (character = "Bast2"){
	click, 965, 200
	if(imageCheck("Han.png") = true || imageCheck("Han.bmp") = true){
		click 450, 700
		sleepRan(3)
		if (imageCheck("buy.png",560, 450, 780, 780) = true) {
			Click, %FoundX%, %FoundY% 
			sleepRan(3)
		}
	}
}
shipmentFlag := 0
returnToHome()
sleepRan(3)
}

returnToHome(){
	Send {Esc}
	sleepRan(3)
	while (imageCheck(*TransBlack "settings.bmp") = false) {
	if (imageCheck(*TransBlack "yoda.bmp")) {
	Click, %FoundX%, %FoundY% 
	sleepRan(2)
	return
	}
	Send {Esc}
	sleepRan(3)
	}
	sleepRan(3)
}


ticketDailies(newCharacter,path){
    character:=newCharacter
    Send {Shift}
    sleepRan(5)
	IfWinNotExist, %character%
	Run, C:\Program Files (x86)\Nox\bin\Nox.exe %path%
        sleepRan(2)
	winactivate, %character%
	WinWaitActive, %character%
	if (imageCheck(*TransBlack "yoda.bmp")) {
        	sleepRan(2)
		Click, %FoundX%, %FoundY% 
		sleep 20
	}
	if (imageCheck(*TransBlack "settings.bmp")=false) {
		returnToHome()
	}
; regular farm, i think
	openDark()
	click 400, 880
	sleepRan(3)
	click 1400, 175
	sleepRan(3)
	click 1300, 175
	sleepRan(3)
	click 400, 880
	sleepRan(3)
	; MOVING TO ITEM
	click 225, 450
	sleepRan(3)
	click 300, 500
	sleepRan(3)
	;SIMMING
	multiSim()
	returnToHome()
;cantina
	openCantina()
	click 100, 175
	sleepRan(3)
	MouseClickDrag, Left, 901, 500, 200, 500, 75
	sleepRan(2)
	click 575, 515
	sleepRan(3)
	multiSim()
	returnToHome()
; mods
	openMods()
	MouseClickDrag, Left, 1500, 500, 150, 500, 75
	sleepRan(2)
	MouseClickDrag, Left, 1500, 500, 150, 500, 75
	sleepRan(2)
	click 1300, 850
	sleepRan(3)
	click 1300, 750
	sleepRan(3)
	click 800, 600
	sleepRan(3)
	returnToHome()
; ships
	openShips()
	click 800, 700
	sleepRan(2)
	click 100, 175
	sleepRan(2)
	click 400, 875
	sleepRan(2)
	click 1200, 775
	sleepRan(2)
	click 800, 600
	sleepRan(3)
	returnToHome()
; extra energy
	if(A_Hour = 18)	{
		buyEnergy()
	; sim bossk		
			click 1000, 600
			sleepRan(3)
			click 1400, 180
			sleepRan(3)
			click 1200, 900
			sleepRan(3)
			click 200, 500
			sleepRan(3)
			multiSim()
			returnToHome()
		}
; galactic war
	if(A_Hour = 06)	{
		returnToHome()	
		click 1400, 300
		sleepRan(3)
		click 300, 900
		sleepRan(3)
		click 800, 900
		sleepRan(3)
		click 800, 600
		sleepRan(4)
		returnToHome()	
	}	
; arena
	if(A_Hour != 21){
		click 1200, 400
		sleepRan(3)
		click 1300, 825
		sleepRan(3)
		click 1300, 875
		sleepRan(30)
		click 50, 82
		sleepRan(3)
		click 800, 800
		sleepRan(3)
		click 600, 600
		sleepRan(3)
		returnToHome()
	}
; ship challenge
	if(A_Day != 2 && A_Hour = 12)
	{
	MouseClickDrag, Left, 1400, 500, 300, 500, 75
	sleepRan(2)
	click 1325, 325
	sleepRan(2)
	click 400, 500
	sleepRan(3)
	click 700, 850
	sleepRan(3)
	click 800, 750
	sleepRan(3)
	click 800, 600
	sleepRan(3)
	click 800, 800
	sleepRan(6)
	click 800, 750
	sleepRan(3)
	click 800, 600
	sleepRan(3)
	click 800, 800
	sleepRan(2)
	returnToHome()
	}
; challenges
	openChallenges()
	Click, 1300, 200
	sleepRan(2)
	Click, 800, 600
	sleepRan(3)
	Click, 800, 800
	sleepRan(2)
	returnToHome()
; ship arena
	if(A_Hour = 6)
	{
	openShips()
	openShipArena()
	click 1300, 800
	sleepRan(2)
	click 1300, 900
	sleepRan(20)
	click 60, 85
	sleepRan(2)
	click 800, 800
	sleepRan(2)
	click 600, 600
	sleepRan(2)
	returnToHome()
	}
; claim quests
	if(A_Hour = 21){
		Click, 1300, 850
		sleepRan(2)	
		Click, 100, 200
		sleepRan(2)	
		Loop, 14 {
			Click, 1400, 850
			sleepRan(1)
		}
		returnToHome()		
	}
}

bosskDailies(newCharacter,path){
    character:=newCharacter
    Send {Shift}
    sleepRan(5)
	IfWinNotExist, %character%
	Run, C:\Program Files (x86)\Nox\bin\Nox.exe %path%
        sleepRan(2)
	winactivate, %character%
	WinWaitActive, %character%
	if (imageCheck(*TransBlack "yoda.bmp")) {
        	sleepRan(2)
		Click, %FoundX%, %FoundY% 
		sleep 20
	}
	if (imageCheck(*TransBlack "settings.bmp")=false) {
		returnToHome()
	}
;CANTINA
	openCantina()
	click 250, 525
	sleepRan(3)
	multiSim()
	returnToHome()
; SIM light
	if(A_Hour = 18 || A_Hour = 6){
		buyEnergy()
	}
	openLight()
	click 1000, 185
	sleepRan(3)
	click 400, 880
	sleepRan(3)
	multiSim()
	returnToHome()
}

OzTicketDailies(newCharacter,path){
    character:=newCharacter
    Send {Shift}
    sleepRan(5)
	IfWinNotExist, %character%
	Run, C:\Program Files (x86)\Nox\bin\Nox.exe %path%
        sleepRan(2)
	winactivate, %character%
	WinWaitActive, %character%
	if (imageCheck(*TransBlack "yoda.bmp")) {
        	sleepRan(2)
		Click, %FoundX%, %FoundY% 
		sleep 20
	}
	if (imageCheck(*TransBlack "settings.bmp")=false) {
		returnToHome()
	}
;CANTINA
	openCantina()
	click 150, 175
	sleepRan(3)
	click 500, 175
	sleepRan(3)
	click 650, 510
	sleepRan(3)
	multiSim()
	sleepRan(3)
	returnToHome()
; SIM light jedi c
	if(A_Hour = 11){
		openLight()
		MouseClickDrag, Left, 200, 185, 1300,185, 75
		sleepRan(2)
		click 125, 185
		sleepRan(3)
		click 1200, 875
		sleepRan(2)
		click 25, 475
		sleepRan(3)
		multiSim()
		returnToHome()
	}
	; SIM light 4-d
	if(A_Hour = 20){
		openLight()
		MouseClickDrag, Left, 200, 185, 1300,185, 75
		sleepRan(2)
		click 700, 185
		sleepRan(3)
		click 1200, 875
		sleepRan(2)
		click 300, 370
		sleepRan(3)
		click 185, 485
		sleepRan(3)
		multiSim()
		returnToHome()
	}
;dark side jc
	if(A_Hour = 17){
		openDark()
		MouseClickDrag, Left, 200, 185, 1300, 185, 75
		sleepRan(2)
		click 125, 185
		sleepRan(3)
		click 1200, 875
		sleepRan(2)
		multiSim()
		returnToHome()
	}
; mods
	openMods()
	click 300, 850
	sleepRan(3)
	click 1300, 750
	sleepRan(3)
	click 800, 600
	sleepRan(3)
	returnToHome()
; ship energy
	openShips()
	fleetBattles()
	click 350, 185
	sleepRan(3)
	click 300, 540
	sleepRan(3)
	multiSim()
	returnToHome()
;burn energy
	if(A_Hour = 05 || A_Hour = 20 || A_Hour = 11){
		openLight()
		clickNormal()
		click5()
		MouseClickDrag, Left, 950, 485, 50, 485, 75
		sleepRan(2)
		MouseClickDrag, Left, 950, 485, 50, 485, 75
		sleepRan(2)
		click 715, 545
		sleepRan(3)
		click 375, 515
		sleepRan(3)
		multiSim()
	}
	returnToHome()
}

timeChecker:
	if (A_Hour = 12 || A_Hour = 18 || A_Hour = 21 || A_Hour = 0 || A_Hour = 6 || A_Hour = 24) 
	{
	mainRoutine("Bast","-clone:Nox_0")
	mainRoutine("MotherT","-clone:Nox_3")
	mainRoutine("Bast2","-clone:Nox_6")
	mainRoutine("Ozmethod2","-clone:Nox_1")
	mainRoutine("Bossk","-clone:Nox_2")
;	}
;	if(A_Hour = 18){
;		ticketDailies("Ozmethod2","-clone:Nox_1")
;		bosskDailies("Bossk","-clone:Nox_2")
	}
; FOR TESTING
	if (A_Hour = 11 || A_Hour = 17 || A_Hour = 20 || A_Hour = 23 || A_Hour = 5) {
	mainRoutine("OzmethodT3","-clone:Nox_4")
	mainRoutine("OzmethodT4","-clone:Nox_5")
	mainRoutine("OzmethodT5","-clone:Nox_7")
;		sleepRan(2)
;		dailies()	
	}
closeNox := 1
return

