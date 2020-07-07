;initialization
#Persistent
#singleinstance force
#include functionFile.txt

;initialize variables
global FoundX := 0 
global FoundY := 0
global runTime:= 0
;global timeCheckFlag := 2
;global dailyChallenges := 1
;global shipmentFlag := 1
;global haveEnergy:=1
global character := "none"

global runNow := 1

if (runNow = 0){
 timeTil00 := 3600000 - (A_Min * 60 * 1000) + 120000
; msgbox %timeTil00%  
 Sleep %timeTil00%
runNow := 1
}

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
		winactivate, %character%
		WinWaitActive, %character%
        	Send {Esc}
                sleepRan(1)
		if (imageCheck(*TransBlack "yoda.bmp")) {
        		sleepRan(2)
			Click, %FoundX%, %FoundY% 
			sleepRan(30)
			while (imageCheck("disney.PNG") || imageCheck("capital.PNG") || imageCheck("titleScreen.PNG"))
			{
				Send {Esc}
				sleepRan(2)
			}
		}
	}
	if (imageCheck(*TransBlack "settings.bmp")=false) {
		returnToHome()
		returnToHome()
	}
	getFreeEnergy()
	if (runTime = 18 || runTime = 6) {
		claimLogin() 
	}
if (character = "Bast" || character = "MotherT" || character = "Bast2") {
 	freePack()
	shipments()
	if (character != "OzmethodT2") {
		dailies()
		if(A_WDay = 1){
			SundayDaily()
		}
	}		
	if ((runTime = 21) && imageCheck("settings.png")){
		dailyQuest()
	}
}
	if(character = "OzmethodT2") {
		OzTicketDailies("OzmethodT2","-clone:Nox_2")
	}
	else if(character = "OzmethodT3") {
		OzTicketDailies("OzmethodT3","-clone:Nox_3")
	}
	else if(character = "OzmethodT4") {
		OzTicketDailies("OzmethodT4","-clone:Nox_4")
	}
	else if(character = "OzmethodT5") {
		OzTicketDailies("OzmethodT5","-clone:Nox_5")
	}
	else if(character = "Bossk") {
		OzTicketDailies("Bossk","-clone:Nox_7")
	}
	if (closeNox = 1){
		Send !{f4}
		sleepRan(2)	
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
		sleepRan(3)
	}
	if (character = "OzmethodT3" || character = "OzmethodT5" || character = "OzmethodT4"){
		simDaily()
		returnToHome()
		SundayDaily()
		return
	}
	if(imageCheck("actBattle.bmp", 685, 700, 900, 950) || imageCheck("actBattle.png", 685, 750, 900, 950))
	{
		Click, %FoundX%, %FoundY% 
		sleepRan(3)
	}
	else if(imageCheck("actBattle.bmp", 200, 700, 400, 958) || imageCheck("actBattle.png", 200, 700, 400, 958))
	{
		Click, %FoundX%, %FoundY% 
		sleepRan(3)
	}
	else
	{
		returnToHome()
		return
	}
	Click, 250, 500
	sleepRan(3)
	Click, 1380, 870
	sleepRan(7)
	while (imageCheck("autoOff.bmp")=false)
	{
		sleepRan(3)
	}
	Click, 250, 80
	while (imageCheck("challengeVictory.bmp")=false) 
	{
		sleepRan(3)
	}
	sleepRan(3)
	returnToHome()
}

SundayDaily(){
; daily 2
	openChallenges()
	if(imageCheck("enter.bmp", 675, 775, 800, 875) || imageCheck("enter.png", 675, 775, 800, 875)){
		Click, %FoundX%, %FoundY% 
		sleepRan(2)
	}
	if (character = "OzmethodT3" || character = "OzmethodT5" || character = "OzmethodT4"){
		simDaily()
		returnToHome()
		return
	}
	if(imageCheck("actBattle.bmp", 685, 700, 900, 950) || imageCheck("actBattle.png", 685, 750, 900, 950)){
		Click, %FoundX%, %FoundY% 
		sleepRan(2)
	}
	else if(imageCheck("actBattle.bmp", 200, 700, 400, 958) || imageCheck("actBattle.png", 200, 700, 400, 958))	{
		Click, %FoundX%, %FoundY% 
		sleepRan(2)
	}
	else {
		Send {Esc}
		sleepRan(2)
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
	Send {Esc}
	sleepRan(2)
	returnToHome()
; daily 3
	openChallenges()
	if(imageCheck("enter.bmp", 1125, 775, 1250, 875) || imageCheck("enter.png", 1125, 775, 1250, 875)){
		Click, %FoundX%, %FoundY% 
		sleepRan(2)
	}
	if (character = "OzmethodT3" || character = "OzmethodT5" || character = "OzmethodT4"){
		simDaily()
		Send {Esc}
		sleepRan(2)
		returnToHome()
		return
	}
	if(imageCheck("actBattle.bmp", 685, 700, 900, 950) || imageCheck("actBattle.png", 685, 750, 900, 950)){
		Click, %FoundX%, %FoundY% 
		sleepRan(2)
	}
	else if(imageCheck("actBattle.bmp", 200, 700, 400, 958) || imageCheck("actBattle.png", 200, 700, 400, 958))	{
		Click, %FoundX%, %FoundY% 
		sleepRan(2)
	}
	else {
		Send {Esc}
		sleepRan(2)
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
	while (imageCheck("challengeVictory.bmp")=false) {
		sleepRan(2)
	}
	sleepRan(3)
	Send {Esc}
	sleepRan(2)
	Send {Esc}
	sleepRan(2)
	returnToHome()
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
	}
	Send {Esc}
	sleepRan(2)
	Send {Esc}
	sleepRan(2)
	returnToHome()
}

getFreeEnergy(){
;open quest screen
	sleepRan(2)
Click, 1385, 870
	sleepRan(2)
;check if daily quests are currently selected, if not click them.
	Click, 300, 200
	sleepRan(2)
	while(imageCheck(*TransBlack "energy.bmp", 100, 400, 150, 450)=true || imageCheck(*TransBlack "energy.png", 200, 260, 339, 305)=true) {
		sleepRan(1)
		Click, 1385, 870
;msgBox "Would have clicked"
		sleepRan(1)
	}
	Send {Esc}
	sleepRan(2)
	Send {Esc}
	sleepRan(2)
	returnToHome()
}

shipments(){
	sleepRan(1)
;first open shipments
	Click, 670, 280
	sleepRan(3)
;select first shipment
	Click, 475, 400
	sleepRan(5)
;is it available to buy?
	if (imageCheck(*TransBlack "buy.bmp",560, 450, 780, 780) = true) {
		Click, %FoundX%, %FoundY% 
		sleepRan(4)
	}
	else {
		Send {Esc}
		sleepRan(2)
		Send {Esc}
		sleepRan(2)
		Send {Esc}
		sleepRan(3)
		returnToHome()
		return
	}
; second
	Click, 820, 400
	sleepRan(4)
	if (imageCheck("buy.png",560, 450, 780, 780) = true) {
		Click, %FoundX%, %FoundY% 
		sleepRan(3)
	}
	else {
		Send {Esc}
		sleepRan(4)
	}
; third
	Click, 1150, 400
	sleepRan(4)
	if (imageCheck("buy.png",560, 450, 780, 780) = true) {
		Click, %FoundX%, %FoundY% 
		sleepRan(4)
	}
	else {
		Send {Esc}
		sleepRan(4)
	}
; fourth
	Click, 475, 725
	sleepRan(4)
	if (imageCheck("buy.png",560, 450, 780, 780) = true) {
		Click, %FoundX%, %FoundY% 
		sleepRan(4)
	}
	else {
		Send {Esc}
		sleepRan(4)
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
;if (character = "Zaaaast"){
;	click, 965, 200
;	MouseClickDrag, Left, 1160, 700, 1160, 300, 75
;	MouseClickDrag, Left, 1160, 700, 1160, 300, 75
;	if(imageCheck("oldBen.png") = true || imageCheck("oldBen.bmp") = true){
;		click 450, 700
;		sleepRan(3)
;		if (imageCheck("buy.png",560, 450, 780, 780) = true) {
;			Click, %FoundX%, %FoundY% 
;			sleepRan(3)
;		}
;	}
;}
;bariss
if (character = "BAAAast" || character = "Bast2" || character = "MooooootherT"){
	click, 965, 200
	MouseClickDrag, Left, 1160, 700, 1160, 300, 75
	MouseClickDrag, Left, 1160, 700, 1160, 300, 75
	if(imageCheck("barriss.png") = true || imageCheck("barriss.bmp") = true){
		click 850, 700
		sleepRan(3)
		if (imageCheck("buy.png",560, 450, 780, 780) = true) {
			Click, %FoundX%, %FoundY% 
			sleepRan(3)
		}
	}
}
;Han
;if (character = "NOONE"){
;	click, 965, 800
;	if(imageCheck("Han.png") = true || imageCheck("Han.bmp") = true){
;		click 450, 700
;		sleepRan(3)
;		if (imageCheck("buy.png",560, 450, 780, 780) = true) {
;			Click, %FoundX%, %FoundY% 
;			sleepRan(3)
;		}
;	}
;}
	Send {Esc}
	sleepRan(2)
	Send {Esc}
	sleepRan(2)
returnToHome()
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
		Send {Esc}
		sleepRan(2)
		returnToHome()
	}
	if (imageCheck(*TransBlack "Guild.bmp", 5, 750, 175, 920) || imageCheck(*TransBlack "Guild.PNG", 5, 750, 175, 920)){
		guild:=0
	}
	else {
	    guild = 1
	}
	if (guild = 1) {
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
	click 1075, 175
	sleepRan(3)
	MouseClickDrag, Left, 101, 500, 900, 500, 75
	sleepRan(2)
	MouseClickDrag, Left, 101, 500, 900, 500, 75
	sleepRan(2)
	click 560, 450
	sleepRan(3)
	click 745, 515
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
	Send {Esc}
	sleepRan(2)
	Send {Esc}
	sleepRan(2)
	returnToHome()
; ships
	openShips()
	click 800, 700
	sleepRan(2)
	click 100, 175
	sleepRan(2)
	click 400, 875
	sleepRan(2)
	multiSim()
	returnToHome()
; extra energy
	if(runTime = 18)	{
		buyEnergy()
	; sim bossk		
			openDark()
			click 1400, 180
			sleepRan(3)
			click 1200, 900
			sleepRan(3)
			click 200, 500
			sleepRan(3)
			multiSim()
			returnToHome()
		}
	}
; galactic war
	if(runTime = 06)	{
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
	if(runTime != 21){
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
	if(runTime = 12 || runTime = 18)
	{
	openShips()
	click 400, 500
	sleepRan(3)
	click 1200, 200
	sleepRan(3)
	click 800, 600
	sleepRan(3)
	Send {Esc}
	sleepRan(2)
	Send {Esc}
	sleepRan(2)
	Send {Esc}
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
	if(runTime = 6)
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
	if(runTime = 21){
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
	{
		Run, C:\Program Files (x86)\Nox\bin\Nox.exe %path%
        	sleepRan(26)
	}
	winactivate, %character%
	WinWaitActive, %character%
	if (imageCheck(*TransBlack "yoda.bmp")) {
        sleepRan(2)
		Click, %FoundX%, %FoundY% 
		sleepRan(30)
		while (imageCheck("disney.PNG") || imageCheck("capital.PNG") || imageCheck("titleScreen.PNG"))
		{
			Send {Esc}
			sleepRan(2)
		}
	}
	if (imageCheck(*TransBlack "settings.bmp")=false) {
		returnToHome()
	}
	getFreeEnergy()
	if (imageCheck(*TransBlack "settings.bmp")=false) {
		returnToHome()
	}
	if (runTime = 18 || runTime = 6) {
		claimLogin() 
	}
	returnToHome()	
	if (imageCheck(*TransBlack "Guild.bmp", 5, 750, 175, 920) || imageCheck(*TransBlack "Guild.PNG", 5, 750, 175, 920)){
		guild:=0
	}
	else {
	    guild = 1
	}
	if (guild = 1) {
;CANTINA
	openCantina()
	click 125, 175
	sleepRan(3)
	multiSim()
	returnToHome()
; SIM light
	if(runTime = 18){
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
	if (closeNox = 1){
		Send !{f4}
		sleepRan(2)	
		Send {Enter}
	}
}

OzTicketDailies(newCharacter,path){
    character:=newCharacter
	if (imageCheck(*TransBlack "settings.bmp")=false) {
		returnToHome()
	}
	if (imageCheck(*TransBlack "Guild.bmp", 5, 750, 175, 920) || imageCheck(*TransBlack "Guild.PNG", 5, 750, 175, 920)){
		guild := 0
	}
	else {
	    guild := 1
	}
	if (guild = 1) {
;CANTINA
	openCantina()
        sleepRan(2)
	click 125, 175
	sleepRan(3)
	multiSim()
	returnToHome()
;burn energy
;    Value  := Mod(a_dd, 2)
;	if(Value = 1 && runTime = 11){
	if(runTime = 12){
		buyEnergy()
	}
	openLight()
	clickNormal()
	click 125, 175
	sleepRan(2)
	multiSim()
	returnToHome()
}
}

timeChecker:
if (runNow = 1) {
	if (A_Hour = 12 || A_Hour = 18 || A_Hour = 22 || A_Hour = 1 || A_Hour = 8 || A_Hour = 24 || A_Hour = 15) 
	{
	runTime := A_Hour
	if (runTime = 8)
  	  {	
		runTime = 6
	}
	if (runTime = 22)
  	  {	
		runTime = 21
	}
	if (runTime = 1)
  	  {	
		runTime = 0
	}
	mainRoutine("OzmethodT3","-clone:Nox_3")
	mainRoutine("OzmethodT4","-clone:Nox_4")
	mainRoutine("OzmethodT5","-clone:Nox_5")
	mainRoutine("OzmethodT2","-clone:Nox_2")
	mainRoutine("Bossk","-clone:Nox_7")
;	mainRoutine("Bast","-clone:Nox_0")
	mainRoutine("MotherT","-clone:Nox_1")
;	mainRoutine("Bast2","-clone:Nox_6")
;		sleepRan(2)
;		dailies()	
	}
}
runNow := 1
closeNox := 1
return

