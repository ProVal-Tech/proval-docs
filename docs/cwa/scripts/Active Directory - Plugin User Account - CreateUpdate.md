---
id: 'cwa-create-update-domain-admin-account'
title: 'Create/Update Domain Admin Account for AD Plugin'
title_meta: 'Create/Update Domain Admin Account for AD Plugin'
keywords: ['domain', 'admin', 'account', 'active', 'directory', 'plugin']
description: 'This document outlines a script designed to create or update a domain admin account for the Active Directory plugin, including features for random password generation and troubleshooting capabilities. It is intended for use on domain controllers detected by the Active Directory Domains plugin and includes implementation steps, dependencies, and variable configurations.'
tags: ['active-directory', 'security', 'setup', 'configuration', 'windows']
draft: false
unlisted: false
---
## Summary

This script will create/update a domain admin account to be used with the AD plugin with a random password. It will set the password to AD plugin for the domain controller as well; in case of failure, it will attempt the basic troubleshooting to fix the AD plugin issues.

Also, there's an option available in the script to set the password as Deployment and default password for the location. This option can be controlled by the system property `AD_Plugin_Set_Location_Default_Password`.

Intended Target: Domain Controllers detected in `Active Directory Domains` plugin. The script is being called by [CWM - Automate - Internal Monitor - Active Directory - ADPluginUser - Create/Update](https://proval.itglue.com/DOC-5078775-11420016) monitor as an autofix.

### Notes
- This script will no longer function on any end-of-life systems, including 2003 Servers, 2008 Servers, 2011 SBS Servers, and 2012 Servers (both regular and R2 editions). Manual management of AD Plugin User Accounts will be necessary for these machines.
- The `AD_Plugin_Username` must be distinct and cannot match the name of any existing group or user, as Windows cannot create a new user if a group or user with the same name already exists on the computer/domain. The default username is `ADPluginUser`.

## File Hash

**File Path**: `C:/ProgramData/_Automation/Script/Set-DomainAdmin/Set-DomainAdmin.ps1`  
**SHA256**: `393870CF414220D4113EBD90A273666427A9A7C85441A46DFC51F3938EACAADD`  
**MD5**: `A92D15A5A2B09A826134BA5DEBC6E8C5`  

## Sample Run

![Sample Run](../../../static/img/Active-Directory---Plugin-User-Account---CreateUpdate/image_1.png)

## Implementation

**The implementation steps must be followed to import/update the script after 2023-08-02**

**For Updating the current script:**
- **If this script is still in use** - Take a note of the values of the global variables `Username`, `Title`, `SetLocationDefaultPassword`, and `MinimumPasswordLength` before importing the new version of the script.  
![Update Step](../../../static/img/Active-Directory---Plugin-User-Account---CreateUpdate/image_2.png)

- Import the replacement Monitor, Script, and alert template using the ProSync plugin.
  - [CWM - Automate - Internal Monitor - Active Directory - ADPluginUser - Create/Update](https://proval.itglue.com/DOC-5078775-11420016) 
  - `△ Custom - Autofix - AD Plugin User - Create/Update`
  - This script 'should' get imported after importing the alert template. Verify it is in the system.

- If you correctly documented the global variables in the old script, you can **deprecate the old script AND alert template**.

- Run the new script against any online computer with `Set_Environment` parameter set to `1`. **Use the values stored from the Global Parameters** at first step for the rest of the user parameters.  
![Run Step](../../../static/img/Active-Directory---Plugin-User-Account---CreateUpdate/image_3.png)

- The script creates `AD_Plugin_Set_Location_Default_Password` property as well. Set this value to the desired value (1 or 0).
  - Default value is Disabled (0)

**For new implementation:**
- Import the New Monitor, Script, and alert template using the ProSync plugin.
  - [CWM - Automate - Internal Monitor - Active Directory - ADPluginUser - Create/Update](https://proval.itglue.com/DOC-5078775-11420016) 
  - `△ Custom - Autofix - AD Plugin User - Create/Update`
  - This script 'should' get imported after importing the alert template. Verify it is in the system.

- Run the script against any online computer with `Set Environment` parameter set to `1`. Set the required values for the rest of the user parameters.  
![New Implementation](../../../static/img/Active-Directory---Plugin-User-Account---CreateUpdate/image_4.png)

- The script creates `AD_Plugin_Set_Location_Default_Password` property as well. Set this value to the desired value (1 or 0).

**Notes:**
- The user parameters are required for the **first run only** (First run of the updated script).
- The Values set to the user parameters will be used to create System Properties used by the script and [CWM - Automate - Internal Monitor - Active Directory - ADPluginUser - Create/Update](https://proval.itglue.com/DOC-5078775-11420016) monitor set.
- **If Values are not provided** to the user parameters for the first run of the script, the script and the monitor set will then use the default values.
  - Default Password Title: ADPluginUser
  - Default Username: AdPluginUser
  - Default Password Update Days: 60
  - Default Minimum Password Length: 16

- Domain Name will be added to the end of the password title for the clients with multiple domains.  
  e.g.,  
  ADPluginUser - [Domain.local](http://domain.local)  
  ADPluginUser - [Dmn.local](http://dmn.local)

- Apart from the System properties controlled by the user parameter, the script creates `AD_Plugin_Set_Location_Default_Password` property as well. This property can be used to set the generated credentials as location's default password.  
  `1` and `0` to toggle setting the generated password as default and deployment password of the Domain Controller's location. Default is `0`. The property can be generated by the script with a default value of `0`, any required changes should be made manually.  
![Default Password](../../../static/img/Active-Directory---Plugin-User-Account---CreateUpdate/image_5.png)

## Dependencies

[CWM - Automate - RMM+ Plugin Configuration](https://proval.itglue.com/5078775/docs/9770217)

## Variables

| Name            | Description                                                                                     |
|-----------------|-------------------------------------------------------------------------------------------------|
| STATUS          | Status returned by the monitor set, if the script is executed by the monitor set.             |
| psout           | Output of the powershell script creating/updating the user.                                   |
| ScriptLog       | Content of the log file generated by the script.                                              |
| Label           | Status of the credentials in the AD Domains plugin post setting.                               |
| Command         | Command used to reset the AD Plugin on Computer.                                              |
| Status          | Status of the credentials in the AD Domains plugin post troubleshooting.                       |
| MaximumPasswordLength | Maximum length to create the random password.                                           |

## Global Variables

| Name                        | Default | Required | Description                                                                                       |
|-----------------------------|---------|----------|---------------------------------------------------------------------------------------------------|
| ScriptEngineEnableLogger     | 0       | True     | Disabling the logging to hide the generated password from the script logs.                       |

## User Parameters

| Name                          | Example | Required | Description                                                                                          |
|-------------------------------|---------|----------|------------------------------------------------------------------------------------------------------|
| Set_Environment               | 1       | False    | Required for the first run only to set the system properties used by the solution.                 |
| AD_Plugin_Password_Title      | ADPluginUser | False | To set the value for the system property `AD_Plugin_Password_Title` during the first run of the script. The `Set_Environment` parameter must be set to `1` to use this parameter. Leaving it blank will set the default value for the system property. |
| AD_Plugin_Username            | ADPluginUser | False | To set the value for the system property `AD_Plugin_Username` during the first run of the script. The `Set_Environment` parameter must be set to `1` to use this parameter. Leaving it blank will set the default value for the system property. |
| AD_Plugin_Password_Update_Days | 60     | False    | To set the value for the system property `AD_Plugin_Password_Update_Days` during the first run of the script. The `Set_Environment` parameter must be set to `1` to use this parameter. Leaving it blank will set the default value for the system property. |
| AD_Plugin_Password_Minimum_Length | 16   | False    | To set the value for the system property `AD_Plugin_Minimum_Password_Length` during the first run of the script. The `Set_Environment` parameter must be set to `1` to use this parameter. Leaving it blank will set the default value for the system property. |

**Note:** The user parameters can only be used to create the system properties. If required, changes to the system properties should be made manually from the **`Dashboard > Config > Configuration > Properties`**.

## System Properties

| Name                          | Example | Required | Description                                                                                          |
|-------------------------------|---------|----------|------------------------------------------------------------------------------------------------------|
| AD_Plugin_Password_Title      | ADPluginUser | False | Title of the password entry to use to store the credentials for Active Directory plugin. Solution will use the default title `ADPluginUser` if the system property is missing. |
| AD_Plugin_Username            | ADPluginUser | False | Username of the password entry to use to create the credentials for Active Directory plugin. Solution will use the default username `ADPluginUser` if the system property is missing. |
| AD_Plugin_Password_Update_Days | 60     | False    | Age of the password in days. Solution will use the default age `60` Days if the system property is missing. |
| AD_Plugin_Password_Minimum_Length | 16   | False    | Minimum length of the random password to generate for the AD Plugin user. Default value is `16`. |
| AD_Plugin_Set_Location_Default_Password | 0 | False | `1` and `0` to toggle setting the generated password as default and deployment password of the Domain Controller's location. Default is `0`. The property can be generated by the script with a default value of `0`, any required changes should be made manually. |
| AD_Plugin_Account_Make_Admin | 1       | False    | `1` and `0` to toggle adding the user to the "domain admins" group. Default value is `1`. |

## Output

- Script Logs



