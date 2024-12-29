#Persistent
#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

; Define an array with personalized function names
functionNames := ["Auto Bound", "Auto lvl30", "Auto Merge", "RightClickSpam", "ClickSpam", "Auto Rebirth", "Auto R-Feather into Seal Jade", "Auto Seal Jade", "Auto pet capture", "Function 10", "Function 11", "Function 12", "Function 13", "Function 14", "Function 15"]

; Define an array with personalized messages
functionMessages := ["Remember to always press the windows before pressing F5.","Remember to always press the windows before pressing F5.","Remember to always press the windows before pressing F5.","Remember to always press the windows before pressing F5.","Remember to always press the windows before pressing F5.","Remember to always press the windows before pressing F5.","Remember to always press the windows before pressing F5.","Remember to always press the windows before pressing F5.","Remember to always press the windows before pressing F5.","Remember to always press the windows before pressing F5.","Remember to always press the windows before pressing F5.","Remember to always press the windows before pressing F5.","Remember to always press the windows before pressing F5.","Remember to always press the windows before pressing F5.","Remember to always press the windows before pressing F5."]

; Set font color to white and background to black
Gui, Color, 000000  ; Set background color to black
Gui, Font, cWhite  ; Set text color to white

; Add radio buttons for the functions
Loop, 15
{
    Gui, Add, Radio, vFunction%A_Index% gRadioSelect w200, % functionNames[A_Index]
}

; Add dynamic text
Gui, Add, Text, x10 y+5 w300 vDynamicText, Select Initial Position:

; Add dropdowns for position and quantity for all functions
Gui, Add, Text, x10 y+5 w200 vDropdownLabel, Select Initial Position:
Gui, Add, DropDownList, x10 y+3 w200 vDropdownPosition, 1|2|3|4|5|6|7|8
Gui, Add, Text, x10 y+5 w200 vDropdownLabelQty, Select Quantity:
Gui, Add, DropDownList, x10 y+3 w200 vDropdownQty, 1|2|3|4|5|6|7|8

GuiControl, Hide, DropdownLabel
GuiControl, Hide, DropdownPosition
GuiControl, Hide, DropdownLabelQty
GuiControl, Hide, DropdownQty

; Add key description labels with 10px spacing
Gui, Add, Text, x10 y+30 w300, CLICK Press F5 to start.`nPress F6 to pause the program.`nPress F6 and then reset to stop any function.`nPress F7 to stop the program and exit the application.

; Add a Reset button
Gui, Add, Button, gReset, Reset

; Add a button to select the Capture2Text path
Gui, Add, Button, gSelectCapture2TextPath, Select Capture2Text Path

Gui, Show,, MergeHelper By: Diegod
Return

GuiClose:
ExitApp

RadioSelect:
    Gui, Submit, NoHide
    Loop, 15
    {
        GuiControlGet, isChecked, , Function%A_Index%
        if (isChecked) {
            ; Show dropdowns for all functions except RightClickSpam and ClickSpam
            if (A_Index != 4 && A_Index != 5 && A_Index != 9 && A_Index != 6) {
                GuiControl, Show, DropdownLabel
                GuiControl, Show, DropdownPosition
                GuiControl, Show, DropdownLabelQty
                GuiControl, Show, DropdownQty
            } else {
                GuiControl, Hide, DropdownLabel
                GuiControl, Hide, DropdownPosition
                GuiControl, Hide, DropdownLabelQty
                GuiControl, Hide, DropdownQty
            }
            ; Update the dynamic text with the corresponding message
            GuiControl,, DynamicText, % functionMessages[A_Index]
            break
        }
    }
Return

Reset:
    Reload
Return

F5:: ; Start the selected function
    Gui, Submit, NoHide
    selectedFunction := ""
    selectedPosition := ""
    selectedQuantity := ""
    Pause, Off
    Loop, 15 {
        GuiControlGet, isChecked, , Function%A_Index%
        if (isChecked) {
            selectedFunction := functionNames[A_Index]
            GuiControlGet, selectedPosition, , DropdownPosition
            GuiControlGet, selectedQuantity, , DropdownQty
            break
        }
    }

    if (selectedFunction = "") {
        MsgBox, Please select a function before starting.
        Return
    }

    if (selectedFunction != "RightClickSpam" && selectedFunction != "ClickSpam" && selectedFunction != "Auto pet capture" && selectedFunction != "Auto Rebirth" && selectedFunction != "Auto R-Feather into Seal Jade") {
        if (selectedPosition = "" || selectedQuantity = "") {
            MsgBox, Please select all required options before starting.
            Return
        }
        RunFunction(selectedFunction, selectedPosition, selectedQuantity)
    } else {
        RunFunction(selectedFunction, selectedPosition, selectedQuantity)
    }

Return

F6::Pause
isPaused := !isPaused
if (isPaused) {
    ToolTip, Program Paused
} else {
    ToolTip, Program Resumed
}
Sleep, 1000
ToolTip  ; Clear tooltip
Return

F7::ExitApp
Return

global capture2TextPath

SelectCapture2TextPath:
    FileSelectFile, capture2TextPath, 3, , Select Capture2Text.exe, Executables (*.exe)
    if (capture2TextPath != "") {
        MsgBox, Capture2Text path selected: %capture2TextPath%
    }
Return

RunFunction(functionName, dropdownPosition := "", dropdownQuantity := "") {
    if (functionName = "Auto Bound") {
        RunFunction1(dropdownPosition, dropdownQuantity)
    }
    else if (functionName = "Auto lvl30") {
        RunFunction2(dropdownPosition, dropdownQuantity)
    }
    else if (functionName = "Auto Merge") {
        RunFunction3(dropdownPosition, dropdownQuantity)
    }
    else if (functionName = "RightClickSpam") {
        RunFunction4()
    }
    else if (functionName = "ClickSpam") {
        RunFunction5()
    }
    else if (functionName = "Auto Rebirth") {
        RunFunction6()
    }
    else if (functionName = "Auto R-Feather into Seal Jade") {
        RunFunction7(dropdownPosition, dropdownQuantity)
    }
    else if (functionName = "Auto Seal Jade") {
        RunFunction8(dropdownPosition, dropdownQuantity)
    }
    else if (functionName = "Auto pet capture") {
        RunFunction9()
    }
    else if (functionName = "Function 10") {
        RunFunction10()
    }
    else if (functionName = "Function 11") {
        RunFunction11()
    }
    else if (functionName = "Function 12") {
        RunFunction12()
    }
    else if (functionName = "Function 13") {
        RunFunction13()
    }
    else if (functionName = "Function 14") {
        RunFunction14()
    }
    else if (functionName = "Function 15") {
        RunFunction15()
    }
    else {
        MsgBox, Function not found!
    }
}

RunFunction1(dropdownPosition, dropdownQuantity) {
    speed := 800 ; Default speed in milliseconds

    repeatedCoordinates := []
    Coordinates := []

    Coordinates.push([68, 229]) ; 1
    Coordinates.push([135, 219]) ; 2
    Coordinates.push([212, 229]) ; 3
    Coordinates.push([287, 219]) ; 4
    Coordinates.push([68, 271]) ; 5
    Coordinates.push([135, 279]) ; 6
    Coordinates.push([212, 279]) ; 7
    Coordinates.push([276, 270]) ; 8

    repeatedcoordinates.push([91, 339])
    repeatedcoordinates.push([540, 390])
    repeatedcoordinates.push([540, 390])
    repeatedcoordinates.push([540, 390])
    repeatedcoordinates.push([148, 359])
    repeatedcoordinates.push([430, 400])
    repeatedcoordinates.push([782, 269])
    repeatedcoordinates.push([850, 400])
    repeatedcoordinates.push([467, 282])
    repeatedcoordinates.push([850, 400])
    repeatedcoordinates.push([850, 400])

    ; Add unique coordinates to the list

    ; Perform the click actions
    Loop, %dropdownQuantity%
    {
        ; Access the x and y coordinates relative to the active window
        x := coordinates[dropdownPosition][1]
        y := coordinates[dropdownPosition][2]
        Send, {Click %x%, %y%} ;
        Sleep, speed
        Loop, % repeatedCoordinates.MaxIndex()
        {
            ; Access the x and y coordinates relative to the active window
            x := repeatedCoordinates[A_Index][1]
            y := repeatedCoordinates[A_Index][2]
            Send, {Click %x%, %y%} ;
            Sleep, speed
        }
        dropdownPosition++
    }
    MsgBox, Your pets are now bound!
}

RunFunction2(dropdownPosition, dropdownQuantity) {
    speed := 800 ; Default speed in milliseconds

    repeatedCoordinates := []
    Coordinates := []

    repeatedcoordinates.push([100, 340])
    repeatedcoordinates.push([380, 712])
    repeatedcoordinates.push([182, 342])
    repeatedcoordinates.push([284, 553])

    Coordinates.push([68, 229]) ; 1
    Coordinates.push([135, 219]) ; 2
    Coordinates.push([212, 229]) ; 3
    Coordinates.push([287, 219]) ; 4
    Coordinates.push([68, 271]) ; 5
    Coordinates.push([135, 279]) ; 6
    Coordinates.push([212, 279]) ; 7
    Coordinates.push([276, 270]) ; 8

    ; Perform the click actions
    Loop, %dropdownQuantity%
    {
        ; Access the x and y coordinates relative to the active window
        x := coordinates[dropdownPosition][1]
        y := coordinates[dropdownPosition][2]
        Send, {Click %x%, %y%} ;
        Sleep, speed
        Loop, % repeatedCoordinates.MaxIndex()
        {
            ; Access the x and y coordinates relative to the active window
            x := repeatedCoordinates[A_Index][1]
            y := repeatedCoordinates[A_Index][2]
            Send, {Click %x%, %y%} ;
            Sleep, speed
        }
        ClickSpam()
        Sleep, speed
        Send, {Click 400, 100} ;
        Sleep, speed
        dropdownPosition++
    }

    MsgBox, Pets lvl30!
}

ClickSpam() {
    Loop, 130 {
        Click
        Sleep, 15  ;
    }
}

RightClickSpam() {
    Loop, 130 {
        Click, Right  ;
        Sleep, 15      ;
    }
}

RunFunction3(dropdownPosition, dropdownQuantity) {
    speed := 500 ; Default speed in milliseconds
    Coordinates := []

    Coordinates.push([68, 229]) ; 1
    Coordinates.push([135, 219]) ; 2
    Coordinates.push([212, 229]) ; 3
    Coordinates.push([287, 219]) ; 4
    Coordinates.push([68, 271]) ; 5
    Coordinates.push([135, 279]) ; 6
    Coordinates.push([212, 279]) ; 7
    Coordinates.push([276, 270]) ; 8

    x := coordinates[dropdownPosition][1]
    y := coordinates[dropdownPosition][2]
    x2 := coordinates[dropdownPosition+1][1]
    y2 := coordinates[dropdownPosition+1][2]

    b64ImageMergedSpirit:= "iVBORw0KGgoAAAANSUhEUgAAAB4AAAAWCAYAAADXYyzPAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAN8SURBVEhLvdJdaBRXGMbxgbiwEJDBiHWriB+9yFpKWEwUJKsoBDHghUtaREhRQmhg0RZWhWXwwrD4EYKQsKigJiDEomJCCy2lNOIH6UXBRRqMeLMgLVtytTeBgRh4fJ8zc86eyWTrnRd/zmEY5nfewzjl8TJ0d25Em5uIVpuO9ljesfvlI5Wvj6K7owOu4+CTw0Pf9gdwabgEXbnomX4uFlAb8VC/e8HkT3jwZ2Rlsq9dL0W7Ic+sFsZL+P2yp5qU743Kd5lDeMwrgq0FK2zmh6ZwfaKoQK5q3wQmGoMnz50FI26jr4p5A2tcwX/n4T/jswvAkwH402cjcPVqwaTR0pm8KgI/PjMAHUGDFgfUVeO5QBrmpCGqVkFtXE3p5VGRbzEbjcEL53PQ1b8/GAnjvcB0TxD3t+UZuyx7yR+V/TTfCfbVwZzqad8R1ezgSdXDE8dws/cgvOM5Ver/YP9Wd4Cxv8JDEP2pMwZzrec7I+i9w90K1GgMnuzphq7Wc7iBPt8P/GdFnKhODkFQo7WjaQOWMpmgbMagMbj0lbwgrYYVzismqPE/01FcptUoi6BN4JN79wWwt2sbpnZvQSWTwkLYv6c2qXDRBSbbgGey/ycF1MNeyrNH64FfXSxdcbF4wkW13cVM+ybT2NY2/NixA3PZtFpZuSutym1Y34BZDNagTsMaD+H5dFsEJsqV6LWdKVUM1tOuhvFEprVRpiflasFEGcGC66q4J5jf6Bq8sGuLKsOr1vDqq1YwJ9bxyomOJIPCq9bXzCpdKYM3gzmtgkubk5hrD6p+EbR4KAEUHfmxBNcN85mA7LtgvzyUgN+VNM3vSWDWTZpeZFoxtdk1DX6eUO1PhvDU9qAYTOx+axD3BFlfC3DIWRO2I2w39mVrHF49scL7Q5wrC0EbXrndouJ+8ZsWg3L/7mgi0mw2mFrBGq1lGiBb6peP2ygjakUMFdlLxHlLBJm6sdNOc7iSdcDmc/Li19H8Y9GqXUGLfQ6WCvLOiDQjyGs5gKz+sBzmgUwvcV8fb/TbkIM72SSGdidUDsG38rB6UU59Va4ujPCyJx+R1oIhHzNo2MqrRsRt+NIBx6Cdn7XAIahb/qMVft1Vqw3rFGZH+L385Tpf/vRwYg1zUqK9G50AXCfXzGyYkxLW4U0SKw/k9CHM69UpmJM2gXnVNsoMus7BBx49Qr8vtt9iAAAAAElFTkSuQmCC"
    MergedSpiritCoords := SearchImage(b64ImageMergedSpirit, 750, 280, 1020, 780)

    Send, {Click %x%, %y%} ;
    Sleep, speed
    Send, {Click 90, 340} ;
    Sleep, speed
    Send, {Click 234, 173} ;
    Sleep, speed
    MouseClickDrag, left, 460, 210, 360, 210
    Sleep, speed
    MouseClickDrag, left, 360, 210, 715, 210
    Sleep, speed
    Loop, %dropdownQuantity%
    {
        if(MergedSpiritCoords == "") {
            MsgBox, No Merged Spirit found
            break
        }
        MouseClickDrag, left, %x%, %y%, 400, 300
        Sleep, speed
        Send, {Click 400, 300} ;
        Sleep, speed
        MouseClickDrag, left, %x2%, %y2%, 580, 300
        Sleep, speed
        Send, {Click 580, 300} ;
        Sleep, speed
        MouseMove, MergedSpiritCoords.x, MergedSpiritCoords.y
        Sleep, speed
        Loop, 10 {
            Click, Right    ;
            Sleep, 15   ;
        }
        Loop, 6 {
            MouseClick, Left, 690, 760
            Sleep, speed
        }
        Sleep, 500 ;
        Send, {Click 234, 173} ;
        Sleep, speed
        MergedSpiritCoords := SearchImage(b64ImageMergedSpirit, 750, 280, 1020, 780)
    }
    if(MergedSpiritCoords == "") {
        return
    }
    Send, {Click 234, 173} ;
    Sleep, speed
    MouseClickDrag, left, 715, 210, 460, 210
    Sleep, speed
    Send, {Click 425, 202} ;
    MsgBox, PetsMerged
}

RunFunction4() {
    RightClickSpam()
}

RunFunction5() {
    ClickSpam()
}

RunFunction6() {
    speed := 500 ;
    Send, {Click 235, 145} ;
    Sleep, speed
    b64ImageRebirthSpirit:= "iVBORw0KGgoAAAANSUhEUgAAACEAAAAWCAYAAABOm/V6AAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAQgSURBVEhLndZhaBt1GMfxP8ziQSEECoNQkRVkGPBNfLHQUBkWajFY2QKFWtYxiAHLaamcFsPRQsoxWBsm1IBQasXCBmspskIHytoXaodTFuosjFKUCWNFmOTFhEgrPD6/5/L/5+6aOZTw5X8LXZ/PnrtmVeXLZarMVcLNR7oRbuHeQqjKVX7/P+TxzKELI6SeUX7upEvudLiJykQo72uPpu5MScX7RfLuelS6z3/+w7/2NsNNfFcK5THc/eISObNTkjdTlpSy/Foh5D1OIzDceewIQCMAQMAUH/D1T4xq5N7zpP+FcGacI4jxlXEZDISGYLh7yF/byKn7AYOCgPHrjGoA7A8dqSUCw/Pzecmes80GALC/sc0mNCIICCI0BAgMtxddKQhAQ+cuSAaRm85Rz2QP5TZzpv7VPqlv+7SU++uMZB8UyDt0qcQYNLafp+G9HNm/OFRuvHCdu2pL/bN5aZgfRDTgXqTT75QoV3AlZSX8gOhf7D+C0IDexxmD0JAnIXBmbw6HAD3jwzJcA/4VgW3osjNZA0CZug/Rm+AfMhMwGK4ByfleMzw1mJMwOIpIvzbcRKTPpyk1kjIBoTcRRQAQRSC9BQBQEODnGkBLRKaQoeeHuqROp4sSl7lPElLqNsMQvwqUp3keiepUk6q0TSBVaJUKOxVKX3PJmszT8beLpo43xyj53rrUdW5JSr51RYq9yB9Y8Qypk28kQwicakS1RFRpS9KIK7QmPQkBAE4AEtmPpShCIB0vJ6jrFX84tiDbCGwiy68oAoOxAYRtaAQACMNRvNu/xvB4t2sgna+WJGyhJSJ6O4DALdAQXAcR+nboLaBE0XsqQt8KOa3ufrL6MmSd5/OjQUlNpqTYtT5Kks2MZulHNvXuO9JL21NyJncekHVx1RQr/kzq9Q1T7N1dsga2TO2nJiTruaykrMExH6EhXBDRuTMkg4MQDNcd/+oSJVa/l4KIUIzQARE7s/QURGQT6IVdfwM4EQarpYo5sYnMIckJTOfy7yFEx+wjEyDx0WoE8T4/UI0NyO2Yy5vhehMYHL/VDIODaYSGAKFL7hEllskAcB5BqNHP+V+93uz6b6TW+OSO3apK8RsbpsTiAlmjZWorr9GxL3dJ3SWy9on66v6J2vf+NrVtHvD3qoVKnK1Q/FRBTtREfPqjD/ihLoOtGlHb3kPBWNVfJQAQAFHESf76VggUQkxvGYROqRl+gjWggQBAIwTEAIUBDQwGB9PDWyHMJni4OrtA6oRDVme6+d+4pBEBiN6EDgCNwC3BBnRRRJ6I4nxrDGCpHgJIIQDij1RV2KC2D76l+Bzff05Ns3ydqzbih0u6yav97IDaV3hIo9htfh9QLvUn8QcXP4i1GsXv1Mha4b87ww0sk8KHku7ZGA/mX3AlRf8A3aK4HFvMm0oAAAAASUVORK5CYII="
    RebirthSpiritCoords := SearchImage(b64ImageRebirthSpirit, 750, 280, 1020, 780)
    MouseMove, RebirthSpiritCoords.x, RebirthSpiritCoords.y
    if(MergedSpiritCoords == "") {
        MsgBox, No Merged Spirit found
        return
    }
    Sleep, speed
    Loop, 10 {
        Click, Right    ;
        Sleep, 15   ;
    }
    Loop, 6 {
        MouseClick, Left, 400, 760
        Sleep, speed
    }
}

RunFunction7(dropdownPosition="", dropdownQuantity="") {
    speed := 600 ;
    Coordinates := []

    Coordinates.push([68, 229]) ; 1
    Coordinates.push([135, 219]) ; 2
    Coordinates.push([212, 229]) ; 3
    Coordinates.push([287, 219]) ; 4
    Coordinates.push([68, 271]) ; 5
    Coordinates.push([135, 279]) ; 6
    Coordinates.push([212, 279]) ; 7
    Coordinates.push([276, 270]) ; 8

    RepeatedCoordinates := []

    RepeatedCoordinates.Push([540,360]) ; petmanager
    RepeatedCoordinates.Push([540,360]) ; petmanager
    RepeatedCoordinates.Push([540,360]) ; petmanager
    RepeatedCoordinates.Push([150,380]) ; Reset Pet's Points
    RepeatedCoordinates.Push([450,390]) ; Move pet window to the front
    RepeatedCoordinates.Push([440,250]) ; Reset Growth Rate Randomly
    RepeatedCoordinates.Push([850,400]) ; OK
    RepeatedCoordinates.Push([440,330]) ; Reset
    RepeatedCoordinates.Push([850,400]) ; OK

    if(dropdownPosition = "") {
        InitialPosition := 1
    }Else{
        InitialPosition := dropdownPosition
    }

    x := coordinates[InitialPosition][1]
    y := coordinates[InitialPosition][2]

    ; Make sure Capture2Text is configured
    while(capture2TextPath = ""){
        MsgBox, Please select the Capture2Text path first and re run the code.
        return
    }

    b64ImageMinoEgg:= "iVBORw0KGgoAAAANSUhEUgAAABMAAAARCAYAAAA/mJfHAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAHSSURBVDhPhdAxSBtRHMfxAw0EBHEqSidHx04FoUNdpI4BQQSXhk6BLqKL7VQJFboJKQg6RGpAsGIkSqWKCIougcbSDlqdLN0yWAhI4Ofv99698z2NOny4u3d33/u/i6bGBlD6OIJGLQvU93F1Om3gdNK6KHK9ClyeWX/yRqOaNY7XxvBpIoOZ10OIFMI5X2ZIFDXh2pCl4O1YbTSJyersCHKvBhAdr78NYpoqiLnJ/pWtFjFNV3qXQWRC1Lz4Eki26MTbaxWT/cIoYyfjMGq5UPwR4+cb4AendU6mgN98x1Pf4D9T6OowA2z3hxRwjgaBQ27ZuS+m0P/KM6DcexPS+U5fGNvhM6KYplPkaDhxN+ZTTBHHn0y+Pwe+9iTsNvd4sZIGljtD6x3AAaMJxp3dp3ymK1AvdMWxTS0wUORRdL79JKSA8433F/kxj40ppOAWpyvzhujcRTThcsR1UsRRZD6VuImJAr7HYtqeQgWuk41t8cJZo1JshTYesBSq5P2YQgueOVqkViG5FRt/kbKxZoULfsjFWgW1rTx5oep0GzLdkY019E/ui4nbsguRAi6Ue5mOYwpRky/58NmjZ+Ipfn1oM/6+TxvF4RR62iNkuyNcAzoEov6dEnO4AAAAAElFTkSuQmCC"
    MinoEggscoords := SearchImage(b64ImageMinoEgg, 750, 280, 1020, 780)
    b64ImageSealJade:= "iVBORw0KGgoAAAANSUhEUgAAACEAAAAZCAYAAAC/zUevAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAQISURBVEhLxdbRa1tlGMfxQC1EqjNQyBZXyiIlWBiUsKos6IWRUBsIzEKgBgodMbBxLHQcGwhHqq0huHpYXT04GFmFlKyskg0qURHihVCRVUIdGCmFOJgUQWQX/gGPz/Mm75v3OU0oeqEXH1rSNr9v36Ynx+P1eoFkMhlwPnWU4nqRKbuVykzltstWb4vvZiE4FFBEhLPWGf8vIki5VITEZKwVkXkLT+B/isgtzLcirOU8EHvF5q5xIlRTpFDdzWNguM6h50TBM1rEktv7SwpFFAoFZvVDzl7poNHr9lXGca5zvSKyOavDzCoUQsO5XE5ZsjgLH5MopPDeImN/hIGarhHGFZPLGNwcZ7oYlzkLn0OXX7YYFpHGgZY0k7o4q8QTCZh6Y4qbSTOpyyYTx++RZufmYfZiCswFDHYRL0wZMZVMMjSs0wMuXZkH84OC4NzZEqxrDkPDekgiERchEouYmLwAhIajsQklcj6iUAQNL66tKnJcKm5XGft2BbIrqypGPpeMmZ6+ILAIOR5+ISLoAcaCCc52hanW60ztl4YiI/QQGtdDWETklSiQ0efDTCQWh/Q7WbA3SlB9UIdKfUeo7e9B/bcDqD9qCI3fm9D88xAO/jiEvUdN2DloCKWvtoXCrc/AWLYh/qYJYy9GITgyKkRfjQiBU+2Is2PjLMDA/xY5Lqlx1Hx8KIYP/3qsPlKEHlJ7sHMk4uXXUypi/NxYJ4IC9AgRcBePWwsgaryNhruRIb0i5GnQOIWoiOHnQiIgnkyJgG4ReoCAJyC5Q3pFUIAeEQqNtCLoAf/JAIRjU5B824TcJ3id/6YKWz/i35+Ota2Bv6Gu6aYF/vBwH5zvapD/4h6Y5RKk8b0lPmfB6EsxITCEm4OD4kJFHz2nh4Pg8/mORNyotUJkzM6v+8dG0Pj2T7vCP4qgU+gWkb9bFiEyhiL0kN2HB4wcL+I4kQG9InxP+eD0s/5WBAW4IwhFyBCKKH9fw9fGror5+uc9oXwfv4bkuDuCAo6NGHjGB2TstaSQMHJgrBVhfrOkWHhxKlTxIvVtVcl/WRGse5st+GLWpUs43jb98VUIT6Zh5FwM/MMhcTtJAvjLDz59ohXR/6QXfENhFpG5dYOF5D4vMwbeGTEbnB6QwLfybhEUcGJgADwU4HnCoyJkCEXojoy6pNedTgB+LgNIdM5UEXqAiqCTkBH6aaTW7H8VIQKQDKBTkBH6KRAKEH8O30m/iPB4MORUEILhqPiBiYVFSOELSlnPM+mSrcyW8zBzJwvTGzmYWreE+E28p0DjRlIIno/CwCBu4Q7p6+uD/v5+EeMJnMHrBIW0vyhDxpOXeIgrYmbTElJbeBODKEIGUIw7wh86qzZkBPF6vfA3T3rir3x79SQAAAAASUVORK5CYII="
    SealJadecoords := SearchImage(b64ImageSealJade, 750, 280, 1020, 780)
    b64ImageRedFeather := "iVBORw0KGgoAAAANSUhEUgAAABkAAAASCAYAAACuLnWgAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAALHSURBVEhLhZRPSBRhGMa/2VIjNmlJtwzMqEMHCfYSSxAsgtAeOhhBBUGpHVbZ1DYjChYvHcRD3gIVligK6hLYRSS8bQePgl0C8SJ48bBEFw/x9Dzfzjsz/sFgf7wfszPPb953vhm3nHeoX4/ZLcX86nfYuetQu+aA2SK2bzcrZnMxqwvAOx4T3weBqRx2h3jefA9KJx0ep4/B1a4wJGRrIA6vM9jARFsYXmwKn2Sagq8MlUThQqIHPV4gFnsdPvdSMn3eYfJ0k+XLDo0CA8nmVYcP3Q7lDEOHGCjmgU1euH6pCW5lgWoFeM7wOUoGeI7qDCVkp8hJEFdKxxJhEkOSMttWeCRTsDDJUrUpMFlCUu0MJeMtMeomKfEiSgwv+4K9WLhkrAo3ycjxcFxJidCYNC6TKNiQyMYVjU0S64bYmMaCUILXnPONNlRSLmKcvM06/Olr8zRyfNDDDDIG7mG9o8ejNT6uAPc5NqOUwxY3knMOQRDANQpdwDPuEFI9E0sMyUzy+9FNv94j+AnsnssfLXnRzjGwExNprbvHy4WDnczxHFYvmP/kBVrXAv7/P4k6EBKYxESeH3y4SRhuAi/UuJIj2y8ZPaGHnY+otQ9iMZ3DbGveV/G3txyBVQrWgO3uUygzBK94bIQs8bjQup8bgFzk/xeSknLQFTGZKnhKQdHXWirnMYkJVCX0wVqbiILNs5wMGU5RogedFAiFmyApkUAiExyQqIadSDDC7LUsJWppzPGFO0RiWAeqkkUCjSqUrPOd8CIigUSS+E4k6dvHdAd31p2VCHwDVjqLGHcZX/U5qStInxVthCl+Lzl2o85PkTHZyg1QyWxgNJ2NqBUqXoL3GwB/qibAQx4XJnnDnbRPMsib1I0/ZWeqwo22FA9IkgIJJTEkkeAwiQQmMZq7KyGRoDHDiyhQuGEd2LgiicYl0ZGSAP8Agwjs+7qKCK4AAAAASUVORK5CYII="
    RedFeathercoords := SearchImage(b64ImageRedFeather, 750, 280, 1020, 780)

    if ( (RedFeathercoords == "") || (SealJadecoords == "") || (MinoEggscoords == "")) {
        Click, 970, 240
        Sleep, speed
        Click, 970, 240
        Sleep, speed
        Click, 790, 760
        Sleep, speed
    }

    MinoEggscoords := SearchImage(b64ImageMinoEgg, 750, 280, 1020, 780)
    SealJadecoords := SearchImage(b64ImageSealJade, 750, 280, 1020, 780)
    RedFeathercoords := SearchImage(b64ImageRedFeather, 750, 280, 1020, 780)

    if ( (RedFeathercoords == "") || (SealJadecoords == "") || (MinoEggscoords == "")) {
        Click, 780,710
        Sleep, speed
    }

    MinoEggscoords := SearchImage(b64ImageMinoEgg, 750, 280, 1020, 780)
    SealJadecoords := SearchImage(b64ImageSealJade, 750, 280, 1020, 780)
    RedFeathercoords := SearchImage(b64ImageRedFeather, 750, 280, 1020, 780)

    if (MinoEggscoords == "") {
        MsgBox, No more Eggs
        return
    }
    if (SealJadecoords == "") {
        MsgBox, No more Seal Jade
        return
    }
    if (RedFeathercoords == "") {
        MsgBox, No more RedFeathers
        return
    }

    while((RedFeathercoords != "") && (SealJadecoords != "") && (MinoEggscoords != "")){
        MouseMove, MinoEggscoords.x, MinoEggscoords.y
        sleep, speed
        Click, Right
        Loop, % RepeatedCoordinates.MaxIndex()
        {
            ; Access the x and y coordinates relative to the active window
            x := RepeatedCoordinates[A_Index][1]
            y := RepeatedCoordinates[A_Index][2]
            Send, {Click %x%, %y%} ;
            Sleep, speed
        }
        savvyValue := capture2Text(618, 217, 653, 232)
        savvyValue := savvyValue + 0
        sleep, speed
        if (savvyValue >= 1) {
            ; Keep just the decimals
            savvyValue := Mod(savvyValue, 1)
        }

        while (savvyValue < 0.84) {
            Click, 860, 250 ; Reset savvy
            sleep, speed
            savvyValue := capture2Text(618, 217, 653, 232)
            savvyValue := savvyValue + 0
            sleep, speed
            if (savvyValue >= 1) {
                ; Keep just the decimals
                savvyValue := Mod(savvyValue, 1)
            }
        }

        Click, 850, 400 ; OK
        MinoEggscoords := SearchImage(b64ImageMinoEgg, 750, 280, 1020, 780)
        SealJadecoords := SearchImage(b64ImageSealJade, 750, 280, 1020, 780)
        RedFeathercoords := SearchImage(b64ImageRedFeather, 750, 280, 1020, 780)
        sleep, 1500
        RunFunction8(1,1)
    }

    if (MinoEggscoords == "") {
        MsgBox, No more Eggs
        return
    }
    if (SealJadecoords == "") {
        MsgBox, No more Seal Jade
        return
    }
    if (RedFeathercoords == "") {
        MsgBox, No more RedFeathers
        return
    }

}

RunFunction8(dropdownPosition, dropdownQuantity) {
    speed := 500 ;
    Coordinates := []
    repeatedCoordinates := []

    Coordinates.push([68, 229]) ; 1
    Coordinates.push([135, 219]) ; 2
    Coordinates.push([212, 229]) ; 3
    Coordinates.push([287, 219]) ; 4
    Coordinates.push([68, 271]) ; 5
    Coordinates.push([135, 279]) ; 6
    Coordinates.push([212, 279]) ; 7
    Coordinates.push([276, 270]) ; 8

    repeatedCoordinates.push([91, 339]) ; Carry
    repeatedCoordinates.push([540, 370]) ; Pet Manager
    repeatedCoordinates.push([540, 370]) ; Pet Manager
    repeatedCoordinates.push([540, 370]) ; Pet Manager
    repeatedCoordinates.push([148, 359]) ; Pet Raising
    repeatedCoordinates.push([440, 400]) ; Pet window
    repeatedCoordinates.push([440, 320]) ; Seal spirit
    repeatedCoordinates.push([850, 400]) ; Ok
    repeatedCoordinates.push([440, 320]) ; Seal spirit next window
    repeatedCoordinates.push([850, 400]) ; Ok
    repeatedCoordinates.push([850, 400]) ; Ok

    Loop, %dropdownQuantity% {
        x := Coordinates[dropdownPosition][1]
        y := Coordinates[dropdownPosition][2]
        Click, %x%, %y%
        Sleep, speed
        Loop, % repeatedCoordinates.MaxIndex() {
            x2 := repeatedCoordinates[A_Index][1]
            y2 := repeatedCoordinates[A_Index][2]
            Click, %x2%, %y2%
            Sleep, speed
        }
    }
}

RunFunction9() {
    MouseMove, 60, 60
    rightClickCount := 0
    while (true) {
        Click, Right
        rightClickCount++
        Sleep, 100

        if (rightClickCount >= 500) {
            Click, 980, 660
            rightClickCount := 0
            Sleep, 100
        }
        Send, {Tab}
        Sleep, 100
        SendInput, {Tab}
        Sleep, 100
        ControlSend,, {Tab}, A
        Sleep, 100
    }
}

RunFunction10(){
    MsgBox, toBeDone
}

RunFunction11(){
    MsgBox, toBeDone
}

RunFunction12(){
    MsgBox, toBeDone
}

RunFunction13(){
    MsgBox, toBeDone
}

RunFunction14(){
    MsgBox, toBeDone
}

RunFunction15(){
    MsgBox, toBeDone
}

SearchImage(b64Code, x1, y1, x2, y2) {
    image := "HBITMAP:*" . b64ToPng(b64Code)
    FoundX := ""
    FoundY := ""
    CoordMode, Pixel, Window ; Set coordinate mode for ImageSearch
    ErrorLevel := 0 ; Reset ErrorLevel before running the command

    ; Try searching for the image until it's found
    Loop,20 {
        ; Perform the image search
        ImageSearch, FoundX, FoundY, %x1%, %y1%, %x2%, %y2%, *50 %image%

        ; If the image is found, exit the loop
        if (ErrorLevel == 0) {
            return {x: FoundX, y: FoundY} ; Return coordinates as an object
        }

        ; If not found, wait for a moment and try again
        Sleep, 5 ; Wait half a second before trying again
    }
}

b64ToPng(B64) {
    hBitmap := 0

    If !DllCall("Crypt32.dll\CryptStringToBinary", "Ptr", &B64, "UInt", 0, "UInt", 0x01, "Ptr", 0, "UIntP", DecLen, "Ptr", 0, "Ptr", 0)
        Return False

    VarSetCapacity(Dec, DecLen, 0)
    If !DllCall("Crypt32.dll\CryptStringToBinary", "Ptr", &B64, "UInt", 0, "UInt", 0x01, "Ptr", &Dec, "UIntP", DecLen, "Ptr", 0, "Ptr", 0)
        Return False

    ; Bitmap creation adopted from "How to convert Image data (JPEG/PNG/GIF) to hBITMAP?" by SKAN
    ; -> http://www.autohotkey.com/board/topic/21213-how-to-convert-image-data-jpegpnggif-to-hbitmap/?p=139257
    hData := DllCall("Kernel32.dll\GlobalAlloc", "UInt", 2, "UPtr", DecLen, "UPtr")
    pData := DllCall("Kernel32.dll\GlobalLock", "Ptr", hData, "UPtr")
    DllCall("Kernel32.dll\RtlMoveMemory", "Ptr", pData, "Ptr", &Dec, "UPtr", DecLen)
    DllCall("Kernel32.dll\GlobalUnlock", "Ptr", hData)
    DllCall("Ole32.dll\CreateStreamOnHGlobal", "Ptr", hData, "Int", True, "PtrP", pStream)
    hGdip := DllCall("Kernel32.dll\LoadLibrary", "Str", "Gdiplus.dll", "UPtr")
    VarSetCapacity(SI, 16, 0), NumPut(1, SI, 0, "UChar")
    DllCall("Gdiplus.dll\GdiplusStartup", "PtrP", pToken, "Ptr", &SI, "Ptr", 0)
    DllCall("Gdiplus.dll\GdipCreateBitmapFromStream",  "Ptr", pStream, "PtrP", pBitmap)
    DllCall("Gdiplus.dll\GdipCreateHBITMAPFromBitmap", "Ptr", pBitmap, "PtrP", hBitmap, "UInt", 0)
    DllCall("Gdiplus.dll\GdipDisposeImage", "Ptr", pBitmap)
    DllCall("Gdiplus.dll\GdiplusShutdown", "Ptr", pToken)
    DllCall("Kernel32.dll\FreeLibrary", "Ptr", hGdip)
    DllCall(NumGet(NumGet(pStream + 0, 0, "UPtr") + (A_PtrSize * 2), 0, "UPtr"), "Ptr", pStream)
    Return hBitmap
}

capture2Text(xSt, ySt, xEnd, yEnd) {

    ; Configure coordinates relative to the active window
    CoordMode, Pixel, Window
    CoordMode, Mouse, Window

    ; Use the values provided as parameters
    x_start := xSt
    y_start := ySt
    x_end := xEnd
    y_end := yEnd

    ; Get the position of the active window
    WinGetPos, winX, winY, winWidth, winHeight, A

    ; Convert the coordinates to screen-relative
    abs_x_start := winX + x_start
    abs_y_start := winY + y_start
    abs_x_end := winX + x_end
    abs_y_end := winY + y_end

    ; Run Capture2Text with the adjusted coordinates
    RunWait, %capture2TextPath% %abs_x_start% %abs_y_start% %abs_x_end% %abs_y_end%
    savvyValue := clipboard

    return savvyValue
}
