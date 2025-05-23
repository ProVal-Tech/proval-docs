---
id: '2e080c81-a143-4fcb-939a-57ada1fae059'
slug: /2e080c81-a143-4fcb-939a-57ada1fae059
title: 'Install Google Credential Provider for Windows (GCPW)'
title_meta: 'Install Google Credential Provider for Windows (GCPW)'
keywords: ['gcpw', 'google', 'windows', 'credential', 'provider', 'installation', 'configuration']
description: 'This document outlines the automated procedure for installing and configuring Google Credential Provider for Windows (GCPW). It includes steps for checking prerequisites, installing necessary software, setting allowed domains for login, and configuring an optional enrollment token. Detailed logging and verification steps are also provided.'
tags: ['installation', 'setup', 'software', 'windows']
draft: false
unlisted: false
---

# Overview

This agent procedure automates the installation and configuration of Google Credential Provider for Windows (GCPW). The procedure sets the domains allowed for login and optionally configures an enrollment token. Enrollment tokens can be found in the Google Admin console under: Menu > Devices > Mobile and endpoints > Settings > Windows settings.

## Requirements

- PowerShell v5 or higher
- Administrative privileges are required for execution (the procedure runs as System)

## Process

1. Checks if Google Chrome is installed. If not, it installs Google Chrome.
2. Checks if GCPW is installed. If not, it installs GCPW.
3. Sets the allowed domains for GCPW login by updating the registry.
4. Optionally sets the enrollment token for GCPW by updating the registry.
5. Performs verification steps to ensure the registry keys for domains and the enrollment token (if provided) are correctly set.
6. Cleans up installation files and logs the installation process.

## Kaseya Implementation

**Procedure Name:** Google Credential Provider for Windows (GCPW) - Install

![Image](../../../static/img/docs/2e080c81-a143-4fcb-939a-57ada1fae059/image_1.webp)

This procedure uses two variables.

![Image](../../../static/img/docs/2e080c81-a143-4fcb-939a-57ada1fae059/image_2.webp)

| Variable          | Required | Default | Description                                                                                     |
|-------------------|----------|---------|-------------------------------------------------------------------------------------------------|
| `DomainsAllowed`  | True     |         | Specifies the domain(s) users are allowed to log in from. Accepts single domains or multiple domains. |
| `EnrollmentToken` | False    | 0       | Sets the enrollment token to manage GCPW from the Google Admin console. Leave at 0 to skip this step. |

> Example of a single domain: "solarmora.com"

> Example of multiple domains: "solarmora.com", "altostrat.com"

```
Enrollment tokens can be found in the Google Admin console under: Menu > Devices > Mobile and endpoints > Settings > Windows settings
```

# Output

Location of output for log, result, and error files.

```
Agent Procedure Log
%ProgramData%/_automation/AgentProcedure/InstallGCPW/Install-GCPW-log.txt
%ProgramData%/_automation/AgentProcedure/InstallGCPW/Install-GCPW-error.txt
```