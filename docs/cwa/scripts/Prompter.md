---
id: 'd8a124df-ea81-4194-82fc-a082c7a036d8'
title: 'Prompter Application Script for Automate'
title_meta: 'Prompter Application Script for Automate'
keywords: ['prompter', 'script', 'automate', 'user-input', 'date-time', 'header', 'icon']
description: 'This document outlines the usage of the Prompter application script in ConnectWise Automate, detailing its functionality to present prompts on the desktop with customizable options including date and time pickers, buttons, and header images.'
tags: ['application']
draft: false
unlisted: false
---
## Summary

This Automate script will execute the [Prompter](https://proval.itglue.com/DOC-5078775-10224100) application. Prompter is a simple application designed to present a prompt on the desktop and optionally display a date and time picker. It supports any number of buttons, as well as optional header images and custom application icons.

## Sample Run

This script is a function script and should not be manually executed. Utilize the [CWM - Automate - Script - Prompter - Template](https://proval.itglue.com/DOC-5078775-10239151) to get a copy of all potential variables and paste the else section into any script that should use Prompter.

## Dependencies

- [Prompter](https://proval.itglue.com/DOC-5078775-10224100)
- [CWM - Automate - Script - Prompter - Template](https://proval.itglue.com/DOC-5078775-10239151)

## Variables

| Name                  | Description                                                                                                                                              |
|-----------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------|
| Message               | Holds the desired message for Prompter.                                                                                                                |
| DateTimeSelector      | Toggles a date/time selection in the Prompter pop-up (True or False).                                                                                 |
| Icon                  | Holds the local path and file or URL to a desired pop-up Icon.                                                                                         |
| HeaderImage           | Holds the local path and file or URL to a desired pop-up header image. This should be the name of the file in the /Transfer/App directory of the LTShare when @LTShareDownload@ is set to 1. i.e.: header-image.jpg |
| Title                 | Holds the desired Title Text for the Prompter pop-up.                                                                                                   |
| Buttons               | Holds the desired button options for the Prompter pop-up (space separated values, quotes around multi word buttons).                                     |
| Timeout               | The duration of time you wish the Prompter pop-up to remain on the user's screen before auto closing.                                                  |
| PrompterResults       | The User returned results after executing Prompter.                                                                                                     |
| LTShareDownload       | Use the LTShare to download Prompter and header images. Requires the Prompter.exe and desired header images to be in the /Transfer/App directory of the LTShare. |
| TwelveHour            | Changes the display of time in the Date/Time selector to 12-hour.                                                                                       |
| Theme                 | Sets the theme for Prompter. If omitted, the theme will use the default Windows theme. Options are "Dark" and "Light".                                  |
| DateTimeFromHours     | Stores the number of hours to add to the current time in order to set the starting point for the Date/Time selector.                                     |
| DateTimeToHours       | Stores the number of hours to add to the initial time in the Date/Time selector in order to display the last available option to select.                 |
| HTMLMessage           | Set this to true to enable the HTML Decoding of the Message.                                                                                            |
| UserInput             | Set this to true to enable the user input field.                                                                                                       |
| userinputtext         | Set initial/help text for the user input field.                                                                                                        |
| selectedButton        | Button Selected by the user.                                                                                                                            |
| dateTimeSelection     | Date Time selected by the user.                                                                                                                         |
| userResponse          | Input/Feedback provided by the user in the User Input Field.                                                                                            |

## Output

- Script Variable











