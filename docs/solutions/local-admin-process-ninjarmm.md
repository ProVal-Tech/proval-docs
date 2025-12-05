---
id: '11107cf4-cdb3-4d93-be1a-431ffbdce8da'
slug: /11107cf4-cdb3-4d93-be1a-431ffbdce8da
title: 'Windows - Local Admin Process'
title_meta: 'Windows - Local Admin Process'
keywords: ['local-admin', 'local-account', 'local-admin-process', 'windows-local-admin']
description: ''
tags: ['accounts', 'windows', 'security']
draft: false
unlisted: false
---

## Purpose

This solution automates the management of local administrator accounts on Windows endpoints. It facilitates the creation of a designated local admin account, enforces password policies, and performs automatic password rotation based on a configurable schedule. The solution ensures that the local admin password is kept secure and updated regularly, providing a robust mechanism for local access management.

## Associated Content

### Custom Fields

| Content | Definition Scope | Required | Type | Function |
| ------- | ---------------- | -------- | ---- | -------- |
| [cPVAL Local Admin Process](/docs/4383ab0b-5593-4e60-954d-21cf82b2499c) | `Organization`, `Location`, `Device` | True | Drop-down | Selects the operating system to enable the solution or disables it for specific devices/locations. |
| [cPVAL Local Admin Username](/docs/e1b7982c-35bc-43b4-870f-2f27f8ed582e) | `Organization`, `Location`, `Device` | True | Text | Specifies the username for the local admin account to be created or managed. |
| [cPVAL Local Admin Password Rotation Days](/docs/5a3c6f86-4e2f-425f-8178-1e76b8f85ec5) | `Organization`, `Location`, `Device` | True | Integer | Sets the number of days for automatic password rotation. |
| [cPVAL Local Admin Password](/docs/922e9ee1-9e5f-41cb-b397-62379f9ce9fc) | `Device` | False | Secure | Stores the current password for the local admin account securely. |
| [cPVAL Local Admin Default Password](/docs/6f35eac6-9d3b-454a-b37e-ab3b719d44e3) | `Organization`, `Location`, `Device` | False | Secure | Sets a static default password, overriding random generation. |
| [cPVAL Local Admin Display Name](/docs/40b4ecfd-059e-4734-b652-377781bed1b2) | `Organization`, `Location`, `Device` | False | Text | Defines the display name for the local admin account. |
| [cPVAL Local Admin Minimum Password Length](/docs/354d5885-8a36-4478-884e-cb14fcdad4d8) | `Organization`, `Location`, `Device` | False | Integer | Sets the minimum length for auto-generated passwords (Default: 14). |
| [cPVAL Local Admin Maximum Password Length](/docs/98ad71a3-d6aa-492b-ac94-71053d1c3211) | `Organization`, `Location`, `Device` | False | Integer | Sets the maximum length for auto-generated passwords (Default: Min + 5). |
| [cPVAL Local Admin Password Never Expires](/docs/28f3bc57-90ef-4976-866e-09a57c690bee) | `Organization`, `Location`, `Device` | False | Checkbox | Configures the local admin password to never expire in Windows. |
| [cPVAL Local Admin Password Update Date](/docs/d46e9ed6-3757-459f-a08e-530490f5f08c) | `Device` | False | Text | Tracks the last date the password was successfully updated. |

### Automation

| Content | Function |
| ------- | -------- |
| [Automation: Windows - Local Admin - Create/Update](/docs/309772e8-4eb7-4a06-8704-6873646ef80b) | Creates the local admin account, sets the password (random or default), and updates relevant custom fields. |
| [Automation: Windows - Local Admin - Password Rotation Check](/docs/32679339-2bb2-4d60-aa8d-47f10c52c028) | Checks if the password rotation threshold has been met and triggers a password update if necessary. |

### Compound Condition

| Content | Function |
| ------- | -------- |
| [Windows - Local Admin Process - Workstations](/docs/3fa6998e-204c-4d16-b4e5-ef2635a9a705) | Applies the process to Windows Workstations where the solution is enabled. |
| [Windows - Local Admin Process - Servers](/docs/fe19911d-851f-45f6-b450-c541ce405b8e) | Applies the process to Windows Servers where the solution is enabled. |

## Implementation

### Step 1: Create Custom Fields

Import or create the following custom fields to configure and store the local admin process data:

1. [cPVAL Local Admin Process](/docs/4383ab0b-5593-4e60-954d-21cf82b2499c)
2. [cPVAL Local Admin Username](/docs/e1b7982c-35bc-43b4-870f-2f27f8ed582e)
3. [cPVAL Local Admin Password Rotation Days](/docs/5a3c6f86-4e2f-425f-8178-1e76b8f85ec5)
4. [cPVAL Local Admin Password](/docs/922e9ee1-9e5f-41cb-b397-62379f9ce9fc)
5. [cPVAL Local Admin Default Password](/docs/6f35eac6-9d3b-454a-b37e-ab3b719d44e3)
6. [cPVAL Local Admin Display Name](/docs/40b4ecfd-059e-4734-b652-377781bed1b2)
7. [cPVAL Local Admin Minimum Password Length](/docs/354d5885-8a36-4478-884e-cb14fcdad4d8)
8. [cPVAL Local Admin Maximum Password Length](/docs/98ad71a3-d6aa-492b-ac94-71053d1c3211)
9. [cPVAL Local Admin Password Never Expires](/docs/28f3bc57-90ef-4976-866e-09a57c690bee)
10. [cPVAL Local Admin Password Update Date](/docs/d46e9ed6-3757-459f-a08e-530490f5f08c)

### Step 2: Import Automations

Import the following scripts into your script library:

1. [Automation: Windows - Local Admin - Create/Update](/docs/309772e8-4eb7-4a06-8704-6873646ef80b)
2. [Automation: Windows - Local Admin - Password Rotation Check](/docs/32679339-2bb2-4d60-aa8d-47f10c52c028)

### Step 3: Create Compound Conditions

Create the compound conditions to target the appropriate devices and apply them to your agent policies:

1. [Windows - Local Admin Process - Workstations](/docs/3fa6998e-204c-4d16-b4e5-ef2635a9a705)
2. [Windows - Local Admin Process - Servers](/docs/fe19911d-851f-45f6-b450-c541ce405b8e)

### Step 4: Enable and Configure

To activate the solution:

1. Set the **[cPVAL Local Admin Process](/docs/4383ab0b-5593-4e60-954d-21cf82b2499c)** field to `Windows Workstation`, `Windows Server`, or `Windows Workstation and Windows Server` at the Organization or Location level.
2. Define the **[cPVAL Local Admin Username](/docs/e1b7982c-35bc-43b4-870f-2f27f8ed582e)** (Required).
3. Set the **[cPVAL Local Admin Password Rotation Days](/docs/5a3c6f86-4e2f-425f-8178-1e76b8f85ec5)** to the desired rotation interval (e.g., 90).

## FAQ

### 1. How do I prevent the password from rotating automatically?

> If the **[Custom Field: cPVAL Local Admin Password Rotation Days](/docs/5a3c6f86-4e2f-425f-8178-1e76b8f85ec5)** field is left blank or set to 0, the Local Admin password will not rotate. However, it will still be set initially if a username is provided.

### 2. Can I use a specific password instead of a random one?

> Yes. If you provide a value in the **[Custom Field: cPVAL Local Admin Default Password](/docs/6f35eac6-9d3b-454a-b37e-ab3b719d44e3)**, the script will use this password instead of generating a random one during account creation.

### 3. How can I exclude a specific device from this process?

> You can exclude a device by setting the **[Custom Field: cPVAL Local Admin Process](/docs/4383ab0b-5593-4e60-954d-21cf82b2499c)** to `Disabled` at the device level. This overrides the organization or location settings.

### 4. What is the default length for the generated password?

> The default minimum password length is 14 characters. The maximum length defaults to the minimum length plus 5 characters. These can be adjusted using the **[Custom Field: cPVAL Local Admin Minimum Password Length](/docs/354d5885-8a36-4478-884e-cb14fcdad4d8)** and **[Custom Field: cPVAL Local Admin Maximum Password Length](/docs/98ad71a3-d6aa-492b-ac94-71053d1c3211)**.

### 5. Where can I find the current password for a device?

> The password is stored in the **[Custom Field: cPVAL Local Admin Password](/docs/922e9ee1-9e5f-41cb-b397-62379f9ce9fc)**. This is a secure field, and the value is used for authentication.

### 6. What happens if I don't set a Display Name?

> If the **[Custom Field: cPVAL Local Admin Display Name](/docs/40b4ecfd-059e-4734-b652-377781bed1b2)** is left blank, the script will use the username as the display name by default.

### 7. How do I ensure the password does not expire in Windows?

>Enable the **[Custom Field: cPVAL Local Admin Password Never Expires](/docs/28f3bc57-90ef-4976-866e-09a57c690bee)** checkbox. This setting ensures the password remains valid indefinitely unless manually changed or rotated by the script.

### 8. Can I update the "cPVAL Local Admin Password" field manually?

> No. The [Custom Field: cPVAL Local Admin Password](/docs/922e9ee1-9e5f-41cb-b397-62379f9ce9fc) is intended to store the password generated or verified by the automation. End users should not make changes to this field manually.

### 9. What happens if the "cPVAL Local Admin Password Rotation Days" is set to 0?

> If [Custom Field: cPVAL Local Admin Password Rotation Days](/docs/5a3c6f86-4e2f-425f-8178-1e76b8f85ec5) is set to `0` or left blank, the automatic rotation schedule is disabled. However, the script will still attempt to set the password initially if the account is being set up for the first time.

### 10. Does enabling "Password Never Expires" prevent the script from rotating the password?

> No. The [Custom Field: cPVAL Local Admin Password Never Expires](/docs/28f3bc57-90ef-4976-866e-09a57c690bee) checkbox only controls the Windows user account flag, ensuring the operating system does not force a password change prompt on login. The script will still rotate the password based on the schedule defined in [Custom Field: cPVAL Local Admin Password Rotation Days](/docs/5a3c6f86-4e2f-425f-8178-1e76b8f85ec5).

### 11. How do I force an immediate password rotation?

> To trigger an immediate rotation, you can clear the date value in [Custom Field: cPVAL Local Admin Password Update Date](/docs/d46e9ed6-3757-459f-a08e-530490f5f08cc). The automation compares the current date against this field to determine if rotation is due. Clearing it will make the system believe the password has never been set or is due for an update.

### 12. If I set a "Default Password," do the minimum and maximum length settings still apply?

> No. If a value is provided in [Custom Field: cPVAL Local Admin Default Password](/docs/6f35eac6-9d3b-454a-b37e-ab3b719d44e3), the script uses that exact password. The [Custom Field: cPVAL Local Admin Minimum Password Length](/docs/354d5885-8a36-4478-884e-cb14fcdad4d8) and [Custom Field: cPVAL Local Admin Maximum Password Length](/docs/98ad71a3-d6aa-492b-ac94-71053d1c3211) settings are only used for auto-generated passwords and are ignored when a default password is present.

### 13. Can I verify when the password was last changed without revealing the password?

> Yes. You can check the [Custom Field: cPVAL Local Admin Password Update Date](/docs/d46e9ed6-3757-459f-a08e-530490f5f08cc). This field is automatically updated by the script during password rotation and displays the last date a new password was successfully set.

### 14. What is the default password length if I do not customize it?

> If not manually configured, the default minimum password length is **14 characters**. The default maximum password length is the minimum length plus 5 characters (19 characters).

### 15. Is the "Display Name" required for the account to be created?

> No. The [Custom Field: cPVAL Local Admin Display Name](/docs/40b4ecfd-059e-4734-b652-377781bed1b2) is optional. If this field is left blank, the script will default to using the username as the display name.

### 16. Can I apply this solution only to Windows Servers and not Workstations?

> Yes. You can control the scope via the [Custom Field: cPVAL Local Admin Process](/docs/4383ab0b-5593-4e60-954d-21cf82b2499c). Select `Windows Server` from the drop-down menu to enable the solution specifically for server operating systems, or `Windows Workstation` for workstations only.

### 17. Is the "cPVAL Local Admin Username" field required for automatically rotating the password?

> Yes. The [Custom Field: cPVAL Local Admin Username](/docs/e1b7982c-35bc-43b4-870f-2f27f8ed582e) is a required field. It defines the specific account name (e.g., "Administrator" or "ITAdmin") that the solution will create or manage.

### 18. Who has permission to view the stored Local Admin Password?

> The [Custom Field: cPVAL Local Admin Password](/docs/922e9ee1-9e5f-41cb-b397-62379f9ce9fc) is configured as a **Secure** field type. Only technicians with specific permissions to view secure fields within NinjaRMM will be able to reveal the password stored in this field.

### 19. Can I use this solution to manage an existing local account?

> Yes. If the username provided in [Custom Field: cPVAL Local Admin Username](/docs/e1b7982c-35bc-43b4-870f-2f27f8ed582e) matches an existing local account, the solution will take over management of that account, including updating its password and settings according to your configuration.

### 20. What is the difference between "Script Variables" and "Custom Fields" in this solution?

> **Custom Fields** (e.g., `cPVAL Local Admin Username`) are persistent values stored in NinjaRMM. They drive the automated, scheduled maintenance of the account.
> **Script Variables** (e.g., `Local Admin Username`) are temporary inputs provided only when running the script manually (Run Now). They act as a "Manual Override" for that specific execution.

### 21. If I populate both the Custom Fields and the Script Variables, which one does the script use?

> The script prioritizes **Script Variables**. If the `Local Admin Username` script variable is populated, the script enters "Manual Override Mode" and ignores the username stored in the Custom Fields.

### 22. Can I provide *only* a Password via Script Variables while using the Username from the Custom Field?

> No. The script logic requires that if you wish to use a manual password (`Password`), you must also provide the `Local Admin Username`  variable. If the username variable is empty, the script ignores the password variable and reverts to "Automated Mode" using Custom Fields.

### 23. Does running the script manually with variables update the Custom Fields in Ninja?

> Yes, by default. If you manually run the script to set a specific username and password, the script will write those new credentials back to the `cPVAL Local Admin Username` and `cPVAL Local Admin Password` fields upon success, ensuring NinjaRMM stays in sync with the device.

### 24. How can I change the local admin password temporarily without overwriting the documentation in Ninja?

> You can use the **Do Not Update Custom Fields** script variable.
>
> * Set `Local Admin Username` and `Password` to your desired temporary credentials.
> * Set `Do Not Update Custom Fields` to `True`.
> The script will update the endpoint but will **not** save the new password to the `cPVAL Local Admin Password` field.

### 25. Why did the script fail when I provided a Script Variable Username but no Password?

> If you provide a `Local Admin Username` via script variables, you **must** also provide a `Password`. The script throws an error if the runtime username is present but the runtime password is missing, as it cannot fallback to the stored custom field password while in "Manual Override Mode".

### 26. If I use Script Variables to set a specific password, does the "Password Rotation Days" setting apply?

> No. When using Script Variables, the password rotation logic is bypassed. The script immediately sets the account to the specific password you provided, regardless of the rotation schedule or the last update date.

### 27. Does the "Password Rotation Check" script use my Script Variables?

> No. The **Windows - Local Admin - Password Rotation Check** script is a condition script designed to run automatically. It does not accept or process Script Variables. It exclusively reads from the NinjaRMM Custom Fields to determine if the password needs rotation.

### 28. What happens if I manually set a password using Script Variables, but the "Do Not Update Custom Fields" variable is checked?

> The password on the Windows device will change, but NinjaRMM will still retain the *old* password in the custom field.
>
> * **Risk:** Subsequent automatic runs might fail credential validation because the stored password no longer matches the machine password.
> * **Result:** The next time the automation runs (and rotation is due), it will likely overwrite your manual temporary password with a new, auto-generated one.

### 29. If I leave the "Display Name" script variable empty, what Display Name will be used?

> The script follows this hierarchy:
>
> 1. It checks the `Display Name` script variable.
> 2. If empty, it checks the `cPVAL Local Admin Display Name` custom field.
> 3. If both are empty, it uses the **Username** as the Display Name.

### 30. Can I use the "Password Never Expires" script variable without setting a specific username?

> No. The `Password Never Expires` script variable is only evaluated if the `Local Admin Username` script variable is also provided. If you are running in automated mode (using Custom Fields), the script looks at the `cPVAL Local Admin Password Never Expires` custom field instead.

### 31. How does the script handle Domain Controllers?

> Both the Create/Update script and the Password Rotation Check script perform a check on the `DomainRole`. If the device is detected as a Domain Controller (DomainRole >= 4), the scripts will terminate immediately or return an Exit Code 0, preventing any changes to domain accounts.