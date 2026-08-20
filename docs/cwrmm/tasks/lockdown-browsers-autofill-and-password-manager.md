---
id: '4f425877-0d14-4135-b2d7-0e640af52851'
slug: /4f425877-0d14-4135-b2d7-0e640af52851
title: 'Lockdown Browsers Autofill and Password Manager'
title_meta: 'Lockdown Browsers Autofill and Password Manager'
keywords: ['browsers', 'autofill', 'passwords', 'security', 'edge', 'chrome', 'firefox', 'brave']
description: 'This document describes a script that disables the password manager and autofill features for Edge, Chrome, Brave, and Firefox browsers. It also provides instructions on how to clear saved passwords and disable Edge Wallet, ensuring enhanced security and privacy for users.'
tags: ['browsers', 'security', 'setup', 'uninstallation']
draft: false
unlisted: false
last_update:
  date: 2025-05-12
---

## Summary

The script can disable the password manager and autofill address and credit card information for the Edge, Chrome, Brave, and Firefox browsers. Moreover, it can delete the saved passwords, but it will forcefully close the browsers. Microsoft Edge will also be closed if the script is used to disable the Edge Wallet.

## Lockdown Browsers Password Manager

It's important to know that for browsers based on Chromium (like Google Chrome, Microsoft Edge, and Brave), turning off the Password Manager won't stop the Autofill (or Sign in Automatically) feature. If Autofill (or Sign in Automatically) is enabled and there are saved passwords, it will still automatically fill in credentials for websites. However, if the Password Manager is disabled, new passwords won't be saved, and the browser won't ask to store passwords. The saved passwords will still work.

For Firefox, turning off the Password Manager will also disable Autofill.

**Affected Setting for Google Chrome:**  
![Google Chrome Setting](../../../static/img/docs/4f425877-0d14-4135-b2d7-0e640af52851/image_1.webp)

**Affected Setting for Brave:**  
![Brave Setting](../../../static/img/docs/4f425877-0d14-4135-b2d7-0e640af52851/image_2.webp)

**Affected Settings for Microsoft Edge:**  
![Microsoft Edge Setting](../../../static/img/docs/4f425877-0d14-4135-b2d7-0e640af52851/image_3.webp)

**Affected Settings for Mozilla Firefox:**  
![Mozilla Firefox Setting](../../../static/img/docs/4f425877-0d14-4135-b2d7-0e640af52851/image_4.webp)

**Note:**

- The changes will only take effect once the browser is restarted if it's currently open. In certain situations, especially for Microsoft Edge, the user might need to restart the entire computer for the changes to take effect.

## Lockdown Chromium Browsers Credit Card Autofill

**Affected Setting for Google Chrome:**  
![Google Chrome Credit Card Setting](../../../static/img/docs/4f425877-0d14-4135-b2d7-0e640af52851/image_5.webp)

**Affected Settings for Microsoft Edge:**  
![Microsoft Edge Credit Card Setting](../../../static/img/docs/4f425877-0d14-4135-b2d7-0e640af52851/image_6.webp)

**Affected Setting for Brave:**  
![Brave Credit Card Setting](../../../static/img/docs/4f425877-0d14-4135-b2d7-0e640af52851/image_7.webp)

**Note:**

- The changes will only take effect once the browser is restarted if it's currently open.

## Lockdown Chromium Browsers Address Autofill

**Affected Setting for Google Chrome:**  
![Google Chrome Address Setting](../../../static/img/docs/4f425877-0d14-4135-b2d7-0e640af52851/image_8.webp)

**Affected Settings for Microsoft Edge:**  
![Microsoft Edge Address Setting](../../../static/img/docs/4f425877-0d14-4135-b2d7-0e640af52851/image_9.webp)

**Affected Setting for Brave:**  
![Brave Address Setting](../../../static/img/docs/4f425877-0d14-4135-b2d7-0e640af52851/image_10.webp)

**Note:**

- The changes will only take effect once the browser is restarted if it's currently open.

## Clear Browsers Saved Passwords

The task is designed to remove saved passwords from the following browsers:

- Google Chrome
- Microsoft Edge
- Brave
- Mozilla Firefox

**Note:**  

- If any of these browsers are running, they will be forcefully closed.

## Disable Edge Wallet

The task can disable the sync between Edge Wallet and the cloud. It should be disabled to remove the saved passwords from Microsoft Edge.  
![Edge Wallet](../../../static/img/docs/4f425877-0d14-4135-b2d7-0e640af52851/image_11.webp)

**Note:**  

- If Microsoft Edge is running, it will be forcefully closed.

## Sample Run

![Sample Run 1](../../../static/img/docs/4f425877-0d14-4135-b2d7-0e640af52851/image_12.webp)  
![Sample Run 2](../../../static/img/docs/4f425877-0d14-4135-b2d7-0e640af52851/image_13.webp)  
![Sample Run 3](../../../static/img/docs/4f425877-0d14-4135-b2d7-0e640af52851/image_14.webp)  

## User Parameters

| Name                     | Example                     | Accepted Values                                   | Default | Type  | Required | Description                                                          |
|--------------------------|-----------------------------|---------------------------------------------------|---------|-------|----------|----------------------------------------------------------------------|
| Browser                  | Chrome, Edge, Firefox       | Chrome, Edge, Firefox, Brave, All                 | All     | Text  | False    | Name of the Browser(s) to apply the changes for.                   |
| DisablePasswordManager    | True                        | True or False                                     | True    | Text  | False    | Set this value to false to NOT disable the password manager for the browser(s). |
| DisableAutofillAddress   | True                        | True or False                                     | True    | Text  | False    | Set this value to false to NOT disable the autofilling of addresses for the browser(s). |
| DisableAutofillCreditCard | True                        | True or False                                     | True    | Text  | False    | Set this value to false to NOT disable the autofilling of credit card details for the browser(s). |
| RemoveSavedPassword       | False                       | True or False                                     | False   | Text  | False    | Setting this to true will remove the saved passwords from the browser(s). Browser(s) will be forcefully closed if they are running. |
| DisableEdgeWallet         | False                       | True or False                                     | False   | Text  | False    | Setting this to true will disable the Microsoft Edge Wallet's sync. Microsoft Edge will be forcefully closed if it is running. It is mandatory to set this parameter to True to remove the saved password from Microsoft Edge. |

![User Parameters](../../../static/img/docs/4f425877-0d14-4135-b2d7-0e640af52851/image_15.webp)

## Task Creation

Create a new `Script Editor` style script in the system to implement this Task.  
![Create Script](../../../static/img/docs/4f425877-0d14-4135-b2d7-0e640af52851/image_16.webp)  
![Create Script Step 2](../../../static/img/docs/4f425877-0d14-4135-b2d7-0e640af52851/image_17.webp)

**Name:** Lockdown Browsers Autofill and Password Manager  
**Description:** The script can disable the password manager and autofill address and credit card information for the Edge, Chrome, Brave, and Firefox browsers. Moreover, it can delete the saved passwords, but it will forcefully close the browsers. Microsoft Edge will also be closed if the script is used to disable the Edge Wallet.  
**Category:** Application  
![Category](../../../static/img/docs/4f425877-0d14-4135-b2d7-0e640af52851/image_18.webp)

## Parameters

### Browsers

Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.  
![Add Parameter](../../../static/img/docs/4f425877-0d14-4135-b2d7-0e640af52851/image_19.webp)

This screen will appear.  
![Parameter Screen](../../../static/img/docs/4f425877-0d14-4135-b2d7-0e640af52851/image_20.webp)

- Set `Browser` in the `Parameter Name` field.
- Select `Text String` from the `Parameter Type` dropdown menu.
- Enable the `Default Value` button.
- Set `All` in the `Default Value` field.
- Click the `Save` button.

![Save Parameter](../../../static/img/docs/4f425877-0d14-4135-b2d7-0e640af52851/image_21.webp)

Create the rest of the parameters described in the `User Parameters` section of the document in the same way.

### DisablePasswordManager:
![Disable Password Manager](../../../static/img/docs/4f425877-0d14-4135-b2d7-0e640af52851/image_22.webp)

### DisableAutofillAddress:
![Disable Autofill Address](../../../static/img/docs/4f425877-0d14-4135-b2d7-0e640af52851/image_23.webp)

### DisableAutofillCreditCard:
![Disable Autofill Credit Card](../../../static/img/docs/4f425877-0d14-4135-b2d7-0e640af52851/image_24.webp)

### RemoveSavedPassword:
![Remove Saved Password](../../../static/img/docs/4f425877-0d14-4135-b2d7-0e640af52851/image_25.webp)

### DisableEdgeWallet:
![Disable Edge Wallet](../../../static/img/docs/4f425877-0d14-4135-b2d7-0e640af52851/image_26.webp)

## Task

Navigate to the Script Editor Section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.  
![Add Row](../../../static/img/docs/4f425877-0d14-4135-b2d7-0e640af52851/image_27.webp)

A blank function will appear.  
![Blank Function](../../../static/img/docs/4f425877-0d14-4135-b2d7-0e640af52851/image_28.webp)

Search and select the `PowerShell Script` function.  
![PowerShell Script](../../../static/img/docs/4f425877-0d14-4135-b2d7-0e640af52851/image_29.webp)  
![PowerShell Script Step 2](../../../static/img/docs/4f425877-0d14-4135-b2d7-0e640af52851/image_30.webp)

The following function will pop up on the screen:  
![PowerShell Function](../../../static/img/docs/4f425877-0d14-4135-b2d7-0e640af52851/image_31.webp)

Paste in the following PowerShell script and set the expected time of script execution to `900` seconds. Click the `Save` button.

[PowerShell Script](https://github.com/ProVal-Tech/cw-rmm/blob/main/tasks/lockdown-browsers-autofill-and-password-manager/script.ps1)



![Script Execution](../../../static/img/docs/4f425877-0d14-4135-b2d7-0e640af52851/image_32.webp)

### Row 2 Function: Script Log

Add a new row by clicking the `Add Row` button.  
![Add Row for Log](../../../static/img/docs/4f425877-0d14-4135-b2d7-0e640af52851/image_33.webp)

A blank function will appear.  
![Blank Function for Log](../../../static/img/docs/4f425877-0d14-4135-b2d7-0e640af52851/image_34.webp)

Search and select the `Script Log` function.  
![Script Log Function](../../../static/img/docs/4f425877-0d14-4135-b2d7-0e640af52851/image_35.webp)

The following function will pop up on the screen:  
![Script Log Pop Up](../../../static/img/docs/4f425877-0d14-4135-b2d7-0e640af52851/image_36.webp)

In the script log message, simply type `%output%` and click the `Save` button.  
![Script Log Save](../../../static/img/docs/4f425877-0d14-4135-b2d7-0e640af52851/image_37.webp)

Click the `Save` button at the top-right corner of the screen to save the script.  
![Save Script](../../../static/img/docs/4f425877-0d14-4135-b2d7-0e640af52851/image_38.webp)

## Completed Task

![Completed Task](../../../static/img/docs/4f425877-0d14-4135-b2d7-0e640af52851/image_39.webp)

## Output

- Script Log

## Changelog

### 2025-04-10

- Initial version of the document

