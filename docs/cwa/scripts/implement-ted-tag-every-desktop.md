---
id: '7b939958-3561-471c-971f-c6a667b30d4e'
slug: /7b939958-3561-471c-971f-c6a667b30d4e
title: 'Implement TED (Tag Every Desktop)'
title_meta: 'Implement TED (Tag Every Desktop)'
keywords: ['schedule', 'task', 'ted', 'application', 'user', 'logon']
description: 'This document provides a detailed overview of a PowerShell script that schedules a task to run the TED (Tag Every Desktop) application with specific parameters upon user logon. It includes sample runs, user parameters, and output details.'
tags: ['installation', 'setup', 'windows']
draft: false
unlisted: false
---

## Summary

The purpose of the script is to schedule a task on the computer that runs the [TED (Tag Every Desktop)](https://github.com/HealthITAU/TED) application with the configured parameters upon user logon.  
**Requirement:** PowerShell v5.1+

## Sample Run

### Without Arguments:

![Without Arguments](../../../static/img/docs/7b939958-3561-471c-971f-c6a667b30d4e/image_1.webp)  
The result on End Machine:  
![Result on End Machine 1](../../../static/img/docs/7b939958-3561-471c-971f-c6a667b30d4e/image_2.webp)  
![Result on End Machine 2](../../../static/img/docs/7b939958-3561-471c-971f-c6a667b30d4e/image_3.webp)  

### With Arguments:  
![With Arguments](../../../static/img/docs/7b939958-3561-471c-971f-c6a667b30d4e/image_4.webp)  
Arguments used: `-di "[https://i.imgur.com/g1v5XZP.jpg](https://i.imgur.com/g1v5XZP.jpg)" -li "[https://i.imgur.com/g1v5XZP.jpg](https://i.imgur.com/g1v5XZP.jpg)" -f Arial -fs 14 -ls 5 -hp 10 -vp 10 -line "Hello, @userName" -line "Computer Name: @machineName" -line "OS: @osName" -line "OS Version: @osVersion"`  
The result on End Machine:  
![Result on End Machine 3](../../../static/img/docs/7b939958-3561-471c-971f-c6a667b30d4e/image_5.webp)  
![Result on End Machine 4](../../../static/img/docs/7b939958-3561-471c-971f-c6a667b30d4e/image_6.webp)  

**Note:**  
- The tool will utilize white text for computers using the Dark Theme and black text for computers using the Light Theme.
- When passing strings as arguments to the script, they should be enclosed in double quotes, as shown in the example above.
- For additional information on arguments, please refer to the [TED Usage documentation](https://github.com/HealthITAU/TED#usage).

## Variables

| Name                  | Description                          |
|-----------------------|--------------------------------------|
| AppName               | TED                                  |
| ProjectName           | Implement-TED                        |
| WorkingDirectory      | C:/ProgramData/_Automation/Application/TED |
| ScheduledTaskName     | Implement TED (Tag Every Desktop)    |

### User Parameters

| Name      | Example                                                                                                                                                                                                                                           | Required | Description                          |
|-----------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|--------------------------------------|
| Argument  | `-di "[https://i.imgur.com/g1v5XZP.jpg](https://i.imgur.com/g1v5XZP.jpg)" -li "[https://i.imgur.com/g1v5XZP.jpg](https://i.imgur.com/g1v5XZP.jpg)" -f Arial -fs 14 -ls 5 -hp 10 -vp 10 -line "Hello, @userName" -line "Computer Name: @machineName" -line "OS: @osName" -line "OS Version: @osVersion"` | False    | Switches/Arguments to run the TED tool with. |

## Output

- Script Log