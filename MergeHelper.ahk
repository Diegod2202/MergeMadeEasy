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

RunFunction7(dropdownPosition="", dropdownQuantity="") {

    Coordinates := []

    Coordinates.push([68, 229]) ; 1
    Coordinates.push([135, 219]) ; 2
    Coordinates.push([212, 229]) ; 3
    Coordinates.push([287, 219]) ; 4
    Coordinates.push([68, 271]) ; 5
    Coordinates.push([135, 279]) ; 6
    Coordinates.push([212, 279]) ; 7
    Coordinates.push([276, 270]) ; 8

    if(dropdownPosition = "") {
        InitialPosition := 1
    }Else{
        InitialPosition := dropdownPosition
    }

    x := coordinates[InitialPosition][1]
    y := coordinates[InitialPosition][2]

    if(dropdownQuantity != "") {
        Quantity := dropdownQuantity
    }

    b64ImageMinoEgg:= "iVBORw0KGgoAAAANSUhEUgAAABMAAAARCAYAAAA/mJfHAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAHSSURBVDhPhdAxSBtRHMfxAw0EBHEqSidHx04FoUNdpI4BQQSXhk6BLqKL7VQJFboJKQg6RGpAsGIkSqWKCIougcbSDlqdLN0yWAhI4Ofv99698z2NOny4u3d33/u/i6bGBlD6OIJGLQvU93F1Om3gdNK6KHK9ClyeWX/yRqOaNY7XxvBpIoOZ10OIFMI5X2ZIFDXh2pCl4O1YbTSJyersCHKvBhAdr78NYpoqiLnJ/pWtFjFNV3qXQWRC1Lz4Eki26MTbaxWT/cIoYyfjMGq5UPwR4+cb4AendU6mgN98x1Pf4D9T6OowA2z3hxRwjgaBQ27ZuS+m0P/KM6DcexPS+U5fGNvhM6KYplPkaDhxN+ZTTBHHn0y+Pwe+9iTsNvd4sZIGljtD6x3AAaMJxp3dp3ymK1AvdMWxTS0wUORRdL79JKSA8433F/kxj40ppOAWpyvzhujcRTThcsR1UsRRZD6VuImJAr7HYtqeQgWuk41t8cJZo1JshTYesBSq5P2YQgueOVqkViG5FRt/kbKxZoULfsjFWgW1rTx5oep0GzLdkY019E/ui4nbsguRAi6Ue5mOYwpRky/58NmjZ+Ipfn1oM/6+TxvF4RR62iNkuyNcAzoEov6dEnO4AAAAAElFTkSuQmCC"
    coords := SearchImage(b64ImageMinoEgg)

    if (coords) {
        MouseMove, coords.x, coords.y
    } else {
        MsgBox "No coordinates found."
    }

    ; Make sure Capture2Text is configured
    if (capture2TextPath = "") {
        MsgBox, Please select the Capture2Text path first.
        Return
    }

    ; Configure coordinates relative to the active window
    CoordMode, Pixel, Window
    CoordMode, Mouse, Window

    ; Coordinates relative to the window
    x_start := 618
    y_start := 217
    x_end := 653
    y_end := 232

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

    MsgBox, %savvyValue%

}

SearchImage(b64Code) {
    image := "HBITMAP:*" . b64ToPng(b64Code)
    FoundX := ""
    FoundY := ""
    CoordMode, Pixel, Window ; Set coordinate mode for ImageSearch
    ErrorLevel := 0 ; Reset ErrorLevel before running the command

    ; Try searching for the image until it's found
    Loop {
        ; Perform the image search
        ImageSearch, FoundX, FoundY, 700, 200, 1000, 780, %image%

        ; If the image is found, exit the loop
        if (ErrorLevel == 0) {
            return {x: FoundX, y: FoundY} ; Return coordinates as an object
        }

        ; If not found, wait for a moment and try again
        Sleep, 500 ; Wait half a second before trying again
    }
}

b64ToPng(B64, NewHandle := False) {
    Static hBitmap := 0
    If (NewHandle)
        hBitmap := 0
    If (hBitmap)
        Return hBitmap
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

