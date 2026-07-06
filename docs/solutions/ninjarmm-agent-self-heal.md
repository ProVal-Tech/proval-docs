---
id: 'e17b4631-7778-472f-8f5f-f8de33aa3529'
slug: /e17b4631-7778-472f-8f5f-f8de33aa3529
title: 'NinjaRMM Agent Self-Heal'
title_meta: 'NinjaRMM Agent Self-Heal'
keywords: ['Ninja','Service','NinjaRMMAgent','self-heal','watchdog','monitoring']
description: 'This solution provides an automated, device-resident mechanism to ensure the NinjaRMM Agent and related services remain operational and automatically recover from failures on Windows and macOS.'
tags: ['application','diagnostic','windows','mac']
draft: false
unlisted: false
last_update:
  date: 2026-07-07
---

## Purpose

This solution provides an automated, device-resident mechanism to ensure the NinjaRMM Agent and Ninja Remote services remain operational on Windows and macOS. It addresses the challenge of agents going offline due to crashed, stopped, or hung services by deploying a persistent background watchdog that operates entirely independently of the Ninja agent itself.

The solution works by configuring native OS recovery rules, deploying a code-signed monitoring script to the local disk, and registering a persistent background task (Scheduled Task on Windows, LaunchDaemon on macOS) to continuously check service health. If a service is found stopped or unresponsive, the watchdog automatically restarts it.

Key capabilities include:

* **Native Recovery Configuration:** Sets services to Automatic startup and configures native OS recovery (Windows Service Recovery / macOS `launchd` KeepAlive) to handle immediate crashes.
* **Persistent Watchdog:** Deploys a background monitoring script and registers a Scheduled Task (Windows) or LaunchDaemon (macOS) to continuously check service health at regular intervals.
* **Advanced Forced Recovery:** On Windows, if a service is completely hung or frozen, the watchdog queries the Process ID (PID) and forcefully terminates the stuck process using `taskkill` before attempting a fresh restart.
* **Immediate Remediation:** Performs an immediate check during the initial setup and attempts to start any stopped services, waiting for confirmation before finishing.
* **Cross-Platform Support:** Fully supports both Windows (Workstations and Servers) and macOS, with OS-specific optimizations.
* **Silent Operation & Log Management:** Operates silently when services are healthy to prevent log flooding. On macOS, it automatically configures `newsyslog` to rotate logs and prevent them from growing indefinitely.
* **Code Signing & Integrity:** The Windows monitoring script is fully code-signed. To preserve the digital signature block during deployment, the script is embedded as a Base64-encoded Unicode string and decoded on the target machine.

The solution uses a **Check** script to evaluate if the background watchdog is intact. If the check fails, it triggers the **Ensure** automation via a Condition to restore the monitoring setup and restart any stopped services.

## Associated Content

### Automations

| Name | Function |
| --- | --- |
| [Ensure Ninja Service is Running [Windows]](/docs/cb7a9cf6-e5ea-40db-8249-2daec21d793d) | Configures native recovery, writes the code-signed watchdog script to disk, registers the Scheduled Task, and immediately attempts to start any stopped services. |
| [Check Ninja Service Monitoring [Windows]](/docs/3ead3d67-5310-4f2c-8774-501905b8db28) | Validates that the Windows watchdog script and Scheduled Task are intact and triggers remediation if missing or corrupted. |
| [Ensure Ninja Service is Running [Macintosh]](/docs/e5f6a7b8-c9d0-4e1f-2a3b-4c5d6e7f8a9b) | Verifies native `launchd` KeepAlive, writes the watchdog script to disk, registers the LaunchDaemon, and immediately attempts to start any stopped services. |
| [Check Ninja Service Monitoring [Macintosh]](/docs/57f4f1cc-c334-4434-a6d5-d2c2cae693c7) | Validates that the macOS watchdog script, LaunchDaemon plist, and daemon load status are intact and triggers remediation if missing. |

### Conditions

| Name | Function |
| --- | --- |
| [Ensure Ninja Service is Running [Windows Workstation]](/docs/cdcae433-5abc-4e45-97f5-96cae47ad2bf) | Runs the Windows Check script every 24 hours. If the monitoring setup is broken, it triggers the Windows Ensure automation to fix it. Configured for 60-minute watchdog intervals. |
| [Ensure Ninja Service is Running [Windows Server]](/docs/2c947f35-a856-4f70-a3f2-14c95d050943) | Runs the Windows Check script every 24 hours. If the monitoring setup is broken, it triggers the Windows Ensure automation to fix it. Configured for 15-minute watchdog intervals. |
| [Ensure Ninja Service is Running [Macintosh]](/docs/1e22ec15-e4e3-4696-a115-eeb1839adeb1) | Runs the macOS Check script every 24 hours. If the monitoring setup is broken, it triggers the macOS Ensure automation to fix it. Configured for 60-minute watchdog intervals. |

## Implementation

### Step 1

Create the following automations as described in their respective documents:

* [Automation: Ensure Ninja Service is Running [Windows]](/docs/cb7a9cf6-e5ea-40db-8249-2daec21d793d)
* [Automation: Check Ninja Service Monitoring [Windows]](/docs/3ead3d67-5310-4f2c-8774-501905b8db28)
* [Automation: Ensure Ninja Service is Running [Macintosh]](/docs/e5f6a7b8-c9d0-4e1f-2a3b-4c5d6e7f8a9b)
* [Automation: Check Ninja Service Monitoring [Macintosh]](/docs/57f4f1cc-c334-4434-a6d5-d2c2cae693c7)

### Step 2

Create the following conditions as described in their respective documents:

* [Condition: Ensure Ninja Service is Running [Windows Workstation]](/docs/cdcae433-5abc-4e45-97f5-96cae47ad2bf)
* [Condition: Ensure Ninja Service is Running [Windows Server]](/docs/2c947f35-a856-4f70-a3f2-14c95d050943)
* [Condition: Ensure Ninja Service is Running [Macintosh]](/docs/1e22ec15-e4e3-4696-a115-eeb1839adeb1)

### Step 3

Apply the conditions to default NinjaRMM Agent Policies:

* Assign [Ensure Ninja Service is Running [Windows Workstation]](/docs/cdcae433-5abc-4e45-97f5-96cae47ad2bf) to the default Windows Workstation policy.
* Assign [Ensure Ninja Service is Running [Windows Server]](/docs/2c947f35-a856-4f70-a3f2-14c95d050943) to your Windows Server policy.
* Assign [Ensure Ninja Service is Running [Macintosh]](/docs/1e22ec15-e4e3-4696-a115-eeb1839adeb1) to your macOS policy.

## FAQs

### **Q.** What does the NinjaRMM Agent Self-Heal solution actually do?

**A:** It acts as a safety net for your NinjaRMM Agent. If the agent's background service crashes, stops, or gets completely frozen, this solution automatically detects the issue and restarts the service without requiring a manual intervention or a full system reboot. This ensures your devices stay online and manageable in NinjaRMM.

### **Q.** How does it know if the service is frozen or hung?

**A:** On Windows, the background watchdog doesn't just check if the service says it's "running." If a standard restart fails, it queries the service's Process ID (PID) using `sc.exe` and forcefully terminates the stuck process using `taskkill` before attempting a fresh start. This guarantees recovery even if the service is completely unresponsive.

### **Q.** How often does the background watchdog check the services?

**A:** It depends on the device type:

* **Windows Servers:** Checks every **15 minutes**.
* **Windows Workstations:** Checks every **60 minutes**.
* **macOS Devices:** Checks every **60 minutes**.

### **Q.** Will this flood my Windows Event Logs or macOS system logs?

**A:** No. The background watchdog is designed to operate silently when services are healthy. It only writes to the logs when it takes action (like restarting a service) or encounters an error. On macOS, it also automatically configures log rotation so the log file never grows out of control.

### **Q.** Where can I see the logs on a Mac?

**A:** On macOS, all diagnostic actions and errors are written to a dedicated text log file at `/var/log/ninja_selfheal.log` and are also sent to the macOS Unified Log (syslog) under the source `NinjaSelfHeal`.

### **Q.** Where can I see the logs on Windows?

**A:** On Windows, all actions are written to the Windows Application Event Log under the custom source `NinjaSelfHeal`. You can filter the event log by this source to see exactly when and why the self-heal script took action.

### **Q.** Does this replace the native Windows Service Recovery or macOS launchd KeepAlive?

**A:** No, it works alongside them. The solution first configures the native OS recovery rules (Windows Service Recovery and macOS `KeepAlive`) to handle immediate crashes instantly. The background watchdog acts as a secondary safety net to catch hung processes or scenarios where native recovery fails.

### **Q.** What if the Ninja Agent is completely offline? Will this still work?

**A:** Yes! That is the main benefit of this solution. The background watchdog (Scheduled Task or LaunchDaemon) operates entirely independently of the Ninja agent. Even if the agent is offline, the OS-level watchdog will still run, detect the stopped service, and restart it, bringing the agent back online.

### **Q.** Why is the Windows script written to disk in a weird encoded format?

**A:** The monitoring script written to the local disk is fully code-signed by ProVal to ensure trust and prevent execution issues. To preserve the digital signature block during deployment via NinjaRMM, the script is embedded in the main automation as a Base64-encoded Unicode string. It is decoded on the target machine so the resulting file remains perfectly intact and signed.

### **Q.** Can I run the "Ensure" or "Check" scripts manually?

**A:** You can run the **Ensure** scripts manually if you need to force an immediate setup or recovery on a specific device. However, the **Check** scripts are specifically engineered to operate as Conditions within your NinjaRMM policies. Running them manually is not recommended, as their output is intended to trigger automated remediation actions rather than provide direct feedback.

### **Q.** Does this solution work on both Windows and macOS?

**A:** Yes. It includes dedicated scripts and conditions for both Windows (Workstations and Servers) and macOS, utilizing OS-native mechanisms (Scheduled Tasks/Event Log for Windows, LaunchDaemons/syslog for macOS).

### **Q.** What services does this actually monitor?

**A:**

* **On Windows:** It monitors the `NinjaRMMAgent` and `ncstreamer` (Ninja Remote) services.
* **On macOS:** It monitors the `com.ninjarmm.agentd` and `com.ninjarmm.patcher` LaunchDaemons.

## Changelog

### 2026-07-07

- Initial version of the document.
