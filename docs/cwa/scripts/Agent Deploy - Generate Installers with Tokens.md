---
id: 'cf4fb3ae-3228-4621-be94-467b16f97090'
title: 'Create URL for Automate Agent Installer with Tokens'
title_meta: 'Create URL for Automate Agent Installer with Tokens'
keywords: ['url', 'automate', 'installer', 'tokens', 'email', 'windows', 'mac', 'linux']
description: 'This document provides a detailed guide on creating a URL for the Automate Agent installer for various operating systems, including Windows MSI, MAC, and Linux. It includes user parameters, output details, and installation commands for each platform, along with a sample run and email outputs.'
tags: ['installation', 'email', 'windows', 'mac', 'linux', 'token', 'url']
draft: false
unlisted: false
---
## Summary

A special thanks to Chuck Fowler for creating the script!

This script is designed to create URL for operating systems like Windows MSI, MAC and Linux for Automate Agent installer with Tokens. The URL will be location specific and has expiration and emailing feature. The script will send the details of the installer along with installation commands for Windows MSI, MAC, and other details. This takes input for Location, count of months up to which this token will be valid, and email address.

## Sample Run

![Sample Run](../../../static/img/Agent-Deploy---Generate-Installers-with-Tokens/image_1.png)

#### User Parameters

| Name               | Example              | Required | Description                                                                                   |
|--------------------|----------------------|----------|-----------------------------------------------------------------------------------------------|
| # Months Valid     | 2                    | False    | The number of months up to which token should be valid. If left blank, the default is 1.    |
| TargetLocationID   | 34                   | False    | Enter alternative LocationID. If left blank, it will be the default Location where the script was executed from. |
| Email              | [abc@domain.com](mailto:abc@domain.com) | True     | The email address on which you want to receive the Token and URL.                            |

## Output

- Script log
- Email

## Sample Email:

![Sample Email 1](../../../static/img/Agent-Deploy---Generate-Installers-with-Tokens/image_2.png)
![Sample Email 2](../../../static/img/Agent-Deploy---Generate-Installers-with-Tokens/image_3.png)

## How to use the installation commands

The email will contain MSI, Linux and MAC installer URLs along with the detail of expiration date of the token.

1. To install Agent manually:
   - Copy the required installed URL shown in Box 1 from the email you received.
   - Paste it in browser and download the file.
   - Run the file manually using admin rights.

2. To install Agent using PowerShell:
   - Open PowerShell with Administrative Rights.
   - Copy the command mentioned under headline "Deployment PowerShell (Run-as-Admin)" (Command mentioned in Box 2) from the email you received.
   - Press enter. The deployment process will start. Wait for the command to finish.
   - You will receive a message saying: The Automate Agent Has Been Successfully Installed.

3. To install Agent using Command Prompt:
   - Open Command Prompt with Administrative Rights.
   - Copy the command mentioned under headline "Deployment CMD (Run-as-Admin)" (Command mentioned in Box 3) from the email you received.
   - Press enter. The deployment process will start. Wait for the command to finish.
   - You will receive a message saying: The Automate Agent Has Been Successfully Installed.

4. To install Agent through ScreenConnect:
   - This option can be used only in the case when the machine is Online in ScreenConnect portal.
   - Search for the machine and navigate to the Commands tab as shown in below screenshot:
     ![ScreenConnect Commands](../../../static/img/Agent-Deploy---Generate-Installers-with-Tokens/image_4.png)
   - Copy the command mentioned under headline "ScreenConnect" (Command mentioned in Box 4) from the email you received.
   - Click on the "Run Command" icon. The deployment process will start. Wait for the command to finish.
   - You will receive a message saying: The Automate Agent Has Been Successfully Installed.

5. To install Agent on MAC:
   - Open Terminal as Root.
   - Copy the command mentioned under headline "Deployment PowerShell (Run-as-Admin)" (Command mentioned in Box 5) from the email you received.
   - Press enter. The deployment process will start. Wait for the command to finish.
   - You will receive a message saying: The Automate Agent Has Been Successfully Installed.






