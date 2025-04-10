---
id: bd187550-7a42-4a72-b872-2a95ce698891
slug: /bd187550-7a42-4a72-b872-2a95ce698891
title: 'Hardening ConnectWise ScreenConnect'
title_meta: 'Hardening ConnectWise ScreenConnect'
keywords: ['hardening', 'security', 'automation', 'firewall', 'permissions', 'tls', 'audit']
description: 'This document outlines the best practices for hardening ConnectWise ScreenConnect, including user accounts, group policy edits, internet access considerations, and critical passwords. It also covers firewall settings and TLS configurations to enhance security.'
tags: ['firewall', 'permissions', 'security', 'tls']
draft: false
unlisted: false
---

*Most of these settings apply to the Automate Server as well: [Hardening Automate (on-prem) Servers](/docs/b356a7ff-5336-480e-830c-476bee44cb98)*

## User Accounts and Permissions

It is highly recommended that user accounts with access to the server and all servers have non-privileged (non-administrator) access for their initial login. Only users who require privileged access to the server, or any other server, should be provided with a SECOND individual account with ONLY the minimum level of access needed to accomplish their specific job role and function. Limiting user access ensures compliance with the STIG and reduces the overall risk exposure for the system and services provided. The assigned privileged account should NOT be used for initial login, and it is recommended that the enforcement of privileged accounts be restricted via GPO on the server and across all servers.

**Best Practice:**  
Set up two user accounts for anyone logging into Active Directory or ScreenConnect:  
- One account for non-privileged access.  
- A second account for privileged access, with only the minimum level of access needed to perform their specific job role and function.

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

## Ports Required for ScreenConnect (Inbound)
- **Port 8040 TCP:** Used to serve the ScreenConnect web application.
- **Port 8041 TCP:** Used for the ScreenConnect relay.

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
- Set the system password with a minimum of 12 characters and a mix of uppercase, lowercase, numbers, and symbols.

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

## Extra Considerations
- The Web Server service is implemented as an ASP.NET application. ConnectWise ScreenConnect does not depend on Microsoft IIS, but can work on IPs/ports alongside IIS, as the same Windows subsystem is used — the HTTP.SYS kernel driver. By default, the ScreenConnect Web Server services listens on port 8040, and it communicates with the Session Manager service for session information. See [ScreenConnect Server Architecture](https://docs.connectwise.com/ConnectWise_Control_Documentation/On-premises/On-premises_knowledge_base/Server_architecture) documentation for more information
- Ensure you have an SSL Certificate setup. Noting that it does not use IIS or other web services. See [Setting up SSL for ScreenConnect](https://docs.connectwise.com/ConnectWise_Control_Documentation/On-premises/Advanced_setup/SSL_certificate_installation) documentation for how set this up

*Original CW Documentation: [ConnectWise Control Comprehensive Security Best Practice Guide](https://university.connectwise.com/content/UserDocs/Business_Knowledge/ConnectWise_Control_Comprehensive_Security_Best_Practice_Guide.pdf)*

