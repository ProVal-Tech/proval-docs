---
id: 'vsa-install-immybot'
title: 'Install ImmyBot on Endpoint'
title_meta: 'Install ImmyBot on Endpoint - VSA Implementation Guide'
keywords: ['immybot', 'installation', 'endpoint', 'vsa', 'agent']
description: 'This document provides a comprehensive guide for installing ImmyBot on endpoints using preconfigured variables within the VSA environment. It covers dependencies, implementation steps, usage of the installation script, and detailed parameter descriptions.'
tags: ['installation', 'endpoint', 'vsa', 'software', 'configuration']
draft: false
unlisted: false
---
# Overview
Installs ImmyBot on the endpoint using preconfigured variables.

# Dependencies
- Managed Variable (IMMYBOT_KEY)
- Managed Variable (IMMYBOY_ID)
- Managed File (Install-ImmyBot.ps1)

# VSA Implementation
1. Export the procedure from the ProVal VSA.
2. Import the procedure into the partner VSA.
3. Import the managed file (Install-ImmyBot.ps1)
   - This can be exported from our VSA:  
     VSASharedFiles\\Miscellaneous\\Install-Immybot.ps1
4. Modify the Line 16 writeFile to point to the uploaded file, and make sure the destination shows `#directory#\\#ScriptName#.ps1`

![Image](..\..\..\static\img\Install-ImmyBot\image_1.png)

5. Create a managed variable for IMMYBOT_ID and IMMYBOT_KEY  
   ![Image](..\..\..\static\img\Install-ImmyBot\image_2.png)

These values can be gathered from the ImmyBot portal. The PowerShell output contains a KEY and an ID.

![Image](..\..\..\static\img\Install-ImmyBot\image_3.png)  
6. Specify the subdomain in the agent procedure. The subdomain can be gathered from the same command copied earlier.  

![Image](..\..\..\static\img\Install-ImmyBot\image_4.png)  

The subdomain in this example of [https://proval.immy.bot](https://proval.immy.bot) would be **proval**  

![Image](https://c.tenor.com/8vSJsVW-1pQAAAAj/police-car-light-joypixels.gif)  

**Ensure you use the URL copied from the partner's Immybot instance**  

![Image](..\..\..\static\img\Install-ImmyBot\image_5.png)  

# Payload Usage
```
PS C:\> Install-ImmyBot.ps1 -Subdomain 'yourSubdomain' -ID 'yourID' -KEY 'yourKEY' 
# Installs Immybot using the specified parameters.

PS C:\> Install-ImmyBot.ps1 -Subdomain 'yourSubdomain' -ID 'yourID' -KEY 'yourKEY' -Upgrade
# Installs Immybot using the specified parameters and will upgrade an existing agent to the latest version.

PS C:\> Install-ImmyBot.ps1 -Subdomain 'yourSubdomain' -ID 'yourID' -KEY 'yourKEY' -Upgrade -Force
# Installs ImmyBot using the specified parameters and will upgrade an existing agent to the latest version. Will replace existing installation even if up to date.
```

# Parameters
| Parameter   | Alias | Required | Default | Type   | Description                                                                                       |
|-------------|-------|----------|---------|--------|---------------------------------------------------------------------------------------------------|
| `-Subdomain`|       | True     |         | String | The subdomain of the partner's Immybot Instance. This is their Immybot subdomain URL.          |
| `-ID`      |       | True     |         | String | ID for the installation of the ImmyBot agent                                                    |
| `-KEY`     |       | True     |         | String | KEY for the installation of the ImmyBot agent                                                   |
| `-Upgrade`  |       | False    |         | Switch | Will replace existing installations with the latest version of ImmyBot if an existing installation is detected. |
| `-Force`    |       | False    |         | Switch | Will replace existing installations with the latest version of ImmyBot even if the existing installation is using the current version. |

**Output**  
Location of output for log, result, and error files.
```
Agent Procedure Log Entry
%ProgramData%_automation\AgentProcedure\ImmyBotInstall\Install-ImmyBot-log.txt
%ProgramData%_automation\AgentProcedure\ImmyBotInstall\Install-ImmyBot-error.txt
```


