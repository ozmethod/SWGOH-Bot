;initialization
#Persistent
#singleinstance force

;load nox
;Run, C:\Program Files (x86)\Nox\bin\Nox.exe

;initialize variables
global FoundX := 0 
global FoundY := 0
global timeCheckFlag := 2
global dailyChallenges := 1
global shipmentFlag := 1
global haveEnergy:=1
global character := "none"
SetTimer, timeChecker, 3600000, On
;mainRoutine()

mainRoutine(newCharacter,path){
    sleep 1000
    character:=newCharacter
;    PostMessage, 0x0112, 0x0F060, 0,, A
    sleep % ran(4995, 6999)
	IfWinNotExist, %character% 
	{
		Run, C:\Program Files (x86)\Nox\bin\Nox.exe %path%
        	sleep % ran(19995, 20999)
	}
	winactivate, %character%
	WinWaitActive, %character%
	if (imageCheck(*TransBlack "yoda.bmp")) {
        	sleep % ran(1995, 2999)
		Click, %FoundX%, %FoundY% 
		sleep 40000
	}
	if (imageCheck(*TransBlack "settings.bmp")=false) {
		returnToHome()
	}
    freePack()
	;if(%shipmentFlag% > 0 && imageCheck(*TransBlack "settings.png")=true)
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
;	if (A_Hour = 12 || A_Hour = 18 || A_Hour = 21) 
;	{
	getFreeEnergy()
;	}
	if (imageCheck(*TransBlack "settings.bmp")=false) {
		returnToHome()
	}
;	if (character = "MotherT"){
; 		haveEnergy:=1
;  		while (haveEnergy = 1) {
;			cantinaAttack()
;		}
;	}
	returnToHome()
	if (A_Hour = 18 || A_Hour = 6 || A_Hour = 17 || A_Hour = 5) {
		claimLogin() 
		returnToHome()
	}
	sleep % ran(1995, 2999)	
	if(imageCheck("settings.png")=true)
	{
	dailies()
	SundayDaily()
	}
	returnToHome()
	if (A_Hour = 21) {
		sleep % ran(1995, 2999)	
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
;	if(character = "Bast" || character = "MotherT" || character = "Bast2"){
	Send !{f4}
	sleep % ran(1995, 2999)	
	Send {Enter}
;	}
}

	


dailyQuest(){
;	if(A_WDay = 4 || A_WDay = 5 || A_WDay = 6 || A_WDay = 7 || A_WDay = 1 || A_WDay = 2) {
		if(A_WDay = 1){
			click, 400, 400
		}
                else if(A_WDay = 6){
			click, 1000, 600
		}
		else { 
			click, 575, 530
		}
		sleep % ran(1995, 2999)
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
;	}
	returnToHome()
}

dailies(){
MouseClickDrag, Left, 250, 500, 950, 500, 75
sleep % ran(1995, 2999)
Click, 500, 540
sleep % ran(2995, 3999)
if(imageCheck("enter.bmp", 175, 775, 400, 875) || imageCheck("enter.png", 175, 775, 400, 875))
{
Click, %FoundX%, %FoundY% 
sleep % ran(1995, 2999)
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

SundayDaily(){
; daily 2
if(A_WDay = 1){
	sleep % ran(1995, 2999)
	MouseClickDrag, Left, 250, 500, 950, 500, 75
	sleep % ran(1995, 2999)
	Click, 500, 540
	sleep % ran(1995, 2999)
	if(imageCheck("enter.bmp", 675, 775, 800, 875) || imageCheck("enter.png", 675, 775, 800, 875))
	{
	Click, %FoundX%, %FoundY% 
	sleep % ran(1995, 2999)
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
	; daily 3
	MouseClickDrag, Left, 250, 500, 950, 500, 75
	sleep % ran(1995, 2999)
	Click, 500, 540
	sleep % ran(1995, 2999)
	if(imageCheck("enter.bmp", 1125, 775, 1250, 875) || imageCheck("enter.png", 1125, 775, 1250, 875))
	{
	Click, %FoundX%, %FoundY% 
	sleep % ran(1995, 2999)
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

cantinaAttack(){
	sleep % ran(1995, 2999)
;open cantina
	Click, 400, 375
	sleep % ran(1995, 2999)
	farmTalia()
;	if(imageCheck(*TransBlack "14.png") =true || imageCheck(*TransBlack "15.png") =true || imageCheck(*TransBlack "14.bmp") =true || imageCheck(*TransBlack "15.bmp") =true) 
;	{
;		
;		;open cantina
;		Click, 400, 375
;		sleep % ran(1995, 2999)
;		farmHera()
;		return
;	}
;	else if(imageCheck(*TransBlack "16.png") =true || imageCheck(*TransBlack "16.bmp") =true || imageCheck(*TransBlack "17.png") =true || imageCheck(*TransBlack "17.bmp") =true || imageCheck(*TransBlack "18.png") =true || imageCheck(*TransBlack "18.bmp") =true || imageCheck(*TransBlack "19.png") =true || imageCheck(*TransBlack "19.bmp") =true || imageCheck(*TransBlack "20.png") =true || imageCheck(*TransBlack "20.bmp") || imageCheck(*TransBlack "21.png") =true || imageCheck(*TransBlack "21.bmp") =true || imageCheck(*TransBlack "22.png") =true || imageCheck(*TransBlack "22.bmp") =true || imageCheck(*TransBlack "23.png") =true || imageCheck(*TransBlack "23.bmp") =true || imageCheck(*TransBlack "24.png") =true || imageCheck(*TransBlack "24.bmp") =true){
;	else if(imageCheck(*TransBlack "22.png") =true || imageCheck(*TransBlack "22.bmp") =true || imageCheck(*TransBlack "23.png") =true || imageCheck(*TransBlack "23.bmp") =true){
;		;open cantina
;		Click, 400, 375
;		sleep % ran(1995, 2999)
;		farmEzra()
;		return
;	}
;	else {
;	msgbox "not 14 or 15"
;	haveEnergy:=0
;	}
}

farmTalia(){
		click, 120, 175
		sleep % ran(1995, 2999)
		if(imageCheck("talia.bmp")  =true || imageCheck("talia.png", 1000, 600, 1150, 700) =true) {
			Click, 1410, 780
			sleep % ran(1995, 2999)
			while (imageCheck("ooe.bmp", 400, 250, 550, 350) =false && imageCheck("battle.bmp") =false && imageCheck("borrow.bmp") = false)
			{
				sleep % ran(995, 2999)
			}
			if(imageCheck("ooe.bmp", 400, 250, 550, 350))
			{
			    haveEnergy:=0
				returnToHome()
				return
			}
			if (imageCheck("borrow.bmp") =true) {
			click, 240, 540
			sleep % ran(1995, 2999)
			}
			if imageCheck("battle.bmp") =false Click, 250, 500
			sleep % ran(4995, 6999)
			Click, 1380, 870
			sleep % ran(4995, 6999)
			while (imageCheck("autoOff.bmp")=false)
			{
				sleep % ran(1995, 2999)
			}	
			Click, 250, 80
			while (imageCheck("victory.bmp")=false)
			{
				sleep % ran(1995, 2999)0
			}
			sleep % ran(995, 2999)
			returnToHome()
			sleep % ran(995, 2999)
		}
}

farmHera(){
		if(imageCheck("hera.bmp")=false) {
			;check which target?
			click, 119, 181
			sleep % ran(1995, 2999)
			MouseClickDrag, Left, 966, 500, 61, 500, 75
			sleep % ran(1995, 2999)
			MouseClickDrag, Left, 966, 500, 61, 500, 75
			sleep % ran(1995, 2999)
			click, 575, 500
			sleep % ran(995, 2999)
		}
		if(imageCheck("talia.bmp")) {
			Click, 650, 515
			sleep % ran(1995, 2999)
		}
		if(imageCheck("hera.bmp"))
		{
			Click, 1410, 780
			sleep % ran(1995, 2999)
			while (imageCheck("ooe.bmp", 545, 585, 570, 625) =false && imageCheck("battle.bmp") =false && imageCheck("borrow.bmp") = false)
			{
				sleep % ran(995, 2999)
			}
			if(imageCheck("ooe.bmp", 545, 585, 570, 625))
			{
			    haveEnergy:=0
				returnToHome()
				return
			}
			if (imageCheck("borrow.bmp") =true) {
			click, 240, 540
			sleep % ran(1995, 2999)
			}
			if imageCheck("battle.bmp") =false Click, 250, 500
			sleep % ran(4995, 6999)
			Click, 1380, 870
			sleep % ran(4995, 6999)
			while (imageCheck("autoOff.bmp")=false)
			{
				sleep % ran(1995, 2999)
			}	
			Click, 250, 80
			while (imageCheck("victory.bmp")=false)
			{
				sleep % ran(1995, 2999)0
			}
			sleep % ran(995, 2999)
			returnToHome()
			sleep % ran(995, 2999)
		}
}

farmEzra(){
;msgbox gothere
                sleep % ran(1995, 2999)
		if(imageCheck("super.bmp")) {
		click, 290, 500
		sleep % ran(1995, 2999)
		}

		if(imageCheck("ezra.bmp")=false) {
		;check which target?
		click, 320, 181
		sleep % ran(1995, 2999)
		MouseClickDrag, Left, 61, 500, 966, 500, 75
		sleep % ran(1995, 2999)
		MouseClickDrag, Left, 61, 500, 966, 500, 75
		sleep % ran(1995, 2999)
		click, 800, 500
		sleep % ran(995, 2999)
                }
;		if(imageCheck("talia.bmp")) {
;			Click, 650, 515
;			sleep % ran(1995, 2999)
;		}
;		if(imageCheck("hera.bmp"))
;		{
			Click, 1410, 780
			sleep % ran(1995, 2999)
			while (imageCheck("ooe.bmp", 545, 585, 570, 625) =false && imageCheck("battle.bmp") =false && imageCheck("borrow.bmp") = false)
			{
				sleep % ran(995, 2999)
			}
			if(imageCheck("ooe.bmp", 545, 585, 570, 625))
			{
			    haveEnergy:=0
				returnToHome()
				return
			}
			if (imageCheck("borrow.bmp") =true) {
			click, 240, 540
			sleep % ran(1995, 2999)
			}
;			if imageCheck("battle.bmp") =false Click, 250, 500
			sleep % ran(4995, 6999)
			Click, 1380, 870
			sleep % ran(4995, 6999)
			while (imageCheck("autoOff.bmp")=false)
			{
				sleep % ran(1995, 2999)
			}	
			Click, 260, 80
			while (imageCheck("victory.bmp")=false)
			{
				if(imageCheck("level.bmp") or imageCheck("level.png"))
				{
					click, 800,700
				}
				sleep % ran(1995, 2999)0
			}
			click, 700, 800
			sleep % ran(995, 2999)
			if(imageCheck("no.bmp") =true || imageCheck("no.png") =true) {
				click, 800, 825
				sleep % ran(995, 2999)
			}
		;	if(haveEnergy=1)
		;	{
		;	    farmEzra()
		;	}
			returnToHome()
			sleep % ran(995, 2999)
;		}
}

dalies(){
MouseClickDrag, Left, 250, 500, 950, 500, 75
sleep % ran(1995, 2999)
Click, 500, 540
sleep % ran(1995, 2999)
if(imageCheck("challenge.bmp", 685, 810, 775, 850))
{
Click, %FoundX%, %FoundY% 
sleep % ran(1995, 2999)
}
if(imageCheck("challenge.bmp", 215, 810, 315, 850))
{
Click, %FoundX%, %FoundY% 
sleep % ran(1995, 2999)
}
if(imageCheck("challenge2.bmp", 685, 810, 775, 850))
{
Click, %FoundX%, %FoundY% 
sleep % ran(1995, 2999)
}
if(imageCheck("challenge2.bmp", 200, 820, 355, 858))
{
Click, %FoundX%, %FoundY% 
sleep % ran(1995, 2999)
}
else
{
Click, 75, 240
sleep % ran(995, 2999)
Click, 75, 240
sleep % ran(995, 2999)
dailyChallenges --
return
}
Click, 250, 500
sleep % ran(1995, 2999)
Click, 1380, 870
sleep % ran(995, 2999)
	while (imageCheck("autoOff.bmp")=false)
	{
	sleep % ran(995, 2999)
	}
	Click, 260, 80
	while (imageCheck("win.bmp",560, 450, 780, 780)=false)
	{
	sleep % ran(995, 2999)
	}
	sleep % ran(995, 2999)
	returnToHome()
	dailyChallenges --
}

freePack(){
;if(imageCheck(*TransBlack "freePack.bmp",830,250,935,365))
;{
Click, 915, 250 
sleep % ran(1995, 2999)
if(imageCheck("free.png"))
{
Click, %FoundX%, %FoundY% 
sleep % ran(1995, 2999)
Click, 1350,850
sleep % ran(995, 2999)0
Send {Esc}
sleep % ran(1995, 2999)
Send {Esc}
sleep % ran(1995, 2999)
Send {Esc}
sleep % ran(1995, 2999)
}
returnToHome()
;}
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

returnToHome(){
	Send {Esc}
	sleep % ran(995, 2999)
	while (imageCheck(*TransBlack "settings.bmp") = false) {
	if (imageCheck(*TransBlack "yoda.bmp")) {
	Click, %FoundX%, %FoundY% 
	sleep % ran(495, 999)
	return
	}
	Send {Esc}
	sleep % ran(995, 2999)
	}
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
	click 1000, 600
	sleep % ran(995, 2999)
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
	click 1200, 800
	sleep % ran(995, 2999)
	click 800, 600
	sleep % ran(1995, 3999)
	click 800, 800
	sleep % ran(1995, 3999)
	returnToHome()
	;cantina
	click 400, 400
	sleep % ran(1995, 3999)
	click 100, 175
	sleep % ran(1995, 3999)
;	MouseClickDrag, Left, 901, 500, 966, 500, 75
;	sleep % ran(1995, 2999)
	MouseClickDrag, Left, 901, 500, 200, 500, 75
	sleep % ran(1995, 2999)
	click 575, 515
	sleep % ran(1995, 3999)
	click 1200, 800
	sleep % ran(995, 2999)
	click 800, 600
	sleep % ran(1995, 3999)
	click 800, 800
	sleep % ran(1995, 3999)
	returnToHome()
; mods
	MouseClickDrag, Left, 250, 500, 950, 500, 75
	sleep % ran(1995, 2999)
	click 276, 324
	sleep % ran(1995, 3999)
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
	MouseClickDrag, Left, 1400, 500, 300, 500, 75
	sleep % ran(1995, 2999)
	click 1325, 325
	sleep % ran(1995, 2999)
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
		click 1200, 85
		sleep % ran(1995, 3999)
		click 1000, 600
		sleep % ran(995, 2999)
	; sim bossk		
			click 1000, 600
			sleep % ran(995, 2999)
			click 1400, 180
			sleep % ran(995, 2999)
			click 1200, 900
			sleep % ran(995, 2999)
			click 200, 500
			sleep % ran(995, 2999)
			click 1200, 800
			sleep % ran(995, 2999)
			click 800, 600
			sleep % ran(1995, 3999)
			click 800, 800
			sleep % ran(1995, 3999)
			returnToHome()
		}
;	; sim HT
;		else {
;			click 500, 600
;			sleep % ran(995, 2999)
;			click 1300, 180
;			sleep % ran(995, 2999)
;			click 1200, 900
;			sleep % ran(995, 2999)
;			click 1200, 800
;			sleep % ran(995, 2999)
;			click 800, 600
;			sleep % ran(1995, 3999)
;			click 800, 800
;			sleep % ran(1995, 3999)
;			returnToHome()
;		}
;	; sim dark
;		click 1000, 600
;		sleep % ran(995, 2999)
;		click 1300, 175
;		sleep % ran(995, 2999)
;		click 400, 880
;		sleep % ran(995, 2999)
;		click 1200, 800
;		sleep % ran(995, 2999)
;		click 800, 600
;		sleep % ran(1995, 3999)
;		click 800, 800
;;		sleep % ran(1995, 3999)
;;;;		returnToHome()
;	}
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
	MouseClickDrag, Left, 250, 500, 950, 500, 75
	sleep % ran(1995, 2999)
	Click, 500, 540
	sleep % ran(1995, 2999)
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
	click 1200, 500
	sleep % ran(1995, 2999)
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
;	Send !{f4}
;	sleep % ran(1995, 2999)	
;	Send {Enter}
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
	click 400, 400
	sleep % ran(1995, 3999)
	click 250, 525
	sleep % ran(1995, 3999)
	click 1200, 800
	sleep % ran(995, 2999)
	click 800, 600
	sleep % ran(1995, 3999)
	click 800, 800
	sleep % ran(1995, 3999)
	returnToHome()
	; SIM light
	if(A_Hour = 18 || A_Hour = 6){
		;buy energy
		click 1200, 85
		sleep % ran(995, 2999)	
		click 1000, 600
		sleep % ran(995, 2999)	
	}
	click 500, 600
	sleep % ran(995, 2999)
	click 1000, 185
	sleep % ran(995, 2999)
	click 400, 880
	sleep % ran(995, 2999)
	click 1200, 800
	sleep % ran(995, 2999)
	click 800, 600
	sleep % ran(1995, 3999)
	click 800, 800
	sleep % ran(1995, 3999)
	returnToHome()
;	Send !{f4}
;	sleep % ran(1995, 2999)	
;	Send {Enter}
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
	click 400, 400
	sleep % ran(1995, 3999)
	click 150, 175
	sleep % ran(1995, 3999)
	click 500, 175
	sleep % ran(1995, 3999)
	click 650, 510
	sleep % ran(1995, 3999)
	click 1200, 800
	sleep % ran(995, 2999)
	click 800, 600
	sleep % ran(1995, 3999)
	click 800, 800
	sleep % ran(1995, 3999)
	returnToHome()
	; SIM light jedi c
	if(A_Hour = 11){
		;buy energy
		;click 1200, 85
		;sleep % ran(995, 2999)	
		;click 1000, 600
		;sleep % ran(995, 2999)	
		click 500, 600
		sleep % ran(995, 2999)
		MouseClickDrag, Left, 200, 185, 1300,185, 75
		sleep % ran(1995, 2999)
		click 125, 185
		sleep % ran(2995, 3999)
		click 1200, 875
		sleep % ran(1995, 2999)
		click 25, 475
		sleep % ran(995, 2999)
		click 1200, 800
		sleep % ran(995, 2999)
		click 800, 600
		sleep % ran(1995, 3999)
		click 800, 800
		sleep % ran(1995, 3999)
		returnToHome()
	}
	; SIM light 4-d
	if(A_Hour = 20){
		click 500, 600
		sleep % ran(995, 2999)
		MouseClickDrag, Left, 200, 185, 1300,185, 75
		sleep % ran(1995, 2999)
		click 700, 185
		sleep % ran(2995, 3999)
		click 1200, 875
		sleep % ran(1995, 2999)
		click 175, 475
		sleep % ran(995, 2999)
		click 1200, 800
		sleep % ran(995, 2999)
		click 800, 600
		sleep % ran(1995, 3999)
		click 800, 800
		sleep % ran(1995, 3999)
		returnToHome()
	}
;dark side jc
	if(A_Hour = 17){
		click 1000, 600
		sleep % ran(995, 2999)
		MouseClickDrag, Left, 200, 185, 1300, 185, 75
		sleep % ran(1995, 2999)
		click 125, 185
		sleep % ran(2995, 3999)
		click 1200, 875
		sleep % ran(1995, 2999)
		;click 25, 475
		;sleep % ran(995, 2999)
		click 1200, 800
		sleep % ran(995, 2999)
		click 800, 600
		sleep % ran(1995, 3999)
		click 800, 800
		sleep % ran(1995, 3999)
		returnToHome()
	}
; mods
	MouseClickDrag, Left, 250, 500, 950, 500, 75
	sleep % ran(1995, 2999)
	click 276, 324
	sleep % ran(1995, 3999)
	click 300, 850
	sleep % ran(1995, 3999)
	click 800, 750
	sleep % ran(1995, 3999)
	click 800, 600
	sleep % ran(2995, 3999)
	returnToHome()
; ship energy
	openShips()
	fleetBattles()
	click 1200, 775
	sleep % ran(1995, 2999)
	click 800, 600
	sleep % ran(2995, 3999)
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
;		sleep % ran(1995, 2999)
;		dailies()	
	}
return

ran(min,max) {
	random, ran, min, max
	return ran
}


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
		msgBox Error
    }
else if ErrorLevel = 1
{
;    msgbox %fileName%notfound
    return false
    }
else
    return true
}

buySims(){

; buy sim tickets
	click 675, 275
	sleep % ran(995, 1999)
	MouseClickDrag, Left, 700, 700, 700, 100, 75
	sleep % ran(995, 1999)
	MouseClickDrag, Left, 700, 700, 700, 100, 75
	sleep % ran(995, 1999)
	MouseClickDrag, Left, 700, 700, 700, 100, 75
	sleep % ran(995, 1999)
	MouseClickDrag, Left, 700, 700, 700, 100, 75
	sleep % ran(995, 1999)
	MouseClickDrag, Left, 700, 700, 700, 100, 75
	click 1100, 600
	sleep % ran(995, 1999)
;is it available to buy?
	if (imageCheck(*TransBlack "buy.bmp",560, 450, 780, 780) = true) {
		Click, %FoundX%, %FoundY% 
		sleep % ran(995, 2999)
	}
	returnToHome()
}

openShips(){
	MouseClickDrag, Left, 1400, 500, 300, 500, 75
	sleep % ran(1995, 2999)
	click 1325, 325
	sleep % ran(1995, 2999)
}

fleetBattles(){
	click 800, 700
	sleep % ran(1995, 2999)
}

openLight(){
	click 500, 600
	sleep % ran(995, 2999)
}

clickNormal(){
	click 500, 875
	sleep % ran(1995, 2999)
}

click5(){
	MouseClickDrag, Left, 200, 185, 1300, 185, 75
	sleep % ran(1995, 2999)
	click 900, 185
	sleep % ran(2995, 3999)
}

multiSim(){
	click 1200, 800
	sleep % ran(995, 2999)
	click 800, 600
	sleep % ran(1995, 3999)
	click 800, 800
	sleep % ran(1995, 3999)
}

