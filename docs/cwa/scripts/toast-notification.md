---
id: '3aab837d-cb64-4669-aa35-040cce21c575'
slug: /3aab837d-cb64-4669-aa35-040cce21c575
title: 'Toast Notification'
title_meta: 'Toast Notification'
keywords: ['toast', 'notification', 'reminder', 'reboot']
description: 'This script downloads and executes the New-ToastNotification.ps1, providing a customizable interface to display toast notifications. It supports scenarios such as system reboots, password expiration warnings, and general user notifications. Users can add custom titles, images, buttons, and deadlines to their notifications. A scheduled task is created for repetitive notifications.'
tags: ['reboot', 'windows']
draft: false
unlisted: false
---

## Summary

It is the CW Automate implementation of the agnostic script [Invoke-ToastNotification.ps1](/docs/426118d9-ff83-444e-9744-30a0e26cb490). 

This script downloads and executes the New-ToastNotification.ps1, providing a customizable interface to display toast notifications. It supports scenarios such as system reboots, password expiration warnings, and general user notifications. Users can add custom titles, images, buttons, and deadlines to their notifications. A scheduled task is created for repetitive notifications.

## Update Notice: 2025-07-22

- A script can be triggered via a button click within the notification.  
- The dismiss button is optional and can be excluded.  
- Notifications can be shown with or without buttons.

## File Hash

**File Path:** `C:\ProgramData\_automation\Script\New-ToastNotification\New-ToastNotification\New-ToastNotification.ps1`  
**File Hash (Sha256):** `C6F8C7D7A2D21146C11D2402855D723861B1EE546FA3DDBE46B37ABA514A99A1`  
**File Hash (MD5):** `5F3A9F15FBC11BFD19FD559848F3E7E1`  

**File Path:** `C:\ProgramData\_automation\Script\New-ToastNotification\New-ToastNotification\Hidden.vbs`  
**File Hash (Sha256):** `20A98A7E6E137BB1B9BD5EF6911A479CB8EAC925B80D6DB4E70B19F62A40CCE2`  
**File Hash (MD5):** `C578D9653B22800C3EB6B6A51219BBB8`  

**File Path:** `C:\ProgramData\_automation\Script\New-ToastNotification\New-ToastNotification\RunToastHidden.cmd`  
**File Hash (Sha256):** `3FB35F928C761310A0A2FBC78728F80B96E5A3BDB1C148C252635931BCA9D5DB`  
**File Hash (MD5):** `F1CF42E33BF172E0B7A16802230F6CB9`  

## Sample Run

This script is a function script and should not be manually executed.
Utilize the [Toast Notification - Template](/docs/e6115fa5-78ac-4b04-8b3f-d0dd0c2e559f) to get a copy of all potential variables and paste the else section into any script that should use Prompter.

## Dependencies

[Toast Notification - Template](/docs/e6115fa5-78ac-4b04-8b3f-d0dd0c2e559f)

[Invoke-ToastNotification](/docs/426118d9-ff83-444e-9744-30a0e26cb490)

## Variables

| Name                        | Description                                                                                                                                         |
|-----------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------|
| NotificationType            | The type of notification to send. The accepted values for @NotificationType@ are generic, PendingRebootUptime, PendingRebootCheck, and ADPasswordExpiration. It is a mandatory variable. <ul><li>**Generic:** Enables a static, generic toast notification.</li><li>**PendingRebootUptime:** Displays a toast notification reminding users to restart their system after exceeding the maximum uptime.</li><li>**PendingRebootCheck:** Displays a toast notification when a pending reboot is detected through the system registry or WMI.</li><li>**ADPasswordExpiration:** Sends a toast notification to users when their Active Directory password is nearing expiration.</li></ul> |
| RebootButton                | Set @RebootButton@ to 1 to enable the `Reboot` button in the notification. Setting it to `0` or deleting the variable will disable it. @RebootButton@ is available for `Generic`, `PendingRebootUptime`, and `PendingRebootCheck` notification types. |
| RunScriptButton | Set @RunScriptButton@ to 1 to enable the 'Run Script' button in the notification. To disable it, either set the value to 0 or remove the variable. Please note that enabling this button will automatically disable the 'Snooze' button. |
| RunScriptButtonText | Set the string in the @RunScriptButtonText@ variable to customize the text of the RunScript button. Delete the variable or leave it blank to fall back to the default value. The default is `RunScript`. `@RunScriptButton@` should be enabled or set to `1` to enable the `@RunScriptButtonText@` variable. |
| ScriptPath | @ScriptPath@ specifies the full path to a PowerShell script (.ps1) that will be executed when the 'RunScript' button is clicked. This must be a valid path ending in .ps1. Setting this variable is mandatory if @RunScriptButton@ is enabled. If @RebootScriptButton@ is not enabled, this variable can be omitted by leaving it blank or removing it entirely. |
| ScriptContext | @ScriptContext@ Specifies the context in which the custom script should be executed when triggered from the notification on clicking the 'RunScript' button. Valid values are 'User' (runs in the current user context) or 'System' (runs with elevated/system privileges, if supported). Default is 'User'. `@RunScriptButton@` should be enabled or set to `1` to enable the `@ScriptContext@` variable. |
| ScriptStyle | @ScriptStyle@ defines how the script should be executed when the 'RunScript' button is clicked. Valid options are 'Interactive' (displays messages or launches installers on the user's desktop) and 'Hidden' (runs silently in the background). The default value is 'Hidden'. This variable is only applicable if @RunScriptButton@ is enabled or set to 1. |
| LearnMoreButton             | Set @LearnMore@ to 1 to enable the `Learn More` button in the notification. Setting it to `0` or deleting the variable will disable it.             |
| LearnMoreUrl                | Set the URL to navigate by clicking the `Learn More` button in the notification. `@LearnMoreButton@` should be enabled or set to `1` to allow the `@LearnMoreUrl@` variable.                                                    |
| SnoozeButton                | Set @SnoozeButton@ to 1 to enable the 'Snooze' button in the notification. To disable it, either set the value to 0 or remove the variable entirely. Note that @SnoozeButton@ and @LearnMoreButton@ cannot be enabled at the same time. Additionally, enabling @RebootScriptButton@ will automatically disable the @SnoozeButton@. |
| HideDismissButton | Set @HideDismissButton@ to 1 to remove the dismiss button from the toast notification. When enabled, users will not see an option to dismiss the notification. By default, the dismiss button is visible. |
| DismissButtonText           | Set the string in the @DismissButtonText@ variable to customize the dismiss button's text. Delete the variable or leave it blank to return to the default value, `Dismiss`.                                                     |
| TitleText                   | Sets the title of the notification in the @TitleText@ variable. It is mandatory to set this variable.                                               |
| AttributionText             | Sets the attribution text in the @AttributionText@ variable. It can be a company name or website, for authenticity.                                 |
| BodyText1                   | @BodyText1@ stores the main text content of the notification body. It is a mandatory variable.                                                      |
| BodyText2                   | @BodyText2@ stores the secondary text content of the notification body.                                                                             |
| LogoImage                   | @LogoImage@ stores the URL or local path for the logo image in the notification. Clear or remove the variable to generate the notification with the default logo. For best experience, keep the ratio 1:1 (Horizontal:Vertical) ; Example - 300px:300px (Horizontal:Vertical)                                                             |
| HeroImage                   | @HeroImage@ stores the URL or local path for the primary image in the notification. Clear or remove the variable to generate the notification with the default image. For best experience, keep the ratio 2:1 (Horizontal:Vertical); Example - 600px:300px (Horizontal:Vertical)                                                              |
| Deadline                    | @Deadline@ stores the deadline for the notification in the format yyyy-MM-dd HH:mm:ss. To avoid prompting any deadline, the variable can either be deleted or left blank. Note that RunScriptButton and Deadline cannot be enabled at the same time. Additionally, enabling RunScriptButton will automatically disable Deadline.                                                    |
| NotificationAppName         | @NotificationAppName@ specifies the name of the application that will display the notification. Delete the variable or leave it blank to fall back to the default value. The default value is `Windows PowerShell`              |
| MaxUptimeDays               | @MaxUptimeDays@ stores the maximum uptime (in days) for the PendingRebootUptime parameter. The default is 30 days. @MaxUptimeDays@ is available for the `PendingRebootUptime` notification type. Delete the variable or leave it blank to fall back to the default value. |
| ADPasswordExpirationDays    | @ADPasswordExpirationDays@ stores the number of days before password expiration when reminders should start. The default is 7 days. The default is 30 days. @ADPasswordExpirationDays@ is available for the `ADPasswordExpiration` notification type. Delete the variable or leave it blank to fall back to the default value. |
| Repeat                      | @Repeat@ specifies how frequently the notification should repeat. Options: Once, Hourly, XXMinutes, XXHours, Daily, XXDays. Delete the variable or leave it blank to fall back to the default value. The default is `Once`.      |
| MaxOccurrences              | @MaxOccurrences@ specifies the maximum number of notifications to send before the scheduled task is automatically removed. This works in conjunction with the @Repeat@ parameter, except when @Repeat@ is set to `Once`.      |

**These variables should be set in the script running/calling this script.

## Output

- Script logs
