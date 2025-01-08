---
id: 'cwa-prompter-template'
title: 'Prompter - Template for Client Use'
title_meta: 'Prompter - Template for Client Use'
keywords: ['template', 'prompter', 'script', 'message', 'client']
description: 'This document provides a template for clients to set up prompter messages in ConnectWise Automate. It includes recommended steps for using the template, dependencies, and a detailed explanation of the variables utilized in the prompter script.'
tags: ['configuration', 'script', 'setup', 'notification', 'windows']
draft: false
unlisted: false
---
## Summary

This is a copy only template for clients to use to set up prompter messages.

## Sample Run

This Script is not intended to be run, it is intended to be a template that can be copied to any script that a prompter message is desired.

## Use Case

Recommended steps to use Prompter:
1. Open the Prompter - Template in ConnectWise Automate.
2. Select all lines in the ELSE section of that script.
3. Paste these lines in any script where a Prompter message is desired.
4. Enable any required lines and set the desired values; at a minimum, the `@Message@` variable must be set.
5. Enable the RUN SCRIPT Line (Line 13 in the Template ELSE section) in your new script.

**NOTE:** The Then Section of this script is intentionally left blank.

## Dependencies

- [Prompter](https://proval.itglue.com/DOC-5078775-10224100)
- [CWM - Automate - Script - Prompter](https://proval.itglue.com/DOC-5078775-10243074)

## Variables

These variables are used in the prompter script. They should be set in any script calling Prompter - Template.

| Name               | Description                                                                                              |
|--------------------|----------------------------------------------------------------------------------------------------------|
| Message            | Holds the desired message for Prompter.                                                                 |
| DateTimeSelector    | Toggles a date/time selection in the Prompter pop-up (True or False).                                   |
| Icon               | Holds the local path and file or URL to a desired pop-up Icon.                                         |
| HeaderImage        | Holds the local path and file or URL to a desired pop-up header image. This should be the name of the file in the /Transfer/App directory of the LTShare when `@LTShareDownload@` is set to 1. i.e.: header-image.jpg |
| Title              | Holds the desired Title Text for the Prompter pop-up.                                                  |
| Buttons            | Holds the desired button options for the Prompter pop-up (space separated values, quotes around multi word buttons). |
| Timeout            | The duration of time you wish the Prompter pop-up to remain on the user's screen before auto closing.  |
| PrompterResults    | The User returned results after executing Prompter.                                                    |
| LTShareDownload    | Use the LTShare to download Prompter and header images. Requires the Prompter.exe and desired header images to be in the /Transfer/App directory of the LTShare. |
| TwelveHour         | Changes the display of time in the Date/Time selector to 12-hour.                                      |
| Theme              | Sets the theme for Prompter. If omitted, the theme will use the default Windows theme. Options are "Dark" and "Light". |
| DateTimeFromHours  | Stores the number of hours to add to the current time in order to set the starting point for the Date/Time selector. |
| DateTimeToHours    | Stores the number of hours to add to the initial time in the Date/Time selector in order to display the last available option to select. |
| HTMLMessage        | Set this to true to enable the HTML Decoding of the Message.                                           |
| UserInput          | Set this to true to enable the user input field.                                                        |
| userinputtext      | Set initial/help text for the user input field.                                                         |
| selectedButton     | Button Selected by the user.                                                                             |
| dateTimeSelection   | Date Time selected by the user.                                                                          |
| userResponse       | Input/Feedback provided by the user in the User Input Field.                                            |

