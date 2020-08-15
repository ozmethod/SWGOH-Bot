;initialization
#Persistent
#singleinstance force
#include BotV2-Functions.ini

;initialize variables
global maxAccountNumber, FoundX, FoundY, allDone, arenaTime, challengeTime,1a,1b,1c,1d,2a,2b,2c,2d,2e,2f,stage, imageAreay1, imageAreay2, cantinaDone:=0
global accountNumber := 8
global deviceIdArray := []
initializeArray()
maxAccountNumber := deviceIdArray.Length()
CoordMode, Mouse, Window
;msgbox "Got here 1"

mainRoutine()
{
	allDone:=0
;msgbox "Got here 2"
	;while loop cycles through accounts.
while(allDone<2)
{
;initialization, is nox running? if not run
IfWinNotExist, BotBox
{
		Run, C:\Program Files (x86)\Nox\bin\Nox.exe -clone:Nox_28
        sleepRan(5)

;msgbox "Got here 3"        
}	
;nox is running, set device ID for account required
IfWinExist, BotBox
{
	androidHome()
			msgbox "Got here 11"  
;	msgBox % deviceIdArray[accountNumber][3]
	setDeviceId(deviceIdArray[accountNumber][1])
	reset()
	
msgbox "Got here 4"
}
;load up swgoh
returnToHome()
;run daily tasks
runAccount()

msgbox "Got here 5"
;close swgoh
Send {PgUp}
sleepRan(3)
while (imageCheck(*TransBlack "yoda.bmp") = false){
	closeOpenApps()
	sleepRan(0)
	}
	
msgbox "Got here 6"
;loop endpoint iterate account number and rerun
	accountNumber := (accountNumber + 1)
		if(deviceIdArray[accountNumber][4]>0){
			accountNumber := (accountNumber + 1)		
		}
	arenaTime :=0
	challengeTime := 0
	allDone :=0
	
msgbox "Got here 7"
	if(accountNumber >= maxAccountNumber)
	{
	allDone := 2
	}
}
}

mainRoutine()

arenaTimer:
	arenaTime := 0
return
challengeTimer:
	challengeTime := 0
return
