---
id: '21f7afea-94a7-4bd9-b46f-7f8a20819eb7'
slug: /21f7afea-94a7-4bd9-b46f-7f8a20819eb7
title: 'BSOD Monitoring Configuration Writer'
title_meta: 'BSOD Monitoring Configuration Writer'
keywords: ['BSOD', 'bluescreen', 'crashdump']
description: 'Creates and maintains the JSON configuration file used by the BSOD Monitoring monitor.'
tags: ['bluescreen', 'alerting', 'application']
draft: false
unlisted: false
last_update:
  date: 2026-07-21
---


## Summary

Creates and maintains the JSON configuration file used by [Monitor : BSOD Monitoring](/docs/e239e458-56e6-4859-ab30-a7592366b824). The script applies hierarchical RMM variable overrides to define the BSOD event threshold and monitoring period. The actual BSOD detection and alerting logic is performed by an external monitor set that reads and evaluates this configuration file.

### How It Works

1. **CW RMM Variable Evaluation**
   The script reads the BSOD monitoring settings from the configured CW RMM client-level variables:

   * **ClientThreshold** – Maximum number of BSOD-related events allowed before an alert is triggered.
   * **ClientEvaluationDays** – Number of previous days to evaluate for BSOD-related events.

   If either variable is missing or contains an invalid value, the script falls back to the built-in defaults.

2. **Default Values**
   When no valid CW RMM variables are configured, the following defaults are applied:

   * **Threshold** = `3`
   * **Days** = `7`

3. **Configuration File Generation**
   The resolved values are written to the following JSON configuration file:

   ```PlainText
   C:\ProgramData\_Automation\Script\BSODMonitoring\BSODMonitoring.json
   ```

   The file contains two values:

   * **Threshold** – Maximum number of BSOD-related events allowed before an alert is generated.
   * **Days** – Number of previous days to search the Windows System event log for BSOD-related events.

### Sample Scenario 1: Using Default Values

No CW RMM variables are configured. The script uses the built-in defaults and generates the following configuration file:

```json
{
    "Threshold": 3,
    "Days": 7
}
```

### Sample Scenario 2: Using CW RMM Variable Overrides

The administrator configures the following CW RMM variables:

* `ClientThreshold` = `5`
* `ClientEvaluationDays` = `14`

The generated configuration file becomes:

```json
{
    "Threshold": 5,
    "Days": 14
}
```

### Ticketing & Alerting Behavior

* A separate **BSOD Monitoring** monitor reads the configuration file and periodically scans the Windows **System** event log.
* The monitor counts BSOD-related events (**Event IDs 41, 1001, and 6008**) that occurred within the configured number of days.
* If the number of events exceeds the configured **Threshold**, the monitor reports a failure and generates an alert.
* Once the event count falls back within the configured threshold, the monitor returns to a healthy state. If automatic resolution is enabled in the monitor set, the associated alert or ticket is resolved automatically.

## Sample Run

![Image2](../../../static/img/docs/21f7afea-94a7-4bd9-b46f-7f8a20819eb7/image1.webp)

## Dependencies

- [Custom Field: BSOD_Evaluation_Days](/docs/82703d2b-8e7d-4e69-b57b-493977056903)
- [Custom Field: BSOD_Threshold](/docs/94877b6f-56ed-4e42-a33c-55ef441e10bf)
- [Solution: BSOD Monitoring](/docs/fc85a090-94c2-4f91-8055-9c8e52d91ad1)

## Custom Fields

The following table lists all custom fields used by the to determine the BSOD Monitoring. The `Enable` fields are not listed here; they are used exclusively by the automation group to decide whether the script runs at all.

| Name          | Level        | Type     |   Help Text           | Default       | Editable | Description                              |
|----------------------|----------|-----|----------|------------------|----------|---------|
| [Custom Field: BSOD_Evaluation_Days](/docs/82703d2b-8e7d-4e69-b57b-493977056903) | Company | Text |  Number of previous days to check for BSOD-related events in the Windows System event log. Default is 7 days. | - |  Yes  | Number of previous days to check for BSOD-related events in the Windows System event log. Default is 7 days. |
| [Custom Field: BSOD_Threshold](/docs/94877b6f-56ed-4e42-a33c-55ef441e10bf) | Company | Text | Maximum allowed BSOD-related events before triggering an alert. Default Value is '3'. | - |  Yes  | Maximum allowed BSOD-related events before triggering an alert. Default Value is '3'. |

---

![Image2](../../../static/img/docs/21f7afea-94a7-4bd9-b46f-7f8a20819eb7/image2.webp)

## Task Setup Path

- **Tasks Path:** `AUTOMATION` ➞ `Tasks`  
- **Task Type:** `Script Editor`  

## Task Creation

### **Description**

- **Name:** `BSOD Monitoring Configuration Writer`  
- **Description:** `Creates and maintains the JSON configuration file used by the BSOD Monitoring monitor. The script applies hierarchical RMM variable overrides to define the BSOD event threshold and monitoring period. The actual BSOD detection and alerting logic is performed by an external monitor set that reads and evaluates this configuration file.`  
- **Category:** `Monitoring`

![Image3](../../../static/img/docs/21f7afea-94a7-4bd9-b46f-7f8a20819eb7/image3.webp)

### **Script Editor**

#### **Row 1 Function: Set Pre-defined Variable ( @ClientThreshold@ = BSOD_Threshold)**

- **Notes:** `ClientThreshold`
- **Continue on Failure:** `False`
- **Operating System:** `Windows`
- **Variable Name:** `ClientThreshold`
- **Custom Field:** `BSOD_Threshold`

![Image4](../../../static/img/docs/21f7afea-94a7-4bd9-b46f-7f8a20819eb7/image4.webp)

#### **Row 2 Function: Set Pre-defined Variable ( @ClientEvaluationDays@ = BSOD_Evaluation_Days)**

- **Notes:** `ClientEvaluationDays`
- **Continue on Failure:** `False`
- **Operating System:** `Windows`
- **Variable Name:** `ClientEvaluationDays`
- **Custom Field:** `BSOD_Evaluation_Days`

![Image5](../../../static/img/docs/21f7afea-94a7-4bd9-b46f-7f8a20819eb7/image5.webp)

#### **Row 3 Function: PowerShell script**

- **Notes:** `<Leave it Blank>`  
- **Use Generative AI Assist for script creation:** `False`  
- **Expected time of script execution in seconds:** `300`  
- **Continue on Failure:** `False`  
- **Run As:** `System`  
- **Operating System:** `Windows`  
- **PowerShell Script Editor:**

```PowerShell
<#
.SYNOPSIS
    Creates the BSOD Monitoring configuration file with threshold and monitoring period values.
    Designed to be run by the 'BSOD Monitoring Configuration Writer' task in CW RMM.

.DESCRIPTION
    This script creates and maintains the local configuration file used by the BSOD Monitoring
    monitor script.

    The script retrieves threshold values from CW RMM client-level variables and applies them
    using a hierarchical override approach. If valid RMM variables are not available, hardcoded
    workstation defaults are applied.

    Configuration values:
        Threshold:
            Defines the maximum number of BSOD-related events allowed before triggering an alert.
            If the number of detected BSOD events exceeds this value, the BSOD Monitoring script
            reports a failure condition.

        Days:
            Defines the number of previous days to evaluate when checking the Windows System event
            log for BSOD-related events.

    The script creates the working directory if it does not exist and writes the configuration
    values into a JSON file consumed by the BSOD Monitoring monitor.

    The monitored BSOD events include:
        - Event ID 41:
            Kernel-Power event indicating an unexpected system shutdown or restart.
        - Event ID 1001:
            BugCheck event generated during a Blue Screen of Death (BSOD).
        - Event ID 6008:
            Unexpected shutdown event indicating the previous shutdown was not clean.

.NOTES
    Script Name   = BSOD Monitoring Configuration Writer
    Configuration = $env:ProgramData\_Automation\Script\BSODMonitoring\BSODMonitoring.json
    RMM Variables:
        clientLevelDays:
            Client-level override value for the number of days to check for BSOD events.
        clientLevelThreshold:
            Client-level override value for the maximum allowed BSOD events.

    Default Values:
        Days      = 7
        Threshold = 3

    Configuration Output:
        Threshold = Maximum allowed BSOD-related events before triggering an alert.
        Days      = Number of previous days used for BSOD event evaluation.

.OUTPUTS
    - On successful configuration creation:
        Configuration file '<path>' written successfully.

        Configuration:
        Threshold = <value>
        Days = <value>

    - On failure:
        Throws an error if the working directory or configuration file cannot be created.
#>

#region globals
$ProgressPreference = 'SilentlyContinue'
$WarningPreference = 'SilentlyContinue'
#endregion

#region variables
$projectName = 'BSODMonitoring'
$workingDirectory = '{0}\_Automation\Script\{1}' -f $env:ProgramData, $projectName
$configFilePath = '{0}\{1}.json' -f $workingDirectory, $projectName
#endregion

#region rmm variables
$clientLevelDays = '@ClientEvaluationDays@'
$clientLevelThreshold = '@ClientThreshold@'
#endregion

# Hard defaults if nothing is configured
$defaultDays = 7
$defaultThreshold = 3
#endregion

#region set thresholds based on rmm variables
[int]$Days = if (
    -not [string]::IsNullOrEmpty($clientLevelDays) -and
    $clientLevelDays -notmatch 'ClientEvaluationDays' -and
    $clientLevelDays  -match '^\d+$'
) {
    [int]$clientLevelDays
} else {
    $defaultDays
}

[int]$Threshold = if (
    -not [string]::IsNullOrEmpty($clientLevelThreshold) -and
    $clientLevelThreshold -notmatch 'ClientThreshold' -and
    $clientLevelThreshold  -match '^\d+$'
) {
    [int]$clientLevelThreshold
} else {
    $defaultThreshold
}

#region working directory
if (-not (Test-Path -Path $workingDirectory)) {
    try {
        New-Item -Path $workingDirectory -ItemType 'Directory' -Force -ErrorAction Stop | Out-Null
    } catch {
        throw ('Failed to create the working directory {2}{0}{2}. Error: {1}' -f $workingDirectory, $Error[0].Exception.Message, [char]34)
    }
}
#endregion

#region config file
$config = @{
    Threshold = $Threshold
    Days = $Days
}
try {
    $config | ConvertTo-Json -Depth 3 | Set-Content -Path $configFilePath -Force -Encoding 'UTF8' -ErrorAction Stop
} catch {
    throw ('Failed to write the configuration file {2}{0}{2}. Error: {1}' -f $configFilePath, $Error[0].Exception.Message, [char]34)
}

return ('Configuration file ''{0}'' written successfully.{1}{1}Configuration:{1}{2}' -f $configFilePath, [System.Environment]::NewLine, ($config | Out-String))
#endregion
```

![Image6](../../../static/img/docs/21f7afea-94a7-4bd9-b46f-7f8a20819eb7/image6.webp)

#### **Row 4 Function: Script Log**

- **Notes:** `<Leave it Blank>`  
- **Continue on Failure:** `False`  
- **Operating System:** `Windows`  
- **Script Log Message:** `%Output%`  

![Image7](../../../static/img/docs/21f7afea-94a7-4bd9-b46f-7f8a20819eb7/image7.webp)

## Completed Script

![Image8](../../../static/img/docs/21f7afea-94a7-4bd9-b46f-7f8a20819eb7/image8.webp)

## Output

- Script Log
- JSON File at `C:\ProgramData\_Automation\Script\BSODMonitoring\BSODMonitoring.json`

## Schedule Task

### Task Details

- **Name:** `BSOD Monitoring Configuration Writer`  
- **Description:** `Creates and maintains the JSON configuration file used by the BSOD Monitoring monitor. The script applies hierarchical RMM variable overrides to define the BSOD event threshold and monitoring period. The actual BSOD detection and alerting logic is performed by an external monitor set that reads and evaluates this configuration file.`  
- **Category:** `Monitoring`

![Image3](../../../static/img/docs/21f7afea-94a7-4bd9-b46f-7f8a20819eb7/image3.webp)

### Schedule

- **Schedule Type:**  `Schedule`  
- **Timezone:** `Local Machine Time`  
- **Start:** `<Current Date>`  
- **Trigger:** `Time` `At` `<Current Time>`  
- **Recurrence:** `Every day`
- **Execute at next agent check-in:** `True`
- **Stop After:** `22`
- **Unit:** `Hour(s)`

![Image9](../../../static/img/docs/21f7afea-94a7-4bd9-b46f-7f8a20819eb7/image9.webp)

### Targeted Resource

**Device Group:** `BSOD Monitoring`

![Image10](../../../static/img/docs/21f7afea-94a7-4bd9-b46f-7f8a20819eb7/image10.webp)

### Completed Scheduled Task

![Image11](../../../static/img/docs/21f7afea-94a7-4bd9-b46f-7f8a20819eb7/image11.webp)

## Changelog

### 2026-07-21

- Initial version of the document
