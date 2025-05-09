---
id: b356a7ff-5336-480e-830c-476bee44cb98
slug: /b356a7ff-5336-480e-830c-476bee44cb98
title: 'Hardening ConnectWise Automate'
title_meta: 'Hardening ConnectWise Automate'
keywords: ['hardening', 'security', 'automation', 'firewall', 'permissions', 'tls', 'audit']
description: 'This document outlines the best practices for hardening ConnectWise Automate, including user accounts, group policy edits, internet access considerations, and critical passwords. It also covers firewall settings and TLS configurations to enhance security.'
tags: ['firewall', 'permissions', 'security', 'tls']
draft: false
unlisted: false
---

*Most of these settings apply to the ScreenConnect Server as well: [Hardening ConnectWise ScreenConnect](/docs/bd187550-7a42-4a72-b872-2a95ce698891)*

## User Accounts and Permissions

It is highly recommended that user accounts with access to the Automate server and all servers have non-privileged (non-administrator) access for their initial login. Only users who require privileged access to the Automate server, or any other server, should be provided with a SECOND individual account with ONLY the minimum level of access needed to accomplish their specific job role and function. Limiting user access ensures compliance with the STIG and reduces the overall risk exposure for the system and services provided. The assigned privileged account should NOT be used for initial login, and it is recommended that the enforcement of privileged accounts be restricted via GPO on the Automate server and across all servers.

**Best Practice:**  
Set up two user accounts for anyone logging into Active Directory or Automate:  
- One account for non-privileged access.  
- A second account for privileged access, with only the minimum level of access needed to perform their specific job role and function.  

See ProVal's Best Practice Implementation user classes: [User Class Permissions Matrix - Best Practice Config.xlsx](https://provaltech.sharepoint.com/:x:/s/ExternalSharing/EU2qgX-pK79Mmg0ibUc_2FQBzrh6-NgTqzaXosFtbgtrEw?e=Q49FyH)

## Group Policy Edits

### Restrict Network Access
```
Path:
Computer Configuration / Windows Settings / Security Settings / Local Policies / Security Options

Policy:
Network access: Do not allow anonymous enumeration of SAM accounts and shares

Value:
Enabled
```

### Disallow AutoPlay for Non-Volume Devices
```
Path:
Computer Configuration / Administrative Templates / Windows Components / AutoPlay Policies

Policy:
Disallow AutoPlay for non-volume devices

Value:
Enabled
```

### Set the Default Behavior for AutoRun
```
Path:
Computer Configuration / Administrative Templates / Windows Components / AutoPlay Policies

Policy:
Set the default behavior for AutoRun

Value:
Enabled -> Do not execute any autorun commands
```

### Turn Off AutoPlay
This setting is discussed in detail within the Certify Fundamentals course available under ConnectWise University.

Ensure that NO ONE is added to "Act as part of the operating system" in the GPO.
```
Path:
Computer Configuration / Administrative Templates / Windows Components / AutoPlay Policies

Policy:
Turn off AutoPlay

Value:
Enabled -> All drives
```

### Verify Effective Settings in the Local Group Policy Editor
```
Path:
Computer Configuration / Windows Settings / Security Settings / Local Policies / User Rights Assignment

Policy:
Act as part of the operating system

Value:
None
```

### Always Install with Elevated Privileges
```
Path:
Computer Configuration / Administrative Templates / Windows Components / Windows Installer

Policy:
Always install with elevated privileges

Value:
Disabled
```

## Internet Access Considerations
- Microsoft Windows Server administrative accounts must not be used with applications that access the Internet, such as web browsers, or with potential Internet sources, such as email.
    - Web browsers and email are common attack vectors for introducing malicious code and must not be run with an administrative account.
- If a flaw in an application is exploited while running as a privileged user, the entire system could be compromised.
- Exceptions may include HTTP(S)-based tools used for the administration of the local system, services, or attached devices. Whitelisting can be used to enforce the policy to ensure compliance.

## Ports Required for Automate (Inbound)
- **Port 75 UDP:** Utilized by the Enhanced Heartbeat.
- **Port 443 TCP:** Used for HTTPS communication.
- **Port 8484 TCP:** Must be open and forwarded to the Automate server to access the Solution Center from the Control Center.

Local machine access (127.0.0.1) on any port using any protocol should be opened (local machine access).

## Ports to Consider That Might Be Open
Some of these were optional and used for tunnels and redirectors. They do NOT impact Automate's ability to perform as an RMM.

- **Port 70 TCP:** Redirector communications without tunnels.
- **Ports 70-74 UDP:** Tunnels and redirectors.
- **Port 8002 TCP/UDP:** For tunnels, the remote agent and the Control Center must communicate with mediator.labtechsoftware.com on port 8002 TCP/UDP.
- **Ports 40000-40050 TCP:** Connecting via HTTP from the Web Control Center. Open ports beginning with 40000 and ending with four times the number of total technicians using Automate (e.g., If there are 25 technicians, then 25x4 (100) simultaneous sessions. So, ports 40000-40100 would be open).
- **Ports 40000-41000 UDP:** Tunnels and redirectors, only when advanced routers are blocking and not at the Automate server, at client and agent locations, or where the router in front of the Control Center is blocking.
- **Port 3389:** Windows RDP. This must be disabled after a ConnectWise Control client is running or there is another way to access the system. Also, ensure that the perimeter firewall is blocking port 3389 for all machines.
- **Port 3306:** MySQL. Block this port on the perimeter router. If using a single system for Automate and the database, 3306 should only be available locally. If using two separate systems, 3306 on the database machine should only be available on the private network and accessible only from the Automate machine.

## If Not Connected to Active Directory
- **Port 135:** MSRPC. Remove the firewall rule to allow TCP-135.
- **Port 139:** NetBios. Remove the firewall rule to allow TCP-139.
- **Port 445:** Microsoft-ds. Remove the firewall rule to allow TCP-445.

## Force Old TLS to Be Disabled
1. Open the Registry Editor.
2. Navigate to `HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols`.
3. TLS 1.0 or 1.1 entries do not exist in the registry by default.
4. Create a new subkey called `TLS 1.0` and/or `TLS 1.1` under Protocols.
5. Create a new subkey called `Server` under `TLS 1.0` and/or `TLS 1.1`.
6. In the `Server` key, create a DWORD `DisabledByDefault` entry and set the value to `1`.
7. Reboot the server.

## Critical Passwords
- Set the Automate system password with a minimum of 12 characters and a mix of uppercase, lowercase, numbers, and symbols.
- Set the MySQL Root password with a minimum of 12 characters and a mix of uppercase, lowercase, numbers, and symbols.

## LTShare Permissions
The LTShare permissions should only contain these groups:
- IIS AppPool\LabTech
- IIS AppPool\LabTech WebCC
- IIS AppPool\CwaRestApi
- System

Each group needs the following permissions:
- Modify
- List folder contents
- Read & Execute
- Read
- Write

## HTTP Headers
Validate that HTTP headers are not disabled. This can be done by running the following command in PowerShell:
```powershell
Get-WebConfigurationProperty -pspath machine/webroot/apphost -filter 'system.webserver/security/requestfiltering' -name 'removeServerHeader'
```

Use the following command to disable HTTP headers:
```powershell
Set-WebConfigurationProperty -pspath MACHINE/WEBROOT/APPHOST -filter "system.webServer/security/requestFiltering" -name "removeServerHeader" -value "True"
```

Verify server headers from an elevated command prompt:
```shell
curl -H 'Host:' https://localhost/aspnet_client --http1.0 -I
```

## Disable HTTP Options
1. Open the IIS Manager.
2. Click on the server name.
3. Double-click on Request Filtering.
4. Select the HTTP Verbs tab.
5. On the right side, click **Deny Verb**.
6. Type `OPTIONS`.
7. Click **OK**.

## API Integrations

### CW Control
TCP Ports 8040 and 8041 must be forwarded to the ConnectWise Control server (for alternate ports, refer to Control's Changing Default Ports documentation). If using a ConnectWise Control Cloud server, port 443 is required.

Accessing features of the ConnectWise Control solution requires the user to be associated with a user class with the following permissions.

![image](/img/docs/b356a7ff-5336-480e-830c-476bee44cb98/image1.webp)

*Original CW Documentation: [Automate Comprehensive Best Practice Guide](https://university.connectwise.com/content/userdocs/business_knowledge/Automate_Comprehensive_Best_Practice_Guide.pdf)*