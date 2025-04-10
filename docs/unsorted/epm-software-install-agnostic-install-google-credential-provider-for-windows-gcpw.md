---
id: '98a818ba-3aa3-4ff2-af0f-576dde96c488'
slug: /98a818ba-3aa3-4ff2-af0f-576dde96c488
title: 'EPM - Software Install - Agnostic - Install Google Credential Provider for Windows (GCPW)'
title_meta: 'EPM - Software Install - Agnostic - Install Google Credential Provider for Windows (GCPW)'
keywords: ['gcpw', 'google', 'credential', 'provider', 'windows', 'installation', 'configuration', 'enrollment', 'token']
description: 'This document outlines the automated process for installing and configuring the Google Credential Provider for Windows (GCPW). It details the requirements, process steps, and parameters for setting allowed domains and enrollment tokens, ensuring a smooth setup for users.'
tags: ['installation', 'windows']
draft: true
unlisted: false
---

# Overview
This document automates the installation and configuration of the Google Credential Provider for Windows (GCPW). It sets the domains allowed for login and optionally configures an enrollment token. Enrollment tokens can be found in the Google Admin console under: Menu > Devices > Mobile and endpoints > Settings > Windows settings.

# Requirements
- PowerShell v5 or higher
- Administrative privileges are required for execution

# Process
1. Check if Google Chrome is installed. If not, install Google Chrome.
2. Check if GCPW is installed. If not, install GCPW.
3. Set the allowed domains for GCPW login by updating the registry.
4. Optionally set the enrollment token for GCPW by updating the registry.
5. Perform verification steps to ensure the registry keys for domains and the enrollment token (if provided) are correctly set.
6. Clean up installation files and log the installation process.

# Payload Usage
To install Google Chrome (if missing), GCPW (if missing), and configure it for the specified domains, use the following command:

```
./Install-GCPW.ps1 -DomainsAllowed "solarmora.com","altostrat.com"
```

To install Google Chrome (if missing), GCPW (if missing), configure it for the specified domain, and apply the enrollment token, use the following command:

```
./Install-GCPW.ps1 -DomainsAllowed "solarmora.com" -enrollmentToken "your_enrollment_token"
```

# Parameters

| Parameter          | Alias | Required | Default | Type   | Description                                         |
|--------------------|-------|----------|---------|--------|-----------------------------------------------------|
| `-DomainsAllowed`   |       | True     |         | String | Domain(s) users are allowed to sign in from.       |
| `-enrollmentToken`  |       | False    |         | String | Set token to manage GCPW from the Admin console.   |

# Output
The location of output for log, result, and error files is as follows:

```
./Install-GCPW-log.txt
./Install-GCPW-error.txt
```

# Locations

| Payload                                       | Path                                           |
|-----------------------------------------------|------------------------------------------------|
| Automate                                      |                                                |
| ConnectWise RMM                               |                                                |
| Kaseya                                        | [Install Google Credential Provider for Windows (GCPW)](/docs/2e080c81-a143-4fcb-939a-57ada1fae059) |
| Datto RMM                                     |                                                |


