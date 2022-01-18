#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#MaxThreadsPerHotkey 2
; CHANGE SETTINGS HERE
numberOfTabs := 30 ; Setting the number of tabs to open
openDelay := 5 ; Setting the delay we allow for a task to complete (set this higher for slower internet / computers)

; DO NOT TOUCH BELOW HERE DO NOT TOUCH BELOW HERE DO NOT TOUCH BELOW HERE
SetTitleMatchMode, 2 ; Setting script to match on the text being anywhere in the title
loopNumber := 1 ; Setting a variable to open new tabs and do a search with a increasing number

F12:: ; F12 is hotkey to start the script
{
    MsgBox,,MS Rewards Script by WolfieeifloW, Press OK to start & let the script run until it's done!`nPress F11 at any time to end the script. ; MsgBox to let the user know what to do
    loopNumber := 1 ; Resetting variable in case script errors
    Run, msedge.exe "https://rewards.microsoft.com/" ; Opening Microsoft Edge to the Rewards page
    WinWait, Rewards Dashboard,, %openDelay% ; Waiting for the page to load
    Sleep, 100
    if ErrorLevel { ; If there's an error:
        MsgBox,,MS Rewards Script by WolfieeifloW, Could not load Rewards dashboard.`nPlease try running script again. ; Display an error to the user
        Return ; Stop the script
    } Else { ; Else if there isn't an error
        While, loopNumber < numberOfTabs+1 { ; Loop until we open the correct number of tabs
            Send, {Ctrl down} ; Input holding the CTRL key down
            Send, t ; Plus a T to open a new tab
            Send, {Ctrl up} ; Send CTRL up
            WinWait, New tab,, %openDelay% ; Wait for the new tab to be opened
            if ErrorLevel { ; If there's an error:
                MsgBox,,MS Rewards Script by WolfieeifloW, Could not open another tab.`nPlease try running script again. ; Display an error to the user
                Return ; Stop the script
            } Else { ; Else if there isn't an error
                Send, {Ctrl down} ; Input holding the CTRL key down
                Send, l ; Plus an L to target the address bar
                Send, {Ctrl up} ; Release CTRL key
                Send, %loopNumber% ; Send the increasing number as the search
                Send, {Enter} ; Enter / Submit the search
                WinWait, %loopNumber% - Bing,, %openDelay% ; Wait for the search to complete
                if ErrorLevel { ; If there's an error:
                    MsgBox,,MS Rewards Script by WolfieeifloW, Search did not complete.`nBing may be down or try running script again. ; Display an error to the user
                    Return ; Stop the script
                } Else { ; Else if there isn't an error
                    loopNumber += 1 ; Add 1 to the increasing number
                }
            }
        }
        Send, {Ctrl down} ; Input holding the CTRL key down
        Send, 2 ; Press 2 to get back to the first search tab
        Send, {Ctrl up} ; Release CTRL key
        WinWait, 1 - Bing,, %openDelay% ; Wait to be on the correct tab
        if ErrorLevel { ; If there's an error:
            MsgBox,,MS Rewards Script by WolfieeifloW, Searches complete but closing tabs failed.`nPlease close the tabs manually. ; Display an error to the user
            Return ; Stop the script
        } Else { ; Else if there isn't an error
            Sleep, 100 ; Small delay to let script catch up
            Loop, %numberOfTabs% {
                Send, {Ctrl down} ; Input holding the CTRL key down
                Send, w ; Sending w 30 times to close all the tabs
                Send, {Ctrl up} ; Release CTRL key
                Sleep, 10 ; Very small delay to make sure tabs close smoothly
            }
            Sleep, 100 ; Small delay to let script catch up
            MsgBox,,MS Rewards Script by WolfieeifloW, Script complete!`nEnjoy your points! ; Display a message that the script is done
        }
    }
}
Return

F11::
ExitApp ; Completely end the script