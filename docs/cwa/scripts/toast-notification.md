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

## File Hash
**File Path:** `C:\ProgramData\_automation\Script\New-ToastNotification\New-ToastNotification\New-ToastNotification.ps1`

**File Hash (Sha256):** `C0F7E5A29D59E1946B65648CF59661B49779252D5F9DA2DFA020D44762B74CA4`

**File Hash (MD5):** `6ABAC1DE688E93CD27001887A3F92B27`

## Sample Run
This script is a function script and should not be manually executed.
Utilize the [Toast Notification - Template](/docs/e6115fa5-78ac-4b04-8b3f-d0dd0c2e559f) to get a copy of all potential variables and paste the else section into any script that should use Prompter.

## Dependencies
[Toast Notification - Template](/docs/e6115fa5-78ac-4b04-8b3f-d0dd0c2e559f)

[Invoke-ToastNotification](/docs/426118d9-ff83-444e-9744-30a0e26cb490)

## Variables

| Name                        | Description                                                                                                                                         |
|-----------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------|
| NotificationType            | The type of notification to send. The accepted values for @NotificationType@ are generic, PendingRebootUptime, PendingRebootCheck, and ADPasswordExpiration. It is a mandatory variable.                                        |
|                             | - **Generic:** Enables a static, generic toast notification.                                                                                              |
|                             | - **PendingRebootUptime:** Displays a toast notification reminding users to restart their system after exceeding the maximum uptime.                      |
|                             | - **PendingRebootCheck:** Displays a toast notification when a pending reboot is detected through the system registry or WMI.                             |
|                             | - **ADPasswordExpiration:** Sends a toast notification to users when their Active Directory password is nearing expiration.                               |
| RebootButton                | Set @RebootButton@ to 1 to enable the `Reboot` button in the notification. Setting it to `0` or deleting the variable will disable it. @RebootButton@ is available for `Generic`, `PendingRebootUptime`, and `PendingRebootCheck` notification types. |
| LearnMoreButton             | Set @LearnMore@ to 1 to enable the `Learn More` button in the notification. Setting it to `0` or deleting the variable will disable it.             |
| LearnMoreUrl                | Set the URL to navigate by clicking the `Learn More` button in the notification. `@LearnMoreButton@` should be enabled or set to `1` to allow the `@LearnMoreUrl@` variable.                                                    |
| SnoozeButton                | Set @SnoozeButton@ to 1 to enable the `Snooze` button in the notification. Setting it to `0` or deleting the variable will disable it. The `@LearnMoreButton@` and the `@SnoozeButton@` cannot be enabled simultaneously.       |
| DismissButtonText           | Set the string in the @DismissButtonText@ variable to customize the dismiss button's text. Delete the variable or leave it blank to return to the default value, `Dismiss`.                                                     |
| TitleText                   | Sets the title of the notification in the @TitleText@ variable. It is mandatory to set this variable.                                               |
| AttributionText             | Sets the attribution text in the @AttributionText@ variable. It can be a company name or website, for authenticity.                                 |
| BodyText1                   | @BodyText1@ stores the main text content of the notification body. It is a mandatory variable.                                                      |
| BodyText2                   | @BodyText2@ stores the secondary text content of the notification body.                                                                             |
| LogoImage                   | @LogoImage@ stores the URL or local path for the logo image in the notification. Clear or remove the variable to generate the notification with the default logo.                                                               |
| HeroImage                   | @HeroImage@ stores the URL or local path for the primary image in the notification. Clear or remove the variable to generate the notification with the default image.                                                           |
| Deadline                    | @Deadline@ stores the deadline for the notification in the format yyyy-MM-dd HH:mm:ss. To avoid prompting any deadline, the variable can either be deleted or left blank.                                                       |
| NotificationAppName         | @NotificationAppName@ specifies the name of the application that will display the notification. Delete the variable or leave it blank to fall back to the default value. The default value is `Windows PowerShell`              |
| MaxUptimeDays               | @MaxUptimeDays@ stores the maximum uptime (in days) for the PendingRebootUptime parameter. The default is 30 days. @MaxUptimeDays@ is available for the `PendingRebootUptime` notification type. Delete the variable or leave it blank to fall back to the default value. |
| ADPasswordExpirationDays    | @ADPasswordExpirationDays@ stores the number of days before password expiration when reminders should start. The default is 7 days. The default is 30 days. @ADPasswordExpirationDays@ is available for the `ADPasswordExpiration` notification type. Delete the variable or leave it blank to fall back to the default value. |
| Repeat                      | @Repeat@ specifies how frequently the notification should repeat. Options: Once, Hourly, XXMinutes, XXHours, Daily, XXDays. Delete the variable or leave it blank to fall back to the default value. The default is `Once`.      |


**These variables should be set in the script running/calling this script.

## Output
- Script logs
