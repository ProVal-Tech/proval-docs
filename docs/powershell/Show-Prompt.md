---
id: '9fc4a21d-6ba4-4f20-90fd-b9c148259195'
title: 'Show-Prompt'
title_meta: 'Show-Prompt'
keywords: ['prompt', 'user', 'input', 'dialog']
description: 'Documentation for the Show-Prompt command to display a user prompt for input.'
tags: ['windows']
draft: false
unlisted: false
---

## Description
A universal method of notifying end users of events and other key pieces of information.

## Requirements
- PowerShell V5
- A working knowledge of this script; please reference all related ITGlue documentation.

## Usage
1. Retrieve the user's current theme and add all necessary assemblies.
2. Determine and set the timeout setting if necessary.
3. Determine and set up date/time selection if necessary.
4. Determine the type of message (Balloon, Popup, or CustomizedPopup).
    1. **Balloon**
        1. Display a balloon message with all passed parameters.
        2. Return.
    2. **Popup**
        1. Determine the requested theme.
        2. Determine if images are added to the item and add them.
        3. Set all additional parameters.
        4. Display the message on the user's screen.
    3. **CustomizedPopup**
        1. Determine if an image is added to the item.
        2. Set all additional parameters.
        3. Display the message on the user's screen.
5. Return the selected value from the date/time selection if necessary.

Display a balloon message on the user’s screen for 7 seconds and hold that message in the notification tray for 15 seconds.

```powershell
.\Show-Prompt.ps1 -Balloon -Message "Message" -Title "Title" -Icon Info -TitleIcon Information -Timeout 15
```

Display a pop-up box with an OK button at the bottom on a user’s screen. It has a 25-second timeout, displays in a dark theme, has an embedded image in the message body with an image set height of 100 and an image set width of 300, with a title font size of 25, and the message font size is set to 15. There is a date/time selection dropdown box containing a list of dates and times in 30-minute increments for a duration of 4 days, and it adds a title icon in the upper left corner of the popup.

```powershell
.\Show-Prompt.ps1 -Popup -Message "Message" -Title "Title" -ButtonType OK -Theme Dark -Timeout 25 -AddImage "https://SomeUrl.com/Some.png" -ImageMaxHeight 100 -ImageMaxWidth 300 -TitleFontSize 25 -MessageFontSize 15 -AddDateTimeSelection -IncrementMinutes 30 -DurationDays 4 -AddTitleIcon "https://SomeUrl.com/Some.png"
```

Display a pop-up with a purple filled title size 25 in yellow writing and a green filled message box with size 12 sky blue writing. All text is in Verdana font. There is an OK button at the bottom, and the message remains open until OK is clicked. The message has a date/time selection dropdown box containing a list of dates and times in 30-minute increments for a duration of 4 days, and it adds a title icon in the upper left corner of the popup.

```powershell
.\Show-Prompt.ps1 -CustomizedPopup -Message "Message" -Title "Title" -ButtonType OK -TitleFontSize 25 -TitleBackgroundColor "Purple" -TitleTextColor "Yellow" -MessageFontSize 12 -MessageBackgroundColor "Green" -MessageTextColor "SkyBlue" -TextFont "Verdana" -AddDateTimeSelection -IncrementMinutes 30 -DurationDays 4 -AddTitleIcon "https://SomeUrl.com/Some.png"
```

## Parameters
| Parameter          | Alias | Required | Default   | Type    | Description                                                                                               |
|--------------------|-------|----------|-----------|---------|-----------------------------------------------------------------------------------------------------------|
| `Balloon`          | N/A   | True     |           | Switch  | A parameter designed to determine if you are selecting a balloon message, which is the initial part of the balloon set parameters. |
| `Popup`            | N/A   | True     |           | Switch  | A parameter designed to determine if you are selecting a pop-up message, which is the initial part of the popup set parameters. |
| `CustomizedPopup`  | N/A   | True     |           | Switch  | A parameter designed to determine if you are selecting a customized pop-up message, which is the initial part of the custom set parameters. |
| `Message`          | N/A   | True     |           | String  | This parameter is part of all three set parameters. It is intended to hold the body message of the balloon or pop-up message. |
| `Title`            | N/A   | True     |           | String  | This parameter is part of all three set parameters. It is intended to hold the title message of the balloon or pop-up message. |
| `Icon`             | N/A   | True     |           | String  | This parameter is part of the balloon set of parameters. It holds the icon present in the body of the balloon message. It is a validated set of 'None', 'Info', 'Warning', and 'Error'. |
| `TitleIcon`        | N/A   | True     |           | String  | This parameter is part of the balloon set of parameters. It holds the icon present in the title section of the balloon message. It is a validated set of 'Information', 'Error', 'Warning', 'Question'. |
| `ButtonType`       | N/A   | False    | `OK`      | String  | This parameter is part of the custom and popup set of parameters. It holds the type of button desired in the popup. It is a validated set of 'OK', 'OK-Cancel', 'Abort-Retry-Ignore', 'Yes-No-Cancel', 'Yes-No', 'Retry-Cancel', 'Cancel-TryAgain-Continue', and 'None'. |
| `Theme`            | N/A   | False    | `None`    | String  | This parameter is part of the popup set of parameters. It holds the desired theme to apply to the popup. It is a validated set of 'Proval', 'Dark', 'Light', and 'None'. |
| `Timeout`          | N/A   | False    | `15`      | Int     | This parameter is part of all three sets of parameters. It holds the duration a balloon message or a popup stays up. It has a default value of 15 seconds. |
| `AddImage`         | N/A   | False    |           | String  | This parameter is part of the popup and custom sets of parameters. It holds the web link to an image you wish to add to the popup. |
| `ImageMaxHeight`   |       | False    | `300`     | Int     | This parameter holds the maximum height of the image. |
| `ImageMaxWidth`    |       | False    | `600`     | Int     | This parameter holds the maximum width of the image. |
| `CustomButtons`    | N/A   | False    |           | Array   | This parameter is part of the custom set of parameters. It holds an array of button names you wish to have on a popup. |
| `TitleFontSize`    | N/A   | False    | `18`      | Int     | This parameter is part of the popup and custom sets of parameters. It holds the size of the title text. |
| `TitleBackgroundColor` | N/A | False  | `Black`   | String  | This parameter is part of the custom set of parameters. It holds the background color of the title section of the popup. Please reference ITGlue documentation for color options. |
| `TitleTextColor`   | N/A   | False    | `White`   | String  | This parameter is part of the custom set of parameters. It holds the text color of the title section of the popup. Please reference ITGlue documentation for color options. |
| `MessageFontSize`  | N/A   | False    | `14`      | Int     | This parameter is part of the popup and custom sets of parameters. It holds the size of the font for the message of the popup. |
| `MessageBackgroundColor` | N/A | False | `White`   | String  | This parameter is part of the custom set of parameters. It holds the color of the background in the message section of the popup. Please reference ITGlue documentation for color options. |
| `MessageTextColor` | N/A   | False    | `Black`   | String  | This parameter is part of the custom set of parameters. It holds the color of the message text. Please reference ITGlue documentation for color options. |
| `TextFont`         | N/A   | False    | `Times New Roman` | String | This parameter is part of the custom set of parameters. It holds the font face for the popup. Please reference ITGlue documentation for font options. |
| `AddDateTimeSelection` | N/A | False  |           | Switch  | This parameter is part of the popup and custom set of parameters. It is a switch to toggle the addition of a date/time selection in the popup or custom message box. |
| `IncrementMinutes` | N/A   | False    | `15`      | Int     | This parameter is part of the popup and custom set of parameters. It should be set with the AddDateTimeSelection switch. It holds the increment in minutes you would like displayed in your date/time selection dropdown. |
| `DurationDays`     | N/A   | False    | `1`       | Int     | This parameter is part of the popup and custom set of parameters. It should be set with the AddDateTimeSelection switch. It holds the duration of days the date/time selection will increment through. |
| `CornerRadius`     | N/A   | False    | `8`       | Int     | This parameter is part of the popup and custom set of parameters. It sets the corner radius of the popup message. |
| `Layout`           | N/A   | False    | `Vertical` | String | This parameter is part of the popup and custom set of parameters. It sets the message body layout to either horizontal or vertical. |
| `AddTitleIcon`     | N/A   | False    |           | String  | This parameter is part of the popup and custom set of parameters. It sets a web-hosted image as a title bar icon in the upper left corner of the popup. |

## Output

- **Non-Interactive** (Balloon, or just an OK button or no button with a timeout):  
  As a non-interactive message, there is no output from this script.

- **Interactive - Date/Time Selection**  
  System string containing the selected date/time in military format.

- As an interactive message, outputs from selected buttons are returned (future development).

- `.\Show-Prompt-log.txt`



