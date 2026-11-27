---
id: 'f525e770-2d55-4de5-af7e-0a95e8a825ce'
slug: /f525e770-2d55-4de5-af7e-0a95e8a825ce
title: 'Deploy ConnectSecure Agent [Windows]'
title_meta: 'Deploy ConnectSecure Agent [Windows]'
keywords: ['connectsecure', 'cybercns', 'vulnerability-scan', 'agent', 'install']
description: 'Downloads the latest ConnectSecure Vulnerability Scan Agent and installs it with the Company ID, Tenant ID and User Secret from the CS custom fields.'
tags: ['deployment', 'vulnerability', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-11-27
---

## Summary

The **Deploy ConnectSecure Agent [Windows]** task installs the ConnectSecure Vulnerability Scan Agent on a Windows device. It downloads the latest Windows installer from ConnectSecure and registers the agent with the Company ID, Tenant ID and User Secret in the CS custom fields.

The [Deploy ConnectSecure Agent [Windows]](/docs/1478e5e2-97a5-435e-aba4-970f33ef598b) monitor runs the task on devices in the [Deploy ConnectSecure Agent [Windows]](/docs/762539d7-6380-4703-b3c7-5daccb53de7f) group whose agent is missing. You can also run it by hand, with `Force` checked to reinstall the agent.

### How it works

1. **Check the scope.** The task reads the CS_Deployment fields. A device that's excluded, or whose OS type isn't covered, is skipped without changes.
2. **Check for the agent.** When the `CyberCnsAgent` service is already there, the task stops without changes, unless `Force` is checked.
3. **Read the credentials.** The Company ID comes from the site, then the company. The Tenant ID and User Secret come from the company. An empty value fails the task and names the field.
4. **Download the installer.** The task asks the ConnectSecure API for the latest Windows agent and downloads it to `C:\ProgramData\_Automation\App\CyberCnsAgent`.
5. **Install and confirm.** The installer runs silently, then the task waits up to 5 minutes for the `CyberCnsAgent` service to appear. The download folder is removed afterwards, whatever the result.
6. **Report the result.** The result goes to the Script Log. A failure fails the task.

**Requirements:** Windows PowerShell 5.1. Internet access to `configuration.myconnectsecure.com` and to the download link it returns. Your ConnectSecure Company IDs, Tenant ID and User Secret.

## Sample Run

**Install:** leave `Force` unchecked. Installs the agent when it's missing, and skips the device when it's already installed.

![Image1](../../../static/img/docs/f525e770-2d55-4de5-af7e-0a95e8a825ce/image1.webp)

**Reinstall:** check `Force`. Downloads and installs the agent again even though it's already installed, for example to repair an agent that stopped reporting.

![Image2](../../../static/img/docs/f525e770-2d55-4de5-af7e-0a95e8a825ce/image2.webp)

## Dependencies

- [Solution: Deploy ConnectSecure Agent [Windows]](/docs/6772bca3-be64-4114-8fc7-10cbee463bcb)
- [Group: Deploy ConnectSecure Agent [Windows]](/docs/762539d7-6380-4703-b3c7-5daccb53de7f)
- [Monitor: Deploy ConnectSecure Agent [Windows]](/docs/1478e5e2-97a5-435e-aba4-970f33ef598b)
- [Custom Field: CS_Deployment](/docs/a3fa2309-9ab8-476e-a684-25c17e7b0c0b)
- [Custom Field: CS_Deployment_Site](/docs/0b020b21-1a7b-4bb2-9e33-00549b632986)
- [Custom Field: CS_Deployment_Endpoint](/docs/63282970-5875-48da-bf3f-60639eb3006b)
- [Custom Field: CS_Company_ID](/docs/c93bfacb-1e95-42f1-88a2-358ef12de48e)
- [Custom Field: CS_Company_ID_Site](/docs/0755e964-3e42-4132-900e-3889a8c4fc93)
- [Custom Field: CS_Tenant_ID](/docs/5ce06a0b-16c7-4f91-9241-5bbba68c2ecd)
- [Custom Field: CS_User_Secret](/docs/261f8eb9-2d30-4f4b-816f-17e3de38e867)

## User Parameters

| Name | Example | Accepted Values | Required | Default | Type | Description |
| ---- | ------- | --------------- | -------- | ------- | ---- | ----------- |
| `Force` | `Checked` | `Checked` or `Unchecked` | False | False | Flag | Reinstalls the agent even when the `CyberCnsAgent` service is already there. Leave it unchecked for normal installs. The monitor always runs the task without it. |

## Custom Fields

The task reads these fields through its Set Pre-defined Variable rows. A blank site or endpoint field uses the level above.

| Name | Example | Level | Type | Default Value | Description |
| --- | --- | --- | --- | --- | --- |
| [CS_Deployment](/docs/a3fa2309-9ab8-476e-a684-25c17e7b0c0b) | `Windows Workstations and Servers` | `Company` | `Dropdown` | `Disabled` | Company-level ConnectSecure agent deployment scope by OS type. Overridden by Site or Endpoint settings. The default value acts as the portal-wide default. |
| [CS_Deployment_Site](/docs/0b020b21-1a7b-4bb2-9e33-00549b632986) | `Windows Workstations and Servers` | `Site` | `Dropdown` |  | Site-level override for the ConnectSecure agent deployment scope by OS type. Overrides Company settings, but overridden by Endpoint. |
| [CS_Deployment_Endpoint](/docs/63282970-5875-48da-bf3f-60639eb3006b) | `Disabled` | `Endpoint` | `Dropdown` |  | Endpoint-level ConnectSecure agent deployment switch. Overrides Site and Company settings, whatever the device OS. |
| [CS_Company_ID](/docs/c93bfacb-1e95-42f1-88a2-358ef12de48e) | `<Company ID>` | `Company` | `Text Box` |  | Company-level ConnectSecure Company ID that identifies this client in the ConnectSecure portal. Overridden by Site settings. |
| [CS_Company_ID_Site](/docs/0755e964-3e42-4132-900e-3889a8c4fc93) | `<Company ID>` | `Site` | `Text Box` |  | Site-level override for the ConnectSecure Company ID. Overrides Company settings. |
| [CS_Tenant_ID](/docs/5ce06a0b-16c7-4f91-9241-5bbba68c2ecd) | `<Tenant ID>` | `Company` | `Text Box` |  | ConnectSecure Tenant ID of the ConnectSecure environment. The default value acts as the portal-wide value. |
| [CS_User_Secret](/docs/261f8eb9-2d30-4f4b-816f-17e3de38e867) | `<User Secret>` | `Company` | `Text Box` |  | ConnectSecure User Secret used to register the agent. The default value acts as the portal-wide value. |

## Results

| Script Log starts with | What it means |
|---|---|
| `ConnectSecure Vulnerability Scan Agent was installed successfully.` | The agent was installed and its service is there. |
| `Skipped: ConnectSecure Vulnerability Scan Agent is already installed.` | The agent was already there and `Force` wasn't checked. Nothing was changed. |
| `Skipped: This device is excluded by CS_Deployment_Endpoint.` | The device is excluded. Nothing was changed. |
| `Skipped: ConnectSecure agent deployment does not include this workstation.` or `... this server.` | The site or company scope doesn't cover the device's OS type. Nothing was changed. |
| `CS_Company_ID is not set.`, `CS_Tenant_ID is not set.` or `CS_User_Secret is not set.` | Fill in the named field. The task fails. |
| `Failed to get the installer download link from the ConnectSecure API.` or `Failed to download the installer` | The device couldn't reach ConnectSecure. Check its internet access and any web filtering. The task fails. |
| `The installation failed. The CyberCnsAgent service did not appear within 300 seconds.` | The installer ran, but the agent didn't register. Check the Company ID, Tenant ID and User Secret, and the installer exit code at the end of the text. The task fails. |

## Task Setup Path

- **Tasks Path:** `AUTOMATION` ➞ `Tasks`
- **Task Type:** `Script Editor`

## Task Creation

### Description

- **Name:** `Deploy ConnectSecure Agent [Windows]`
- **Description:**

```PlainText
Installs the ConnectSecure Vulnerability Scan Agent with the Company ID, Tenant ID and User Secret from the CS custom fields.
Force: check it to reinstall the agent even when it's already installed.

https://content.provaltech.com/docs/f525e770-2d55-4de5-af7e-0a95e8a825ce
```

- **Category:** `Application`
- **Script Isolation Mode:** `Inactive`

![Image3](../../../static/img/docs/f525e770-2d55-4de5-af7e-0a95e8a825ce/image3.webp)

### Parameters

#### Force

| Parameter Name | Required Field | Parameter Type | Default Value |
| --- | --- | --- | --- |
| `Force` | `False` | `Flag` | |

![Image4](../../../static/img/docs/f525e770-2d55-4de5-af7e-0a95e8a825ce/image4.webp)

### Completed Parameters Section

![Image5](../../../static/img/docs/f525e770-2d55-4de5-af7e-0a95e8a825ce/image5.webp)

:::note

Name the parameter exactly as shown. The script reads it by this name.

:::

### Script Editor

Add the rows in this order. Rows 1 to 7 load the custom fields into the variables that the script reads.

#### Row 1 Function: Set Pre-defined Variable ( @endpointLevelDeployment@ = CS_Deployment_Endpoint )

- **Notes:** `endpointLevelDeployment`
- **Continue on Failure:** `False`
- **Operating System:** `Windows`
- **Variable Name:** `endpointLevelDeployment`
- **Custom Field:** `CS_Deployment_Endpoint (ENUM - ENDPOINT)`

![Image6](../../../static/img/docs/f525e770-2d55-4de5-af7e-0a95e8a825ce/image6.webp)

#### Row 2 Function: Set Pre-defined Variable ( @locationLevelDeployment@ = CS_Deployment_Site )

- **Notes:** `locationLevelDeployment`
- **Continue on Failure:** `False`
- **Operating System:** `Windows`
- **Variable Name:** `locationLevelDeployment`
- **Custom Field:** `CS_Deployment_Site (ENUM - SITE)`

![Image7](../../../static/img/docs/f525e770-2d55-4de5-af7e-0a95e8a825ce/image7.webp)

#### Row 3 Function: Set Pre-defined Variable ( @locationLevelCompanyId@ = CS_Company_ID_Site )

- **Notes:** `locationLevelCompanyId`
- **Continue on Failure:** `False`
- **Operating System:** `Windows`
- **Variable Name:** `locationLevelCompanyId`
- **Custom Field:** `CS_Company_ID_Site (STRING - SITE)`

![Image8](../../../static/img/docs/f525e770-2d55-4de5-af7e-0a95e8a825ce/image8.webp)

#### Row 4 Function: Set Pre-defined Variable ( @clientLevelDeployment@ = CS_Deployment )

- **Notes:** `clientLevelDeployment`
- **Continue on Failure:** `False`
- **Operating System:** `Windows`
- **Variable Name:** `clientLevelDeployment`
- **Custom Field:** `CS_Deployment (ENUM - COMPANY)`

![Image9](../../../static/img/docs/f525e770-2d55-4de5-af7e-0a95e8a825ce/image9.webp)

#### Row 5 Function: Set Pre-defined Variable ( @clientLevelCompanyId@ = CS_Company_ID )

- **Notes:** `clientLevelCompanyId`
- **Continue on Failure:** `False`
- **Operating System:** `Windows`
- **Variable Name:** `clientLevelCompanyId`
- **Custom Field:** `CS_Company_ID (STRING - COMPANY)`

![Image10](../../../static/img/docs/f525e770-2d55-4de5-af7e-0a95e8a825ce/image10.webp)

#### Row 6 Function: Set Pre-defined Variable ( @clientLevelTenantId@ = CS_Tenant_ID )

- **Notes:** `clientLevelTenantId`
- **Continue on Failure:** `False`
- **Operating System:** `Windows`
- **Variable Name:** `clientLevelTenantId`
- **Custom Field:** `CS_Tenant_ID (STRING - COMPANY)`

![Image11](../../../static/img/docs/f525e770-2d55-4de5-af7e-0a95e8a825ce/image11.webp)

#### Row 7 Function: Set Pre-defined Variable ( @clientLevelUserSecret@ = CS_User_Secret )

- **Notes:** `clientLevelUserSecret`
- **Continue on Failure:** `False`
- **Operating System:** `Windows`
- **Variable Name:** `clientLevelUserSecret`
- **Custom Field:** `CS_User_Secret (STRING - COMPANY)`

![Image12](../../../static/img/docs/f525e770-2d55-4de5-af7e-0a95e8a825ce/image12.webp)

#### Row 8 Function: PowerShell script

- **Notes:** `<Leave it Blank>`
- **Use Generative AI Assist for script creation:** `False`
- **Expected time of script execution in seconds:** `1800`
- **Continue on Failure:** `False`
- **Run As:** `System`
- **Operating System:** `Windows`
- **PowerShell Script Editor:**

[PowerShell Script](https://github.com/ProVal-Tech/cw-rmm/blob/main/tasks/deploy-connectsecure-agent-windows/script.ps1)

For detailed instructions on creating the task, see [Workflow for Implementing Engineers](https://github.com/ProVal-Tech/cw-rmm#-workflow-for-implementing-engineers).

![Image13](../../../static/img/docs/f525e770-2d55-4de5-af7e-0a95e8a825ce/image13.webp)

#### Row 9 Function: Script Log

- **Notes:** `<Leave it Blank>`
- **Continue on Failure:** `False`
- **Operating System:** `Windows`
- **Script Log Message:** `%Output%`

![Image14](../../../static/img/docs/f525e770-2d55-4de5-af7e-0a95e8a825ce/image14.webp)

## Completed Task

![Image15](../../../static/img/docs/f525e770-2d55-4de5-af7e-0a95e8a825ce/image15.webp)

## Attach the Task to the Monitor

The [Deploy ConnectSecure Agent [Windows]](/docs/1478e5e2-97a5-435e-aba4-970f33ef598b) monitor runs this task on devices whose agent is missing.

1. Create this task before you import the monitor.
2. Install the monitor from the `ProVal - Content` Community, selecting the **Monitors** repository.
3. Open the monitor and check that **Add Automation** runs the `Deploy ConnectSecure Agent [Windows]` task. Select the task if it's missing, then save.

## Output

- Script Log
- The installer is downloaded to `C:\ProgramData\_Automation\App\CyberCnsAgent`, and the folder is removed when the task ends.

## Changelog

### 2026-11-27

- Initial version of the document
