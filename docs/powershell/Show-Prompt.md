---
id: ps-show-prompt
title: 'Show-Prompt'
title_meta: 'Show-Prompt Command'
keywords: ['prompt', 'user', 'input', 'dialog']
description: 'Documentation for the Show-Prompt command to display a user prompt for input.'
tags: ['notification', 'windows']
draft: false
unlisted: false
---
## Description
A universal method of Notifying end users of events and other key pieces of information.

## Requirements
 - PowerShell V5
 - A Working Knowledge of this script, please reference all related ITGlue Documentation.

## Usage
1. Retrieve the user's current theme and add all necessary assemblies.
2. Determine and set Timeout setting if necessary.
3. Determine and set up Date/Time Selection if necessary.
4. Determine the type of message (Balloon, Popup, or CustomizedPopup).
    1. Balloon
        1. Display Balloon message with all passed parameters.
        2. Return
    2. Popup
        1. Determine the requested Theme.
        2. Determine if images are added to the item and add them.
        3. Set all additional parameters.
        4. Display the message on the user's screen.
    3. CustomizedPopup
        1. Determine if an image is added to the item.
        2. Set all additional parameters.
        3. Display the message on the user's screen.
5. Return the selected value from date/time selection if necessary.



Display a balloon message on the user’s screen for 7 seconds and holds that message in the notification tray for 15 seconds.
```powershell 
.\Show-Prompt.ps1 -Balloon -Message "Message" -Title "Title" -Icon Info -TitleIcon Information -Timeout 15
```
Display a pop-up box with an OK button at the bottom on a user’s screen. It has a 25 second timeout, and displays in a dark theme, has an embedded image in the message body with an Image set height of 100 and an Image set width of 300, with a title font size of 25, the message font size is set to 15.  There is a Date/Time selection dropdown box containing a list of dates and times in 30-minute increments for a duration of 4 days, and adds a title icon in the upper left corner of the popup.
```powershell
.\Show-Prompt.ps1 -Popup -Message "Message" -Title "Title" -ButtonType OK -Theme Dark -Timeout 25 -AddImage "https://SomeUrl.com/Some.png" -ImageMaxHeight 100 -ImageMaxWidth 300 -TitleFontSize 25 -MessageFontSize 15 -AddDateTimeSelection -IncrementMinutes 30 -DurationDays 4 -AddTitleIcon "https://SomeUrl.com/Some.png"
```
Display a pop-up with Purple filled title size 25 in yellow writing and a Green filled message box with size 12 sky blue writing, all text is in verdana font. There is an OK button at the bottom and the message remains open until ok is clicked. The message has a Date/Time selection dropdown box containing a list of dates and times in 30-minute increments for a duration of 4 days, and adds a title icon in the upper left corner of the popup.
```powershell
.\Show-Prompt.ps1 -CustomizedPopup -Message "Message" -Title "Title" -ButtonType OK -TitleFontSize 25 -TitleBackgroundColor "Purple" -TitleTextColor "Yellow" -MessageFontSize 12 -MessageBackgroundColor "Green" -MessageTextColor "SkyBlue" -TextFont "verdana" -AddDateTimeSelection -IncrementMinutes 30 -DurationDays 4 -AddTitleIcon "https://SomeUrl.com/Some.png"
```

## Parameters
| Parameter         | Alias | Required  | Default   | Type      | Description                               |
| ----------------- | ----- | --------- | --------- | --------- | ----------------------------------------- |
| `Baloon`          | N/A   | True      |           | Switch   | A parameter designed to determine if you are selecting a Balloon Message which is the initial part of the Balloon set parameters.      |
| `Popup`           | N/A   | True      |           | Switch | A parameter designed to determine if you are selecting a Pop-up Message which is the initial part of Popup set parameters.|
| `CustomizedPopup` | N/A   | True      |           | Switch | A parameter designed to determine if you are selecting a Pop-up Message which is the initial part of Custom set parameters.|
| `Message`         | N/A   | True      |           | String | This parameter is part of all three set parameters.  It is intended to hold the body message of the balloon or pop-up message.  |
| `Title`           | N/A   | True      |           | String | This parameter is part of all three set parameters.  It is intended to hold the title message of the balloon or popup message.|
| `Icon`            | N/A    | True      |           | String | This parameter is part of the balloon set of parameters.  It holds the icon present in the body of the balloon message.  It is a validate set of 'None', 'Info', 'Warning', and 'Error'.|
| `TitleIcon`       | N/A    | True      |           | String | This parameter is part of the balloon set of parameters.  It holds the icon present in the title section of the balloon message.  It is a validate set of 'Information', 'Error', 'Warning', 'Question'.|
| `ButtonType`       | N/A    | False      | `OK`  | String | This parameter is part of the custom and popup set of parameters.  It holds the type of button desired in the popup.  It is a validate set of 'OK', 'OK-Cancel', 'Abort-Retry-Ignore', 'Yes-No-Cancel', 'Yes-No', 'Retry-Cancel', 'Cancel-TryAgain-Continue', and 'None'.|
| `Theme`            | N/A    | False      | `None`  | String | This parameter is part of the popup set of parameters.  It holds the desired theme to apply to the popup.  It is a validate set of 'Proval', 'Dark', 'Light', and 'None'.|
| `Timeout`          | N/A    | False      | `15`    | Int    | This parameter is part of all three sets of parameters.  It holds the duration a balloon message or a popup stays up.  It has a default value of 15, and is in Seconds.|
| `AddImage`         | N/A    | False      |       | String | This parameter is part of the popup and custom sets of parameters.  It holds the web link to an image you wish to add to the popup.|
| `ImageMaxHeight`   |        | False      | `300` | Int   | This parameter holds the image max height. |
| `ImageMaxWidth`    |        | False      | `600` | Int   | This parameter holds the image max width.  |
| `CustomButtons`    | N/A    | False      |       | Array | This parameter is part of the custom set of parameters.  It holds an array of button names you wish to have on a popup.|
| `TitleFontSize`    | N/A    | False      |  `18` | Int | This parameter is part of the Popup and custom sets of parameters.  It holds the size of the title text.|
| `TitleBackgroundColor`  | N/A    | False      |  `Black` | String | This parameter is part of the custom set of parameters.  It holds the background color of the title section of the popup.  Please reference ITGlue documentation for color options reference. |
| `TitleTextColor`  | N/A    | False      |  `White` | String | This parameter is part of the custom set of parameters.  It holds the text color of the title section of the popup.  Please reference ITGlue documentation for color options reference. |
| `MessageFontSize`  | N/A    | False      |  `14` | Int | This parameter is part of the popup and custom sets of parameters.  It holds the size of the font for the message of the popup. |
| `MessageBackgroundColor`  | N/A    | False      |  `White` | String | This parameter is part of the custom set of parameters. It holds the color of the background in the message section of the popup.  Please reference ITGlue documentation for color options reference.|
| `MessageTextColor`  | N/A    | False      |  `Black` | String | This parameter is part of the custom set of parameters. It holds the color of the message text.  Please reference ITGlue documentation for color options reference.|
| `TextFont`  | N/A    | False      |  `Times New Roman` | String | This parameter is part of the custom set of parameters.  It holds the font face for the Popup.  Please reference ITGlue documentation for font options reference.|
| `AddDateTimeSelection`  | N/A    | False      |      | Switch | This parameter is part of the Popup and custom set of parameters.  It is a switch to toggle the addition of a date time selection in the popup or custom message box.|
| `IncrementMinutes`  | N/A    | False      |  `15`    | Int | This parameter is part of the Popup and custom set of parameters.  It should be set with the AddDateTimeSelection switch.  It holds the increment in minutes you would like displayed in your date/time selection dropdown.|
| `DurationDays`  | N/A    | False      |  `1`    | Int | This Parameter is part of the Popup and custom set of parameters.  It should be set with the AddDateTimeSelection switch.  It holds the duration of days the date time selection will increment through.|
| `CornerRadius`  | N/A     | False     |  `8`    | Int |  This parameter is part of the Popup and custom set of parameters, It sets the corner radius of the popup message.|
| `Layout`        |  N/A    | False     |  `Vertical`  |  String  | This parameter is part of the popup and custom set of parameters, It sets the message body layout to either horizontal or vertical.|
| `AddTitleIcon`  |  N/A    | False     |              |  String  | This parameter is part of the popup and custom set of parameters, it sets a web hosted image as a title bar icon in the upper left corner of the popup. |

## Output

    Non-Interactive (Balloon, or Just an OK button or no button with a timeout):
        As a Non interactive message there is no output from this script
    
    Interactive- Date/Time Selection
    System string containing Selected date/time in military format
    
    As an interactive message outputs from selected buttons are returned (future Dev)
    
    .\Show-Prompt-log.txt
  

