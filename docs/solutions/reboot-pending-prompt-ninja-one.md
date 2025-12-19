---
id: 'd7758fa4-9fcc-4259-a7a5-0ca65dda10eb'
slug: /d7758fa4-9fcc-4259-a7a5-0ca65dda10eb
title: 'Reboot Pending Prompt'
title_meta: 'Reboot Pending Prompt'
keywords: ['reboot', 'reboot-pending', 'uptime', 'prompter', 'reboot-pending', 'reboot-pending-prompt']
description: 'This solution provides an automated, userFriendly mechanism to handle pending reboots on Windows Workstations within NinjaOne.'
tags: ['reboot', 'notifications', 'windows']
draft: false
unlisted: false
---

## Purpose

This solution provides an automated, user-friendly mechanism to handle pending reboots on Windows Workstations within NinjaOne. It addresses the challenge of enforcing critical updates while respecting user productivity by offering a branded, interactive GUI prompt that allows users to defer reboots up to a configurable limit.

The solution operates by detecting pending reboot states triggers (Registry keys, System Uptime, or Manual Overrides) and launching a GUI utility in the active user's session (bypassing Session 0 limitations). It supports a "Warning" phase where deferrals are allowed, and a "Final" phase where a reboot is enforced after a grace period.

Key capabilities include:

* **Interactive User Prompts**: Displays a customizable GUI window allowing users to "Yes" (Reboot Now) or "No" (Defer).
* **Deferral Enforcement**: Administrators can set a maximum number of prompts. Once exhausted, the system transitions to a mandatory reboot workflow.
* **Smart Detection**: Triggers based on Windows Registry keys (CBS/Windows Update), configurable Uptime thresholds, or admin-initiated manual overrides.
* **Branding & Customization**: Supports custom window titles, messages, header images, icon images, and dark/light themes to match organizational branding.
* **Productivity Protections**: Includes "Quiet Hours" to suppress prompts during specific times (e.g., overnight) and options to skip prompts on weekends.
* **Unattended Handling**: Configurable logic to immediately reboot machines if no user is currently logged in.

The solution uses a **Detection** script to evaluate system state and prompt eligibility, which triggers an **Autofix** script via a Compound Condition to handle the user interaction and reboot logic.

## Associated Content

### Custom Fields

| Name | Default | Example | Level | Required | Managed By |
| --- | --- | --- | --- | --- | --- |
| [cPVAL Pending Reboot](/docs/31558959-f3a5-4f4f-9388-6e7512972b01) | `False` | `True` | Device | No | Manual / Script |
| [cPVAL Last Prompted](/docs/fe3a8ca4-3722-4eaf-895a-723f8d563395) | - | `2024-05-20 14:30:00` | Device | No | Script (Auto) |
| [cPVAL Times Prompted](/docs/fded67bb-c3a3-40bb-acb1-2baa0464de45) | - | `2` | Device | No | Script (Auto) |
| [cPVAL Reboot Prompt When Pending Reboot](/docs/be5436e5-e658-4e31-a5ca-4a6bf8052278) | - | `Enable` | Org, Loc, Dev | No | Manual |
| [cPVAL Reboot Prompt Uptime Days](/docs/d38a1b1a-1620-456a-a341-2770520a8f33) | - | `14` | Org, Loc, Dev | No | Manual |
| [cPVAL Reboot Prompt Count](/docs/40cf882a-83e1-4197-b536-e6840c498d0c) | `4` | `5` | Org, Loc, Dev | No | Manual |
| [cPVAL Reboot Prompt Duration Between Prompt](/docs/2b88d214-a59b-4972-a462-121ecfc2a098) | `4` | `2` | Org, Loc, Dev | No | Manual |
| [cPVAL Reboot Prompt Title](/docs/9003db99-40e0-4450-8ce7-95e273d5c252) | `Updates Installed...` | `IT Dept: Action Req` | Org, Loc, Dev | No | Manual |
| [cPVAL Reboot Prompt Message](/docs/96249acb-33f6-42ac-bcc1-d37266533397) | (Script Gen) | `Security patches installed.` | Org, Loc, Dev | No | Manual |
| [cPVAL Reboot Prompt Timeout](/docs/cb8acc9e-06df-4408-b986-a35e8cc23cff) | `300` | `60` | Org, Loc, Dev | No | Manual |
| [cPVAL Final Prompt Message](/docs/02ca99e5-85be-4e2e-a77b-3cd94be65566) | (Script Gen) | `Deferrals exhausted.` | Org, Loc, Dev | No | Manual |
| [cPVAL Final Prompt Timeout](/docs/02cc7b8d-28aa-46c6-936b-21786c56206e) | `900` | `120` | Org, Loc, Dev | No | Manual |
| [cPVAL Final Prompt Reboot Delay Minutes](/docs/58e81186-a952-40e6-8f06-ad485c52ef2a) | `5` | `10` | Org, Loc, Dev | No | Manual |
| [cPVAL Reboot Prompt Header Image](/docs/93363322-3d61-484b-abbd-eb5e28bfb6df) | - | `https://site.com/logo.png` | Org, Loc, Dev | No | Manual |
| [cPVAL Reboot Prompt Icon Image](/docs/27c3c19d-d5cb-46ae-97e7-605e682df948) | - | `C:\Logos\icon.ico` | Org, Loc, Dev | No | Manual |
| [cPVAL Reboot Prompt Theme](/docs/1cef781e-295c-4cf5-aca5-bea0de5537fc) | `Dark` | `Light` | Org, Loc, Dev | No | Manual |
| [cPVAL Reboot Prompt Skip Weekends](/docs/01773daf-c7be-4d03-ab86-8b81cc939a83) | `Disable` | `Enable` | Org, Loc, Dev | No | Manual |
| [cPVAL Reboot Prompt Suppress Time Window](/docs/12775f61-616e-4157-9f47-4623433bf68d) | - | `1800-0900` | Org, Loc, Dev | No | Manual |
| [cPVAL Reboot if Not Logged In](/docs/c1c1cb99-496a-4b3a-9a9c-e0fdf7ee4562) | `Disable` | `Enable` | Org, Loc, Dev | No | Manual |

### Automations

| Name | Function |
| --- | --- |
| [Reboot Pending Prompt - Detection](/docs/9817ce6b-6f8c-4718-844f-4f44f6c66376) | Determines if a machine requires a reboot (Registry, Uptime, or Manual) and if current conditions (Quiet hours, Weekends, User active) allow for a prompt. Returns a specific exit code to trigger the Autofix. |
| [Reboot Pending Prompt - Autofix](/docs/7e3688a0-9f8f-40cf-9239-0e3593a84ba8) | Downloads the `Prompter.exe` GUI utility and launches it in the user's active session. Handles user interaction (Deferral vs. Forced) and updates the state-tracking Custom Fields. |

## Compound Conditions

| Name | Function |
| --- | --- |
| [Reboot Pending Prompt - Windows Workstation](/docs/b540cb53-0d54-4d63-9ce4-073732fd1aa3) | Automatically runs the [Reboot Pending Prompt - Autofix](/docs/7e3688a0-9f8f-40cf-9239-0e3593a84ba8) automation when the [Detection](/docs/9817ce6b-6f8c-4718-844f-4f44f6c66376) script identifies that a reboot is pending and a user prompt is required. |

## Implementation

### Step 1

Create the following custom fields as described in the document:

* [Custom Field: cPVAL Pending Reboot](/docs/31558959-f3a5-4f4f-9388-6e7512972b01)
* [Custom Field: cPVAL Last Prompted](/docs/fe3a8ca4-3722-4eaf-895a-723f8d563395)
* [Custom Field: cPVAL Times Prompted](/docs/fded67bb-c3a3-40bb-acb1-2baa0464de45)
* [Custom Field: cPVAL Reboot Prompt When Pending Reboot](/docs/be5436e5-e658-4e31-a5ca-4a6bf8052278)
* [Custom Field: cPVAL Reboot Prompt Uptime Days](/docs/d38a1b1a-1620-456a-a341-2770520a8f33)
* [Custom Field: cPVAL Reboot Prompt Count](/docs/40cf882a-83e1-4197-b536-e6840c498d0c)
* [Custom Field: cPVAL Reboot Prompt Duration Between Prompt](/docs/2b88d214-a59b-4972-a462-121ecfc2a098)
* [Custom Field: cPVAL Reboot Prompt Title](/docs/9003db99-40e0-4450-8ce7-95e273d5c252)
* [Custom Field: cPVAL Reboot Prompt Message](/docs/96249acb-33f6-42ac-bcc1-d37266533397)
* [Custom Field: cPVAL Reboot Prompt Timeout](/docs/cb8acc9e-06df-4408-b986-a35e8cc23cff)
* [Custom Field: cPVAL Final Prompt Message](/docs/02ca99e5-85be-4e2e-a77b-3cd94be65566)
* [Custom Field: cPVAL Final Prompt Timeout](/docs/02cc7b8d-28aa-46c6-936b-21786c56206e)
* [Custom Field: cPVAL Final Prompt Reboot Delay Minutes](/docs/58e81186-a952-40e6-8f06-ad485c52ef2a)
* [Custom Field: cPVAL Reboot Prompt Header Image](/docs/93363322-3d61-484b-abbd-eb5e28bfb6df)
* [Custom Field: cPVAL Reboot Prompt Icon Image](/docs/27c3c19d-d5cb-46ae-97e7-605e682df948)
* [Custom Field: cPVAL Reboot Prompt Theme](/docs/1cef781e-295c-4cf5-aca5-bea0de5537fc)
* [Custom Field: cPVAL Reboot Prompt Skip Weekends](/docs/01773daf-c7be-4d03-ab86-8b81cc939a83)
* [Custom Field: cPVAL Reboot Prompt Suppress Time Window](/docs/12775f61-616e-4157-9f47-4623433bf68d)
* [Custom Field: cPVAL Reboot if Not Logged In](/docs/c1c1cb99-496a-4b3a-9a9c-e0fdf7ee4562)

### Step 2

Create the following automations as described in the document:

* [Automation: Reboot Pending Prompt - Detection](/docs/9817ce6b-6f8c-4718-844f-4f44f6c66376)
* [Automation: Reboot Pending Prompt - Autofix](/docs/7e3688a0-9f8f-40cf-9239-0e3593a84ba8)

### Step 3

Create the following compound conditions as described in the document:

* [Compound Condition: Reboot Pending Prompt - Windows Workstation](/docs/b540cb53-0d54-4d63-9ce4-073732fd1aa3)

Here are the FAQs for the **Reboot Pending Prompt** solution. I have written them in simple, clear language to ensure anyone can understand how to configure and use the solution, while covering all technical aspects.

## FAQs

### **Q.** What does the Reboot Pending Prompt solution actually do?

**A:** It helps you get Windows computers to restart when they need to (like after updates), but it asks the user nicely first. Instead of just forcing a restart while someone is working, it shows a popup window asking if they want to reboot now or later. You can control how many times they can say "later" before they have to restart. See the [Solution: Reboot Pending Prompt](/docs/d7758fa4-9fcc-4259-a7a5-0ca65dda10eb) overview for more.

### **Q.** How does the system know when a computer needs a reboot?

**A:** The system checks three things automatically:

1. **Windows Registry:** It looks for specific "flags" that Windows sets when updates are waiting for a restart.
2. **Uptime:** It checks how long the computer has been running without a restart. You set this limit in [cPVAL Reboot Prompt Uptime Days](/docs/d38a1b1a-1620-456a-a341-2770520a8f33).
3. **Manual Override:** You can force it to think a reboot is needed by checking the [cPVAL Pending Reboot](/docs/31558959-f3a5-4f4f-9388-6e7512972b01) box.

### **Q.** Can I force a reboot prompt even if Windows doesn't say it needs one?

**A:** Yes! If you want to force a prompt cycle on a specific machine for any reason, simply check the box for [cPVAL Pending Reboot](/docs/31558959-f3a5-4f4f-9388-6e7512972b01). The detection script will see this and start the prompting process immediately.

### **Q.** How many times can a user say "No" to the reboot?

**A:** You decide! By default, they can snooze it **4 times**. You can change this number by editing the [cPVAL Reboot Prompt Count](/docs/40cf882a-83e1-4197-b536-e6840c498d0c) field. For example, if you set it to 2, they get two warnings, and the third prompt will be the final one.

### **Q.** What happens when the user runs out of "Snoozes"?

**A:** Once the [cPVAL Times Prompted](/docs/fded67bb-c3a3-40bb-acb1-2baa0464de45) hits the limit you set, the next prompt will be the **Final Prompt**. This window does not have a "No" button—only an "OK" button. It tells them the computer *will* restart soon, giving them time to save their work.

### **Q.** How long do they have to save their work during the Final Prompt?

**A:** After they click "OK" on the final prompt (or if it times out), the computer waits for a grace period before restarting. The default is **5 minutes**. You can make this longer or shorter using [cPVAL Final Prompt Reboot Delay Minutes](/docs/58e81186-a952-40e6-8f06-ad485c52ef2a).

### **Q.** What if the user ignores the prompt and walks away?

**A:** The prompt has a timer!

* **Warning Prompts:** If the timer runs out (Default: 5 mins), it assumes the user is busy or away. It counts as a "Snooze" (deferral) and closes the window so it doesn't block the screen. Change this duration in [cPVAL Reboot Prompt Timeout](/docs/cb8acc9e-06df-4408-b986-a35e8cc23cff).
* **Final Prompt:** If the timer runs out here (Default: 15 mins), it assumes the user isn't there, and it **forces the reboot** to ensure the machine gets patched. Change this in [cPVAL Final Prompt Timeout](/docs/02cc7b8d-28aa-46c6-936b-21786c56206e).

### **Q.** I don't want to bother users at night. Can I stop the prompts?

**A:** Yes. You can set a "Quiet Window" using [cPVAL Reboot Prompt Suppress Time Window](/docs/12775f61-616e-4157-9f47-4623433bf68d). For example, entering `1800-0900` tells the system: "Do not show any prompts between 6:00 PM and 9:00 AM."

### **Q.** Can I stop the prompts from happening on weekends?

**A:** Yes. Just set the [cPVAL Reboot Prompt Skip Weekends](/docs/01773daf-c7be-4d03-ab86-8b81cc939a83) dropdown to **Enable**. The system will wait until Monday to ask for a reboot.

### **Q.** What happens if nobody is logged into the computer?

**A:** If the computer is sitting at the login screen (no user is signed in), you can tell the system to just reboot immediately without waiting for a prompt. To do this, set [cPVAL Reboot if Not Logged In](/docs/c1c1cb99-496a-4b3a-9a9c-e0fdf7ee4562) to **Enable**.

### **Q.** Can I customize the message the user sees?

**A:** Absolutely. You can write your own friendly message in [cPVAL Reboot Prompt Message](/docs/96249acb-33f6-42ac-bcc1-d37266533397).

* *Note:* Keep it simple! The script automatically adds the "Would you like to restart?" question and the "You have X attempts remaining" text to the end of whatever you write.

### **Q.** Can I customize the "Final Warning" message separately?

**A:** Yes. You can set a specific, more urgent message for the last step using [cPVAL Final Prompt Message](/docs/02ca99e5-85be-4e2e-a77b-3cd94be65566).

* *Note:* The script automatically adds the "Your computer will restart in X minutes" text to the end of your message.

### **Q.** How do I add my company logo to the prompt?

**A:** You can add a header image (top of the window) or an icon (top left corner).

1. Upload your image to a public URL (like your website) or copy it to a local folder on every machine.
2. Paste the URL or file path into [cPVAL Reboot Prompt Header Image](/docs/93363322-3d61-484b-abbd-eb5e28bfb6df) or [cPVAL Reboot Prompt Icon Image](/docs/27c3c19d-d5cb-46ae-97e7-605e682df948).

### **Q.** Does the prompt look okay in Dark Mode?

**A:** Yes! You can choose the theme. By default, it uses a **Dark** theme, which looks modern and clean. If you prefer a white background with dark text, set [cPVAL Reboot Prompt Theme](/docs/1cef781e-295c-4cf5-aca5-bea0de5537fc) to **Light**.

### **Q.** How often does the prompt pop up?

**A:** If the user clicks "No," the system waits a few hours before asking again so it doesn't spam them. The default wait time is **4 hours**. You can change this gap using [cPVAL Reboot Prompt Duration Between Prompt](/docs/2b88d214-a59b-4972-a462-121ecfc2a098).

### **Q.** Can I set these settings for the whole company at once?

**A:** Yes. All the settings (like [cPVAL Reboot Prompt Count](/docs/40cf882a-83e1-4197-b536-e6840c498d0c) or [cPVAL Reboot Prompt Title](/docs/9003db99-40e0-4450-8ce7-95e273d5c252)) can be set at the **Organization** level in NinjaOne.

### **Q.** Can I have different settings for just one Location or Device?

**A:** Yes. The system checks the Device first, then the Location, then the Organization. This means if you set a special message on *one specific computer*, that computer will use the special message, and everyone else will use the company default.

### **Q.** Does this work on Servers?

**A:** This solution is designed for **Windows Workstations** (Windows 10/11). Servers usually have strict maintenance windows, so prompting a logged-in admin is rarely the desired behavior. The scripts have checks to ensure they run on the correct OS.

### **Q.** Does this work on Macs?

**A:** No, this specific solution is built using PowerShell and Windows forms, so it only works on **Windows** computers.

### **Q.** Should I run the "Detection" script manually?

**A:** No. The [Reboot Pending Prompt - Detection](/docs/9817ce6b-6f8c-4718-844f-4f44f6c66376) script is meant to run automatically as a "Condition" in your NinjaOne policy. It runs silently in the background to check if a reboot is needed.

### **Q.** Should I run the "Autofix" script manually?

**A:** No. The [Reboot Pending Prompt - Autofix](/docs/7e3688a0-9f8f-40cf-9239-0e3593a84ba8) script expects to be triggered by the Detection script. It relies on specific logic to calculate how many prompts are left. Running it manually might not work as expected or could trigger a prompt when one isn't needed.

Here is the updated FAQ answer with the requested point clarified to explain that the prompt waits for the user to return to the screen.

### **Q.** Why is the prompt not showing up on my computer?

**A:** There could be a few reasons:

1. **Not Needed:** The computer might not actually need a reboot (check [cPVAL Pending Reboot](/docs/31558959-f3a5-4f4f-9388-6e7512972b01) is false).
2. **Too Soon:** You might have clicked "No" recently. Check [cPVAL Last Prompted](/docs/fe3a8ca4-3722-4eaf-895a-723f8d563395) to see when the last prompt was.
3. **Quiet Time:** It might be night time or the weekend (check [cPVAL Reboot Prompt Suppress Time Window](/docs/12775f61-616e-4157-9f47-4623433bf68d)).
4. **User Away (Locked/Screensaver):** If the computer is locked or the screensaver is running, the system knows a user is logged in but is not currently looking at the screen. It blocks the prompt to ensure the user doesn't miss it or come back to a timer that has already run out. It will retry when the user unlocks the machine.

### **Q.** How do I see how many times a specific user has been prompted?

**A:** Look at the [cPVAL Times Prompted](/docs/fded67bb-c3a3-40bb-acb1-2baa0464de45) field on their device in NinjaOne. It counts up every time they click "No."

### **Q.** How do I reset the counter for a device?

**A:** The script does this automatically when the computer finally reboots! You don't need to do it manually. However, if you really want to, you can edit the [cPVAL Times Prompted](/docs/fded67bb-c3a3-40bb-acb1-2baa0464de45) field and set it back to `0`.

### **Q.** Can I disable the Uptime check?

**A:** Yes. If you don't care about uptime and only want to prompt for Windows Updates, set [cPVAL Reboot Prompt Uptime Days](/docs/d38a1b1a-1620-456a-a341-2770520a8f33) to `0`.

### **Q.** What if I don't want to check the Registry for pending reboots?

**A:** You can disable the registry check by changing [cPVAL Reboot Prompt When Pending Reboot](/docs/be5436e5-e658-4e31-a5ca-4a6bf8052278) to **Disable**. Then it will only prompt based on uptime or manual overrides.

### **Q.** Where does the popup window application come from?

**A:** The script automatically downloads a small, safe utility called `Prompter.exe` from ProVal's repository. It saves it to a temporary folder on the computer, runs it to show the window.

### **Q.** Why does the script use a Scheduled Task?

**A:** NinjaOne scripts run in the "System" background (Session 0), which can't show windows to users. To get around this, the script creates a temporary Scheduled Task that says "Hey Windows, please show this window to the user currently logged in!" This makes sure the user actually sees the prompt.

### **Q.** Can I change the title of the window?

**A:** Yes. The default title is "Updates Installed - Reboot Required", but you can change it to anything (like "IT Department Message") using [cPVAL Reboot Prompt Title](/docs/9003db99-40e0-4450-8ce7-95e273d5c252).

### **Q.** What is the default setup if I don't change anything?

**A:** By default:

* **Frequency:** It asks the user 4 times (every 4 hours).
* **Forced Reboot:** It waits 5 minutes before force rebooting on the final prompt.
* **Theme:** It uses a Dark Theme.
* **Title:** "Updates Installed - Reboot Required"
* **Message:** "An update has been installed on your computer. Would you like to restart now to complete the installation of updates? You have `{X}` prompt(s) remaining before a forced reboot. Next prompt will be sent in {Y} hours."
* **Final Message:** "An update has been installed on your computer. This is the final prompt before your computer will automatically restart to complete the installation of updates. Please save your work. Your computer will be restarted after `{X}` minute(s) after you acknowledge this prompt."

### **Q.** I manually rebooted the computer, but the fields didn't reset. Why?

**A:** The fields update the *next* time the Detection script runs. After a reboot, the Detection script will run, see that the computer uptime is low and no registry keys are set, and it will automatically clear [cPVAL Pending Reboot](/docs/31558959-f3a5-4f4f-9388-6e7512972b01) and reset the counters for you.

Here are the additional FAQs covering the enablement logic and integration with other solutions.

### **Q.** Is this solution enabled automatically for all my devices?

**A:** No. The solution is **opt-in** to prevent unexpected interruptions. You must explicitly enable it by configuring at least one of the trigger fields at the Organization, Location, or Device level:

1. **Registry Check:** Set [cPVAL Reboot Prompt When Pending Reboot](/docs/be5436e5-e658-4e31-a5ca-4a6bf8052278) to **Enable**.
2. **Uptime Check:** Set [cPVAL Reboot Prompt Uptime Days](/docs/d38a1b1a-1620-456a-a341-2770520a8f33) to a number greater than `0`.
3. **Manual Override:** Check the [cPVAL Pending Reboot](/docs/31558959-f3a5-4f4f-9388-6e7512972b01) box (Device level only).

### **Q.** What happens if another script or solution checks the "cPVAL Pending Reboot" box?

**A:** That will automatically trigger the reboot prompt cycle! This solution is designed to act as a **central reboot manager** for your entire NinjaRMM environment.

If a software installation script, a patching automation, or a maintenance task flags the [cPVAL Pending Reboot](/docs/31558959-f3a5-4f4f-9388-6e7512972b01) field, this solution takes over. Instead of that other script forcing a hard reboot, this solution detects the flag and gracefully prompts the user according to your defined policy (snoozes, quiet hours, branding, etc.). This ensures a consistent, user-friendly experience regardless of what task initiated the reboot request.
