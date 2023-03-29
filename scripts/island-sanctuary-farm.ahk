#SingleInstance Force
#InstallKeybdHook
SendMode Input
DetectHiddenWindows, On
SetKeyDelay , 50, 30,    ; 50ms is the default delay between presses, 30ms is the press length

if !A_IsAdmin
{
	Run *RunAs "%A_ScriptFullPath%"
	ExitApp
}

Exit

NumpadDiv::
	ID := WinExist("A")
;	ToolTip % ID, 0, 0 ; Displays a windowID in top left, put a semicolon in front of this line to disablesss

	LargeTurnLoopCounter = 0
	LargeTurnLoopCounterMaximum = 16

	Loop
	{	
		; Acquire target & auto run to target
		Random AcquireTargetDelay, 1800, 2900 ; this will randomize time for pressing your hotkey from 1,8s to 2,9s
		ControlSend, , {Numpad3}, ahk_id %ID%
		sleep %AcquireTargetDelay%
		
		; Confirm button
		Random ConfirmDelay, 300, 800 ; this will randomize time for pressing your hotkey from 0,3s to 0,8s
		ControlSend, , {Numpad0}, ahk_id %ID%
		sleep %ConfirmDelay%
		
		Random TurnDirection, 0, 1
		
		Random SmallTurnDelay, 200, 400
		
		Random MediumTurnChance, 1, 12
		Random MediumTurnDelay, 500, 700
		
		Random LargeTurnDelay, 1000, 1200
		
		LargeTurnLoopCounter++
		
		if(LargeTurnLoopCounter >= LargeTurnLoopCounterMaximum)
		{
			; Remove target
			ControlSend, , {NumpadDot}, ahk_id %ID%
			; Reset Camera and Zoom Out
			ControlSend, , {ctrl down}{shift down}{end}{shift up}{ctrl up}, ahk_id %ID%
			ControlSend, , {PgDn down}, ahk_id %ID%
			sleep 1500
			ControlSend, , {PgDn up}, ahk_id %ID%
			if (TurnDirection){
				ControlSend, , {d down}, ahk_id %ID%
				sleep %LargeTurnDelay%
				ControlSend, , {d up}, ahk_id %ID%
			}
			else {
				ControlSend, , {a down}, ahk_id %ID%
				sleep %LargeTurnDelay%
				ControlSend, , {a up}, ahk_id %ID%
			}
			
			LargeTurnLoopCounter = 0
		}
		
		else if(MediumTurnChance == 1)
		{
		
			if (TurnDirection){
				ControlSend, , {d down}{Space}, ahk_id %ID%
				sleep %MediumTurnDelay%
				ControlSend, , {d up}, ahk_id %ID%
			}
			else {
				ControlSend, , {a down}{Space}, ahk_id %ID%
				sleep %MediumTurnDelay%
				ControlSend, , {a up}, ahk_id %ID%
			}
		}
		
		; Small turn, happens most of the time.
		else
		{
			
			if (TurnDirection){
				ControlSend, , {d down}, ahk_id %ID%
				sleep %SmallTurnDelay%
				ControlSend, , {d up}, ahk_id %ID%
			}
			else {
				ControlSend, , {a down}, ahk_id %ID%
				sleep %SmallTurnDelay%
				ControlSend, , {a up}, ahk_id %ID%
			}
		}
	}	
return

NumpadMult::Pause,Toggle

F9::ExitApp