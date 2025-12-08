---
id: '0d0fda4d-0f91-4093-bb04-025117299d28'
slug: /0d0fda4d-0f91-4093-bb04-025117299d28
title: 'Enable or Disable FastBoot'
title_meta: 'Enable or Disable FastBoot'
keywords: ['fastboot', 'fast-startup', 'device-standard']
description: 'A comprehensive solution for managing Fastboot settings across Windows devices with granular control through custom fields and automated enforcement.'
tags: ['windows', 'setup']
draft: false
unlisted: false
---

## Purpose
This solution provides centralized management of Fastboot settings across Windows devices within the organization. It enables automated disabling or enabling of Fastboot on targeted devices while maintaining the flexibility to exclude specific clients, locations, or devices through custom field configuration. The solution includes manual override capabilities for complete control over settings.

## Associated Content

### Custom Field

| Name | Example | Type | Level | Required | Purpose |
|------|---------|------|-------|----------|---------|
| [cPVAL FastBoot Action](/docs/b9461be5-6fe8-4ce9-900f-4aa929fe2d78) | Enable Fast Boot and Hibernation | Dropdown | Organization, Location, Device | No | Controls Fastboot based on selected operating system |
|[cPVAL FastBoot Config Deployment](/docs/9850d788-d044-4faa-b709-953b6e01a012)| Windows Workstation and Windows Server | Dropdown | Organization, Location, Device | No | Controls Fastboot Solution deployment on selected operating system |

 
### Automation Scripts

| Name | Purpose |
|------|---------|
| [Get Fast Boot and Hibernation Status](/docs/9dc318fa-ce35-47ae-9442-f867208cde93) |Detection Script that evaluated the current fastboot configuration of the machine and matches with the specified value in Custom Field [cPVAL FastBoot Action](/docs/b9461be5-6fe8-4ce9-900f-4aa929fe2d78)|
|[Enable or Disable Fast Boot [PVAL]](/docs/9aa78588-bc01-4aab-95bd-29b5640975a2)| Remediation Script that changes the configuration of Fastboot as per the Custom Field [cPVAL FastBoot Action](/docs/b9461be5-6fe8-4ce9-900f-4aa929fe2d78) |

### Compound Conditions

| Name | Purpose |
|------|---------|
| [FastBoot Config Windows Workstations](/docs/3ac6bda9-175b-4585-b252-b7456a440cdd) | Applies fastboot Configuration to Windows workstations based on custom field settings |
| [FastBoot Config Windows Server](/docs/95088908-fbea-4007-8914-f5b49d797dfe) | Applies fastboot Configuration to Windows servers based on custom field settings |

---

## Implementation

### Step 1: Create the Custom Fields

Create [cPVAL FastBoot Action](/docs/b9461be5-6fe8-4ce9-900f-4aa929fe2d78):

- **Definition Scope:** Organization, Location, Device  
- **Type:** Dropdown  
- **Options:**  
  - Disable Fast Boot  
  - Disable Fast Boot and Hibernation  
  - Enable Fast Boot and Hibernation  
- **Default Value:** (Empty)  
- **Purpose:** Defines the target Fast Boot and Hibernation configuration.

Then create [cPVAL FastBoot Config Deployment](/docs/9850d788-d044-4faa-b709-953b6e01a012):

- **Options:** Disabled, Windows Workstation and Windows Server, Windows Workstation, Windows Server  
- **Purpose:** Determines which OS types the solution applies to.

---

### Step 2: Import Automation Scripts

Import:

1. [Get Fast Boot and Hibernation Status](/docs/9dc318fa-ce35-47ae-9442-f867208cde93)  
   - Detects current configuration  
   - Compares against [cPVAL FastBoot Action](/docs/b9461be5-6fe8-4ce9-900f-4aa929fe2d78)

2. [Enable or Disable Fast Boot [PVAL]](/docs/9aa78588-bc01-4aab-95bd-29b5640975a2)  
   - Applies the configuration selected in the custom field  [cPVAL FastBoot Action](/docs/b9461be5-6fe8-4ce9-900f-4aa929fe2d78)

---

### Step 3: Configure Compound Conditions

#### **For Windows Workstations**

- **Name:** [FastBoot Config Windows Workstations](/docs/3ac6bda9-175b-4585-b252-b7456a440cdd)  
- **Policy:** `Windows Workstation [Default]`  
- **Runs When:**  
  - [cPVAL FastBoot Config Deployment](/docs/9850d788-d044-4faa-b709-953b6e01a012) includes Workstations  
  - Detection script reports configuration drift  

#### **For Windows Servers**

- **Name:** [FastBoot Config Windows Server](/docs/95088908-fbea-4007-8914-f5b49d797dfe)  
- **Policy:** `Windows Server [Default]`  
- **Runs When:**  
  - [cPVAL FastBoot Config Deployment](/docs/9850d788-d044-4faa-b709-953b6e01a012) includes Servers  
  - Detection script reports configuration drift  

---

### Step 4: Set Organizational Default

Configure [cPVAL FastBoot Config Deployment](/docs/9850d788-d044-4faa-b709-953b6e01a012) and [cPVAL FastBoot Action](/docs/b9461be5-6fe8-4ce9-900f-4aa929fe2d78) at the **Organization** level to set your global standard.  
Override at **Location** or **Device** level when exceptions are required.

---
## FAQ

### **Q: What happens if I need to exclude specific devices from Fast Boot configuration?**
Set [cPVAL FastBoot Config Deployment](/docs/9850d788-d044-4faa-b709-953b6e01a012) to **Disabled** at the device or location level.  
The automation will ignore these devices completely.

---

### **Q: How does this solution treat different device types?**
The [cPVAL FastBoot Config Deployment](/docs/9850d788-d044-4faa-b709-953b6e01a012) field controls whether Workstations, Servers, or both should receive Fast Boot configuration enforcement.

---

### **Q: What is the difference between the Fast Boot options?**

- **Disable Fast Boot**  
  Disables Fast Startup, keeps Hibernation available.

- **Disable Fast Boot and Hibernation**  
  Disables both FastBoot and hibernation.

- **Enable Fast Boot and Hibernation**  
  Enables Fast Startup and ensures Hibernation is available.

---

### **Q: How often does the system check Fast Boot configuration?**
The assigned compound conditions run every hour as part of the device policy.  
Whenever configuration drift is detected, remediation is triggered.

---

### **Q: Can I configure different defaults for different departments or sites?**
Yes.  
Use Organization-level defaults and override at the Location or Device level as needed.

---

### **Q: Can administrators manually reverse Fast Boot configuration?**
Yes.  
They can adjust the custom field or run the remediation script manually with different parameters.

---

### **Q: Does disabling Fast Boot affect boot times?**
Yes—disabling Fast Boot may increase startup time.  
Consider this when setting organizational policy.

---
