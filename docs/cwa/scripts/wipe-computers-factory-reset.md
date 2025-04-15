---
id: '18401e53-6ea1-4d94-a715-c2fc8767383e'
slug: /18401e53-6ea1-4d94-a715-c2fc8767383e
title: 'Wipe Computers - Factory Reset'
title_meta: 'Wipe Computers - Factory Reset'
keywords: ['factory', 'reset', 'script', 'windows', 'user']
description: 'This document provides a detailed overview of a script that allows users to perform a factory reset on their Windows machine. It includes options for user prompts and forceful resets, along with variable definitions and expected outputs. Use this script with caution as it will erase all data.'
tags: ['recovery', 'security', 'setup', 'windows']
draft: false
unlisted: false
---

## Summary

The script includes an option to initiate a factory reset, which will erase all data on the computer. Please use this script with extreme caution.

## Sample Run

- To ask the logged-in user before performing the factory reset:  
  ![Image](../../../static/img/Wipe-Computers---Factory-Reset/image_1.png)  

- To forcefully perform the factory reset:  
  ![Image](../../../static/img/Wipe-Computers---Factory-Reset/image_2.png)  

## Variables

| Name              | Description                                     |
|-------------------|-------------------------------------------------|
| ProjectName       | FactoryReset                                    |
| WorkingDirectory   | C:/ProgramData/_Automation/FactoryReset        |

#### User Parameters

| Name        | Example | Required | Description                                                                                                                                                                                                                                         |
|-------------|---------|----------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| showprompt  | 1       | False    | If the user parameter is set to 1, the script will prompt the user with the message: `A Factory Reset has been issued to your machine. Would you like to perform Factory Reset Now?` If the parameter is left blank, the script will initiate the factory reset without prompting the user. |

## Output

- Script log


