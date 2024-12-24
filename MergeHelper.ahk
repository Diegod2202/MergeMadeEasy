#Persistent
#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

; Define an array with personalized function names
functionNames := ["Auto Bound", "Auto lvl30", "Auto Merge", "RightClickSpam", "ClickSpam", "Auto Rebirth", "Auto R-Feather into Seal Jade", "Auto Seal Jade"]

; Add radio buttons for the 8 functions
Loop, 8
{
    Gui, Add, Radio, vFunction%A_Index% gRadioSelect w200, % functionNames[A_Index]
}

; Add dropdowns for position and quantity for all functions
Gui, Add, Text, x10 y+5 w200 vDropdownLabel, Select Position:
Gui, Add, DropDownList, x10 y+3 w200 vDropdownPosition, 1|2|3|4|5|6|7|8
Gui, Add, Text, x10 y+5 w200 vDropdownLabelQty, Select Quantity:
Gui, Add, DropDownList, x10 y+3 w200 vDropdownQty, 1|2|3|4|5|6|7|8

; Add key description labels with 10px spacing
Gui, Add, Text, x10 y+30 w300, CLICK Press F5 to start.`nPress F6 to pause the program.`nThe program will remain paused until F5 is pressed again.`nPress F7 to stop the program and exit the application.

; Add a Reset button
Gui, Add, Button, gReset, Reset

Gui, Show,, MergeHelper By: Diegod
Return

GuiClose:
ExitApp

RadioSelect:
Gui, Submit, NoHide
Loop, 8
{
    GuiControlGet, isChecked, , Function%A_Index%
    if (isChecked) {
        ; Show dropdowns for all functions except RightClickSpam and ClickSpam
        if (A_Index != 4 && A_Index != 5) {
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
    Loop, 8
        GuiControl,, Function%A_Index%, 0

    GuiControl, Hide, DropdownLabel
    GuiControl, Hide, DropdownPosition
    GuiControl, Hide, DropdownLabelQty
    GuiControl, Hide, DropdownQty
Return

; F5 to start the program
F5::
    Gui, Submit, NoHide
    selectedFunction := ""
    selectedPosition := ""
    selectedQuantity := ""

    Loop, 8
    {
        GuiControlGet, isChecked, , Function%A_Index%
        if (isChecked) {
            selectedFunction := functionNames[A_Index]
            GuiControlGet, selectedPosition, , DropdownPosition
            GuiControlGet, selectedQuantity, , DropdownQty
            break
        }
    }

    if (selectedFunction = "" || selectedPosition = "" || selectedQuantity = "") {
        MsgBox, Please select all required options before starting.
    } else {
        RunFunction(selectedFunction, selectedPosition, selectedQuantity)
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
        RunFunction6(dropdownPosition, dropdownQuantity)
    }
    else if (functionName = "Auto R-Feather into Seal Jade") {
        RunFunction7(dropdownPosition, dropdownQuantity)
    }
    else if (functionName = "Auto Seal Jade") {
        RunFunction8(dropdownPosition, dropdownQuantity)
    }
    else {
        MsgBox, Function not found!
    }
}

RunFunction1(dropdownPosition, dropdownQuantity) {
    speed := 800 ; Default speed in milliseconds

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
    coordinates.push([212, 229])
    coordinates.push([287, 219])
    coordinates.push([68, 271])
    coordinates.push([135, 279])
    coordinates.push([212, 279])
    coordinates.push([276, 270])

    ; Perform the click actions
    Loop, % coordinates.MaxIndex()
    {
        ; Access the x and y coordinates relative to the active window
        x := coordinates[A_Index][1]
        y := coordinates[A_Index][2]
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
    }

    MsgBox, Your 6 pets are now bound!
}

RunFunction2(dropdownPosition, dropdownQuantity) {
    speed := 800 ; Default speed in milliseconds

    repeatedCoordinates := []
    Coordinates := []
    
    repeatedcoordinates.push([100, 340])
    repeatedcoordinates.push([380, 712])
    repeatedcoordinates.push([182, 342])
    repeatedcoordinates.push([284, 553])
    
    coordinates.push([212, 229])
    coordinates.push([287, 219])
    coordinates.push([68, 271])
    coordinates.push([135, 279])
    coordinates.push([212, 279])
    coordinates.push([276, 270])

    ; Perform the click actions
    Loop, % coordinates.MaxIndex()
    {
        ; Access the x and y coordinates relative to the active window
        x := coordinates[A_Index][1]
        y := coordinates[A_Index][2]
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
    Send, {Click 143, 228} ;
    Sleep, speed
    Send, {Click 90, 340} ;
    Sleep, speed
    Send, {Click 234, 173} ;
    Sleep, speed
    MouseClickDrag, left, 460, 210, 360, 210
    Sleep, speed
    MouseClickDrag, left, 360, 210, 715, 210
    Sleep, speed
    Loop, dropdownQuantity
    {  
    MouseClickDrag, left, 138, 217, 400, 300
    Sleep, speed
    Send, {Click 400, 300} ;
    Sleep, speed    
    MouseClickDrag, left, 212, 225, 580, 300
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

RunFunction4() {
    RightClickSpam()
}

RunFunction5() {
    ClickSpam()
}

RunFunction6(dropdownPosition, dropdownQuantity) {
    speed := 500 ;
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
    MsgBox, ToBeDone
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

    repeatedcoordinates.push([91, 339]) ; Carry
    repeatedcoordinates.push([540, 390]) ; Pet Manager
    repeatedcoordinates.push([540, 390]) ; Pet Manager
    repeatedcoordinates.push([540, 390]) ; Pet Manager
    repeatedcoordinates.push([148, 359]) ; Pet Raising
    repeatedcoordinates.push([440, 400]) ; Pet window
    repeatedcoordinates.push([440, 320]) ; Seal spirit
    repeatedcoordinates.push([440, 320]) ; Seal spirit next window
    repeatedcoordinates.push([850, 400]) ; Ok
    repeatedcoordinates.push([850, 400]) ; Ok

    Loop, dropdownQuantity
        {
            x := Coordinates[dropdownPosition][1]
            y := Coordinates[ddropdownPosition][2]
            Send, {Click %x%, %y%} ;
            Sleep, speed
                Loop, % repeatedCoordinates.MaxIndex()
                    {
                    x := repeatedCoordinates[A_Index][1]
                    y := repeatedCoordinates[A_Index][2]
                    Send, {Click %x%, %y%} ;
                    Sleep, speed
                    }
        }
    
    
}

