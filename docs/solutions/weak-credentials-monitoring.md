---
id: '7d087aad-e93d-45d6-bc30-b31f8e78d6e6'
slug: /7d087aad-e93d-45d6-bc30-b31f8e78d6e6
title: 'Weak Credentials Monitoring'
title_meta: 'Weak Credentials Monitoring'
keywords: ['weak-password', 'duplicate-password', 'weak-credential', 'domain']
description: 'This solution monitors Active Directory domains for weak and duplicate passwords, automatically running daily audits on Primary Domain Controllers and generating ConnectWise Manage tickets when new weak credentials are detected.'
tags: ['auditing', 'alerting', 'domain', 'security']
draft: false
unlisted: false
---

## Purpose

This solution monitors Active Directory domains for weak and duplicate passwords. It automatically runs daily password audits on Primary Domain Controllers and generates ConnectWise Manage tickets when new weak or duplicate credentials are detected, helping maintain security compliance and identify accounts that require password updates.

## Prerequisites

The [Server Roles Detection and Grouping for NinjaOne](/docs/56ed4b40-11ce-4f8d-b1ca-c897d2c496e6) solution should be installed in the environment to enable this solution, as the compound condition uses the [cPVAL Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba) custom field, which is populated by that solution.

## Associated Content

### Custom Fields

| Content | Definition Scope | Required | Type | Applicable OS | Function |
| ------- | ---------------- | -------- | ---- | ------------- | -------- |
| [cPVAL Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba) | `Device` | True | Text | Windows | Stores the list of roles detected on a Windows server (from Server Roles Detection solution) |
| [cPVAL Weak Credentials Audit](/docs/35c7cb4a-f876-4186-8336-c95878622a04) | `Device` | True | WYSIWYG | Windows | Stores details of weak and duplicate password credentials identified by the automation |
| [cPVAL Enable Weak Credentials Monitoring](/docs/60a8bed6-fe7e-49b9-b0b9-d4d4e79cf769) | `Organization` | True | Checkbox | All | Enable this checkbox to activate weak credential monitoring for the client's domain |

### Automation

| Content | Function |
| ------- | -------- |
| [Test Weak Password [Domain]](/docs/4fef2f0f-be91-4448-862e-9c91b2673016) | Performs Active Directory password auditing with intelligent alerting, detecting weak and duplicate passwords on Primary Domain Controllers |

### CW Manage Ticket Template

| Content | Function |
| ------- | -------- |
| [Weak AD Passwords](/docs/f53572a8-8bfe-4962-b28f-b3b6052e9ed2) | Configures how tickets are generated in ConnectWise Manage when weak credentials are detected |

### Compound Condition

| Content | Function |
| ------- | -------- |
| [Weak Credentials Monitoring](/docs/4e7c3666-86ba-458c-80e8-3c7ecb390518) | Runs the automation daily on Primary Domain Controllers and creates a CW Manage ticket when a new weak or duplicate password is detected |

## Implementation

### Step 1: Install Prerequisites

Ensure the [Server Roles Detection and Grouping for NinjaOne](/docs/56ed4b40-11ce-4f8d-b1ca-c897d2c496e6) solution is installed, as it provides the [cPVAL Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba) custom field required by this solution.

### Step 2: Create Custom Fields

1. [cPVAL Weak Credentials Audit](/docs/35c7cb4a-f876-4186-8336-c95878622a04)
2. [cPVAL Enable Weak Credentials Monitoring](/docs/60a8bed6-fe7e-49b9-b0b9-d4d4e79cf769)

### Step 3: Import Automation

Import the [Test Weak Password [Domain]](/docs/4fef2f0f-be91-4448-862e-9c91b2673016) automation.

### Step 4: Configure Ticket Template

If using ConnectWise Manage:

1. Ensure the ConnectWise Manage app is enabled and connected
2. Configure the [Weak AD Passwords](/docs/f53572a8-8bfe-4962-b28f-b3b6052e9ed2) ticket template  
   >*Verify field mappings with your consultant as environments vary*

If using a different ticketing system, create an equivalent ticket template for that platform.

### Step 5: Create Compound Condition

Create the [Weak Credentials Monitoring](/docs/4e7c3666-86ba-458c-80e8-3c7ecb390518) compound condition and apply it to the `Windows Server Policy [Default]` agent policy.  
>*If the partner uses a separate policy for domain controllers or primary domain controllers, apply the condition to that policy instead.*  
>*If not using ConnectWise Manage, configure the notification tab in the compound condition to use the ticket template created in Step 4 for your ticketing system.*  

### Step 6: Enable Monitoring

Enable weak credentials monitoring for each organization by checking the [cPVAL Enable Weak Credentials Monitoring](/docs/60a8bed6-fe7e-49b9-b0b9-d4d4e79cf769) custom field at the organization level.

## FAQ

### 1. Why does the automation need to run on a Primary Domain Controller (PDC)?

The automation must run on a server with the Primary Domain Controller role (DomainRole = 5) because Active Directory password data is only accessible on the PDC. The script automatically validates this requirement and will terminate with exit code 0 if the PDC role is not detected on the target server.

### 2. How often does the password audit run?

The compound condition runs the [Test Weak Password [Domain]](/docs/4fef2f0f-be91-4448-862e-9c91b2673016) automation once per day on Primary Domain Controllers. Tickets are only generated when new weak or duplicate passwords are detected, preventing redundant alerting for issues already reported.

### 3. When are tickets generated?

Tickets are generated only when new weak or duplicate passwords are detected that were not present in the previous scan. The script uses intelligent comparison logic to compare current results against previously stored audit data. If no previous results exist (first run), all detected issues are considered "new" and will trigger ticket generation.

### 4. What dictionary size should I use?

The automation supports four dictionary sizes:

- **Tiny** (3 MB): Default option, suitable for most environments
- **Small** (58 MB): Provides more comprehensive checking
- **Medium** (253 MB): Enhanced coverage for sensitive environments
- **Large** (2.9 GB): Most comprehensive but requires minimum 20 GB free disk space

Larger dictionaries provide more thorough password checking but require more disk space and download time. The dictionary size can be configured in the automation's runtime parameters.

### 5. Where can I view the audit results?

Audit results are displayed in the [cPVAL Weak Credentials Audit](/docs/35c7cb4a-f876-4186-8336-c95878622a04) custom field on the Primary Domain Controller device. This field shows:

- Current security configuration state (reversible encryption, interactive logon messages)
- All detected duplicate passwords
- All detected weak passwords
- Data collection timestamp

The custom field is updated on every execution, regardless of whether new issues are detected.

### 6. What do the exit codes mean?

- **Exit Code 0**: No new issues detected (or no issues exist). The compound condition will not generate tickets.
- **Exit Code 1**: New weak or duplicate passwords detected. The compound condition will generate tickets.
- **Exit Code 2**: Script execution error. This can occur due to:
  - PDC role validation failure
  - Insufficient disk space (when using Large dictionary)
  - Download failures (if no cached script exists)
  - Execution validation failures

### 7. Can I run the automation manually?

Yes, you can execute the [Test Weak Password [Domain]](/docs/4fef2f0f-be91-4448-862e-9c91b2673016) automation manually on any Primary Domain Controller to perform an immediate password audit. The results will be displayed in the custom field.

### 8. What are the system requirements?

The automation requires:

- Primary Domain Controller (PDC) role (DomainRole = 5)
- Active Directory PowerShell module
- Internet connectivity (for initial script download, optional for subsequent runs with cached script)
- Minimum 20 GB free disk space (if using Large dictionary size)
- TLS 1.2 or 1.3 support (for script download)

### 9. Why aren't tickets being generated for known weak passwords?

The solution uses intelligent alerting logic to prevent duplicate tickets. Tickets are only generated when new weak or duplicate passwords are detected that were not present in the previous scan. This prevents redundant alerting for issues that have already been reported. All detected issues (both new and existing) are still displayed in the [cPVAL Weak Credentials Audit](/docs/35c7cb4a-f876-4186-8336-c95878622a04) custom field.

### 10. How do I enable monitoring for a specific organization?

Enable weak credentials monitoring for each organization by checking the [cPVAL Enable Weak Credentials Monitoring](/docs/60a8bed6-fe7e-49b9-b0b9-d4d4e79cf769) custom field at the organization level. The compound condition will only run the automation on Primary Domain Controllers where this field is enabled.

### 11. Can I customize the password checking?

The password checking is performed by the agnostic [Test-WeakCredentials](/docs/9188a8e9-ba15-45aa-9391-d412866b1ebc) script, which checks for weak passwords matching common dictionary patterns and identifies duplicate passwords across multiple user accounts. The dictionary size can be adjusted via the automation's runtime parameters, but the core checking logic is handled by the underlying script.
