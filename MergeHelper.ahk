#Persistent
#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

; Define an array with personalized function names
functionNames := ["Auto Bound", "Auto lvl30", "Auto Merge", "RightClickSpam", "ClickSpam", "Auto Rebirth", "Auto R-Feather into Seal Jade", "Auto Seal Jade", "Auto pet capture", "Function 10", "Function 11", "Function 12", "Function 13", "Function 14", "Function 15"]

; Set font color to white and background to black
Gui, Color, 000000  ; Set background color to black
Gui, Font, cWhite  ; Set text color to white

; Add radio buttons for the functions
Loop, 15
{
    Gui, Add, Radio, vFunction%A_Index% gRadioSelect w200, % functionNames[A_Index]
}

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
    }
}
Return

Reset:
    ; Reset the radio buttons and dropdowns
    Loop, 15
        GuiControl,, Function%A_Index%, 0

    GuiControl, Hide, DropdownLabel
    GuiControl, Hide, DropdownPosition
    GuiControl, Hide, DropdownLabelQty
    GuiControl, Hide, DropdownQty

    RunFunction(100)
Return

F5::
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

if (selectedFunction != "RightClickSpam" && selectedFunction != "ClickSpam" && selectedFunction != "Auto pet capture" && selectedFunction != "Auto Rebirth") {
    if (selectedPosition = "" || selectedQuantity = "") {
        MsgBox, Please select all required options before starting.
        Return
    }
    RunFunction(selectedFunction, selectedPosition, selectedQuantity)
} else {
    RunFunction(selectedFunction)
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

F7::
ExitApp
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
        MsgBox, To be done in the near future!
    }
    else if (functionName = "Function 11") {
        MsgBox, To be done in the near future!
    }
    else if (functionName = "Function 12") {
        MsgBox, To be done in the near future!
    }
    else if (functionName = "Function 13") {
        MsgBox, To be done in the near future!
    }
    else if (functionName = "Function 14") {
        MsgBox, To be done in the near future!
    }
    else if (functionName = "Function 15") {
        MsgBox, To be done in the near future!
    }
    else if(functionName = 100) {
        Pause, Off
        RunFunction1(100,100) ;
        RunFunction2(100,100) ;
        RunFunction3(100,100) ;
        RunFunction4(100) ;
        RunFunction5(100) ;
        RunFunction6(100) ;
        RunFunction7(100,100) ;
        RunFunction8(100,100) ;
        RunFunction9(100) ;
        RunFunction10(100) ;
        RunFunction11(100) ;
        RunFunction12(100) ;
        RunFunction13(100) ;
        RunFunction14(100) ;
        RunFunction15(100) ;
        MsgBox, All the functions stopped and program unpaused.
    }
    else {
        MsgBox, Function not found!
    }
}


RunFunction1(dropdownPosition, dropdownQuantity) {
    speed := 800 ; Default speed in milliseconds
    if(dropdownPosition = 100) {
        Return
    }
    
    repeatedCoordinates := []
    Coordinates := []
    
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
        dropdownPosition++     
    }
    MsgBox, Your pets are now bound!
}

RunFunction2(dropdownPosition, dropdownQuantity) {
    speed := 800 ; Default speed in milliseconds
    if(dropdownPosition = 100) {
        Return
    }

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

    if(dropdownPosition = 100) {
        Return
    }

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
    
    Send, {Click %x%, %y% ;
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
    MouseClickDrag, left, %x%, %y%, 400, 300
    Sleep, speed
    Send, {Click 400, 300} ;
    Sleep, speed    
    MouseClickDrag, left, %x2%, %y2%, 580, 300
    Sleep, speed
    Send, {Click 580, 300} ;
    Sleep, speed
    MouseMove, 984, 764
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
    }
    Send, {Click 234, 173} ;
    Sleep, speed
    MouseClickDrag, left, 715, 210, 460, 210
    Sleep, speed
    Send, {Click 425, 202} ;
    MsgBox, PetsMerged
}

RunFunction4(breaker := "") {
    if(breaker = 100) {
        Return
    }
    
    RightClickSpam()
}

RunFunction5(breaker := "") {
    if(breaker = 100) {
        Return
    }
    
    ClickSpam()
}

RunFunction6(breaker := "") {
    speed := 500 ;
    if(breaker = 100) {
        Return
    }
    Send, {Click 235, 145} ;
    Sleep, speed
    MouseMove, 940, 760
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

RunFunction7(dropdownPosition, dropdownQuantity) {
    if(dropdownPosition = 100) {
        Return
    }
    MsgBox, ToBeDone
}

RunFunction8(dropdownPosition, dropdownQuantity) {
    speed := 500 ;
    if(dropdownPosition = 100) {
        Return
    }
    Coordinates := []
    repeatedCoordinates := []

    repeatedCoordinates.push([91, 339]) ; Carry
    repeatedCoordinates.push([540, 390]) ; Pet Manager
    repeatedCoordinates.push([540, 390]) ; Pet Manager
    repeatedCoordinates.push([540, 390]) ; Pet Manager
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


RunFunction9(breaker := "") {
    global looper
    looper := 1  
    if (breaker == 100) {
        looper := 0
        return
    }
    MouseMove, 60, 60
    rightClickCount := 0
    while (looper == 1) {
        
        if (looper == 0) {
            break
        }
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




RunFunction10(breaker := ""){
    if(breaker = 100) {
        Return
    }
    MsgBox, toBeDone
}

RunFunction11(breaker := ""){
    if(breaker = 100) {
        Return
    }
    MsgBox, toBeDone
}
RunFunction12(breaker := ""){
    if(breaker = 100) {
        Return
    }
    MsgBox, toBeDone
}
RunFunction13(breaker := ""){
    if(breaker = 100) {
        Return
    }
    MsgBox, toBeDone
}
RunFunction14(breaker := ""){
    if(breaker = 100) {
        Return
    }
    MsgBox, toBeDone
}
RunFunction15(breaker := ""){
    if(breaker = 100) {
        Return
    }
    MsgBox, toBeDone
}