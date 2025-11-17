---
id: 'b6926fc9-732f-4a5e-a42d-eae36c61c033'
slug: /b6926fc9-732f-4a5e-a42d-eae36c61c033
title: 'Cisco Secure Client'
title_meta: 'Cisco Secure Client'
keywords: ['install', 'uninstall', 'umbrella', 'cisco', 'secure', 'client', 'vpn']
description: 'This solution provides automated deployment, management, and removal of Cisco Secure Client across Windows and Macintosh systems within NinjaOne.'
tags: ['installation', 'uninstallation', 'networking', 'security', 'software']
draft: false
unlisted: false
---

## Purpose

This solution provides automated deployment, management, and removal of Cisco Secure Client across Windows and Macintosh systems within NinjaOne. The solution enables organizations to centrally configure and deploy Cisco Secure Client with support for multiple modules including Core-VPN, Umbrella, ISE Posture, Network Visibility Module, ThousandEyes Endpoint, Zero Trust Access, and platform-specific modules.

The solution supports flexible deployment configurations at the Organization, Location, or Device level, allowing administrators to specify which operating systems should receive automatic deployment, which modules should be installed, and various Windows-specific settings such as system tray visibility, Add/Remove Programs visibility, and service lockdown options.

Key capabilities include:

- **Automated Deployment**: Automatically installs Cisco Secure Client modules on devices based on configured deployment settings and module selections
- **Module Management**: Supports selective installation of specific modules or installation of all available modules
- **Umbrella Integration**: Provides configuration fields for Umbrella UserID, Fingerprint, and OrgID when deploying the Umbrella module
- **Platform-Specific Options**: Windows-specific settings for system tray display, Add/Remove Programs visibility, and service lockdown
- **Module Comparison**: Pre-installation checks to compare installed modules against configured selections to determine if installation is required
- **On-Demand Operations**: Installation and uninstallation automations can be run ad-hoc on demand for immediate deployment or removal

The auto-deployment compound conditions monitor devices and automatically trigger installation when deployment is enabled and required modules are missing. Installation and uninstallation scripts are available as ad-hoc automations that can be executed on demand when immediate action is required.

## Associated Content

### Custom Fields

| Name  | Function |
| ----- | -------- |
| [cPVAL Cisco Secure Client Deployment](/docs/5fa948c8-d875-4e9e-981f-9b960724719f) | Specifies which operating system should receive Cisco Secure Client automatically. Options include Disable, All, Windows Workstations, Windows Server, Macintosh, Windows, or Windows Workstations and Macintosh. |
| [cPVAL Cisco Secure Client Modules](/docs/e6eb3845-8c47-4791-95d6-a9138e457df9) | Multi-select field to specify which modules should be installed. Selecting "All" installs every available module and overrides individual selections. |
| [cPVAL Cisco Secure Client MAC Source](/docs/e1fd56d1-def8-41e6-95bf-41c4817a6323) | Provides the download URL or local path for the .dmg file used to install Cisco Secure Client modules on Mac systems. |
| [cPVAL Cisco Secure Client Windows Source](/docs/be7067c4-47bf-4422-94d3-99ce33519996) | Provides the download URL or local path for the .zip file used to install Cisco Secure Client modules on Windows systems. |
| [cPVAL Cisco Secure Client Umbrella UserID](/docs/e2073d81-d1dc-4b70-84db-6713358ddfae) | Required when "All" or "Umbrella" module is selected. Provides the Umbrella UserID associated with your organization. |
| [cPVAL Cisco Secure Client Umbrella Fingerprint](/docs/0bbcbadf-6663-4bd4-87d3-b6f83c5ca598) | Required when "All" or "Umbrella" module is selected. Provides the Umbrella Fingerprint associated with your organization. |
| [cPVAL Cisco Secure Client Umbrella OrgID](/docs/2ec6d35c-b9fe-4791-9ba8-3783b0e912bd) | Required when "All" or "Umbrella" module is selected. Provides the Umbrella OrgID associated with your organization. |
| [cPVAL Cisco Secure Client Windows Show VPN](/docs/6e17f64e-eccc-4f67-891c-aea3798b97d3) | Checkbox to enable Core-VPN module display in the Windows system tray icon. By default, Core-VPN does not appear in the tray. Windows only. |
| [cPVAL Cisco Secure Client Windows ARP](/docs/e567d009-fc34-471c-9738-05bfed302c60) | Checkbox to hide Cisco Secure Client modules from the Add/Remove Programs section in Windows. Windows only. |
| [cPVAL Cisco Secure Client Windows Lockdown](/docs/b8b19272-05fb-475c-8837-22eade459b3a) | Checkbox to lock Cisco Secure Client services and prevent modifications by all users, including administrators. Windows only. |

### Automations

| Name | Function |
| ---- | -------- |
| [Cisco Secure Client - Package Installation [Windows]](/docs/ff9b5cb7-981d-4a25-b584-5fb486b92308) | Installs the modules selected in the Modules custom field using the installer specified in the Windows Source field. Supports HTTP/HTTPS URLs or local file paths. Can be run ad-hoc on demand. |
| [Cisco Secure Client - Module Comparison [Windows]](/docs/c79a196a-ec36-427e-9905-6610898432c9) | Compares the number of installed Cisco Secure Client modules with the number of modules selected in the Modules custom field. Used as a pre-check to determine if installation is required. |
| [Cisco Secure Client - Package Uninstallation [Windows]](/docs/f4a79d4f-1f58-4a45-a9a1-65d402ee4988) | Removes Cisco Secure Client from Windows systems by detecting installed instances in the Windows Registry and performing a silent uninstallation. Can be run ad-hoc on demand. |
| [Cisco Secure Client - Package Installation [Macintosh]](/docs/33918565-04a9-436e-84ff-f29cbdd27949) | Installs the modules selected in the Modules custom field using the installer specified in the Mac Source field. Supports HTTP/HTTPS URLs or local file paths. Can be run ad-hoc on demand. |
| [Cisco Secure Client - Module Comparison [Macintosh]](/docs/4c8a8b02-7357-4cac-8f30-c5b0814a655b) | Compares the number of installed Cisco Secure Client modules with the number of modules selected in the Modules custom field. Used as a pre-check to determine if installation is required. |
| [Cisco Secure Client - Package Uninstallation [Macintosh]](/docs/9cb4a893-f41a-486f-bc0d-f6338b510651) | Uninstalls all Cisco Secure Client modules from macOS systems using the built-in uninstaller script. Verifies successful removal and reports any remaining components. Can be run ad-hoc on demand. |

## Compound Conditions

| Name | Function |
| ---- | -------- |
| [Cisco Secure Client - Package Installation [Windows Workstation]](/docs/0f18015d-8c47-4951-b35e-c148ee3bc0a4) | Automatically runs the [Cisco Secure Client - Package Installation [Windows]](/docs/ff9b5cb7-981d-4a25-b584-5fb486b92308) automation on Windows workstations that have deployment enabled and are missing one or more of the selected modules. Recommended for `Windows Workstation Policy [Default]`. |
| [Cisco Secure Client - Package Installation [Windows Server]](/docs/27c9f936-54c1-4a1e-b2b5-137a734175a2) | Automatically runs the [Cisco Secure Client - Package Installation [Windows]](/docs/ff9b5cb7-981d-4a25-b584-5fb486b92308) automation on Windows servers that have deployment enabled and are missing one or more of the selected modules. Recommended for `Windows Server Policy [Default]`. |
| [Cisco Secure Client - Package Installation [Macintosh]](/docs/c4c269ba-6703-4110-8206-d439196cb0b7) | Automatically runs the [Cisco Secure Client - Package Installation [Macintosh]](/docs/33918565-04a9-436e-84ff-f29cbdd27949) automation on Mac computers that have deployment enabled and are missing one or more of the selected modules. Recommended for `Mac Policy [Default]`. |

## Implementation

### Step 1

Create the following custom fields as described in the document:

- [Custom Field: cPVAL Cisco Secure Client Deployment](/docs/5fa948c8-d875-4e9e-981f-9b960724719f)
- [Custom Field: cPVAL Cisco Secure Client Modules](/docs/e6eb3845-8c47-4791-95d6-a9138e457df9)
- [Custom Field: cPVAL Cisco Secure Client MAC Source](/docs/e1fd56d1-def8-41e6-95bf-41c4817a6323)
- [Custom Field: cPVAL Cisco Secure Client Windows Source](/docs/be7067c4-47bf-4422-94d3-99ce33519996)
- [Custom Field: cPVAL Cisco Secure Client Umbrella UserID](/docs/e2073d81-d1dc-4b70-84db-6713358ddfae)
- [Custom Field: cPVAL Cisco Secure Client Umbrella Fingerprint](/docs/0bbcbadf-6663-4bd4-87d3-b6f83c5ca598)
- [Custom Field: cPVAL Cisco Secure Client Umbrella OrgID](/docs/2ec6d35c-b9fe-4791-9ba8-3783b0e912bd)
- [Custom Field: cPVAL Cisco Secure Client Windows Show VPN](/docs/6e17f64e-eccc-4f67-891c-aea3798b97d3)
- [Custom Field: cPVAL Cisco Secure Client Windows ARP](/docs/e567d009-fc34-471c-9738-05bfed302c60)
- [Custom Field: cPVAL Cisco Secure Client Windows Lockdown](/docs/b8b19272-05fb-475c-8837-22eade459b3a)

### Step 2

Create the following automations as described in the document:

- [Automation: Cisco Secure Client - Package Installation [Windows]](/docs/ff9b5cb7-981d-4a25-b584-5fb486b92308)
- [Automation: Cisco Secure Client - Module Comparison [Windows]](/docs/c79a196a-ec36-427e-9905-6610898432c9)
- [Automation: Cisco Secure Client - Package Uninstallation [Windows]](/docs/f4a79d4f-1f58-4a45-a9a1-65d402ee4988)
- [Automation: Cisco Secure Client - Package Installation [Macintosh]](/docs/33918565-04a9-436e-84ff-f29cbdd27949)
- [Automation: Cisco Secure Client - Module Comparison [Macintosh]](/docs/4c8a8b02-7357-4cac-8f30-c5b0814a655b)
- [Automation: Cisco Secure Client - Package Uninstallation [Macintosh]](/docs/9cb4a893-f41a-486f-bc0d-f6338b510651)

### Step 3

Create the following compound conditions as described in the document:

- [Compound Condition: Cisco Secure Client - Package Installation [Windows Workstation]](/docs/0f18015d-8c47-4951-b35e-c148ee3bc0a4)
- [Compound Condition: Cisco Secure Client - Package Installation [Windows Server]](/docs/27c9f936-54c1-4a1e-b2b5-137a734175a2)
- [Compound Condition: Cisco Secure Client - Package Installation [Macintosh]](/docs/c4c269ba-6703-4110-8206-d439196cb0b7)

## FAQs

### Where can I obtain the Cisco Secure Client installer?

Download the latest available installer files from the [Cisco Software Download Center](https://software.cisco.com/download/home/286330811/type/282364313/release).  
**Note:** You will need to log in using your Cisco credentials to download the installer files. For Windows systems, download the `.zip` file. For Macintosh systems, download the `.dmg` file.

### How do I provide the installer to the installation scripts?

The installation scripts support two methods for providing the installer:

1. **HTTP/HTTPS URL (Recommended)**: Host the installer file on a web server, cloud storage (such as Azure Blob Storage), or file server that provides a public download URL. Store the full URL in the appropriate source custom field:
   - For Windows: Store the `.zip` file URL in [cPVAL Cisco Secure Client Windows Source](/docs/be7067c4-47bf-4422-94d3-99ce33519996)
   - For Macintosh: Store the `.dmg` file URL in [cPVAL Cisco Secure Client MAC Source](/docs/e1fd56d1-def8-41e6-95bf-41c4817a6323)

2. **Local File Path**: Provide a local file path on the target machine (e.g., `C:\Path\To\File.zip` for Windows or `/tmp/cisco-secure-client.dmg` for Mac). The file must already be present on the device before running the installation automation.

### Can I provide a local file path to the installer?

Yes, you can provide a local file path to the installer. The installation scripts support local file paths such as `C:\Path\To\File.zip` for Windows or `/tmp/cisco-secure-client.dmg` for Macintosh. However, the installer file must already be present on the target device at the specified path before running the installation automation.

### Can I provide a network UNC path to the installer?

No, the installation scripts do not support network UNC paths (e.g., `\\server\share\file.zip`) directly. However, you can work around this limitation by:

1. Using a separate automation or script to copy the installer from a network location to a local path on the target machine
2. Then providing that local path to the Cisco Secure Client installation script

Alternatively, you can host the installer on a web server or cloud storage that provides an HTTP/HTTPS download URL, which is the recommended approach.

### Why do I need to host the installer files externally?

Unlike other RMM platforms such as VSA and Automate, NinjaOne does not have a built-in file hosting mechanism for storing and distributing installer files. Therefore, you must host the Cisco Secure Client installer files on an external location that provides a public download URL accessible to your managed devices.

Common hosting options include:

- **Azure Blob Storage**: Provides secure, scalable cloud storage with public download URLs
- **File Server with Web Access**: A file server configured to serve files via HTTP/HTTPS
- **Cloud Storage Services**: Other cloud storage solutions that provide direct download links
- **Web Server**: Any web server capable of hosting and serving files via HTTP/HTTPS

The key requirement is that the hosting location must provide a publicly accessible HTTP or HTTPS URL that the installation scripts can download from.

### Is it mandatory to create all compound conditions?

No, it is not mandatory to create all compound conditions. You should only create the compound conditions that are required for your environment. For example, if you only deploy to Windows workstations, you only need to create the [Cisco Secure Client - Package Installation [Windows Workstation]](/docs/0f18015d-8c47-4951-b35e-c148ee3bc0a4) compound condition. Create compound conditions based on the operating systems and device types you need to support.

### What if I'm using different or custom agent policies instead of the recommended default policies?

If you are using different or custom agent policies (other than `Windows Workstation Policy [Default]`, `Windows Server Policy [Default]`, or `Mac Policy [Default]`), you will need to create compound conditions against those specific policies instead. The compound conditions must be assigned to the agent policies that match your environment's configuration.

### Can I execute the installation automations manually without compound conditions?

Yes, the installation automations can be executed manually without compound conditions. The [Cisco Secure Client - Package Installation [Windows]](/docs/ff9b5cb7-981d-4a25-b584-5fb486b92308) and [Cisco Secure Client - Package Installation [Macintosh]](/docs/33918565-04a9-436e-84ff-f29cbdd27949) automations can be run ad-hoc on demand. You only need to ensure that the mandatory custom fields are set before running the automation. Compound conditions are optional and are used for automatic deployment when devices meet specific criteria.

### What are the mandatory custom fields for the Windows installation script?

The mandatory custom fields for the [Cisco Secure Client - Package Installation [Windows]](/docs/ff9b5cb7-981d-4a25-b584-5fb486b92308) automation are:

- [cPVAL Cisco Secure Client Modules](/docs/e6eb3845-8c47-4791-95d6-a9138e457df9) - Required to specify which modules should be installed
- [cPVAL Cisco Secure Client Windows Source](/docs/be7067c4-47bf-4422-94d3-99ce33519996) - Required to provide the installer file path or URL

Additionally, if "All" or "Umbrella" is selected in the Modules field, the following fields become mandatory:

- [cPVAL Cisco Secure Client Umbrella UserID](/docs/e2073d81-d1dc-4b70-84db-6713358ddfae)
- [cPVAL Cisco Secure Client Umbrella Fingerprint](/docs/0bbcbadf-6663-4bd4-87d3-b6f83c5ca598)
- [cPVAL Cisco Secure Client Umbrella OrgID](/docs/2ec6d35c-b9fe-4791-9ba8-3783b0e912bd)

### What are the mandatory custom fields for the Macintosh installation script?

The mandatory custom fields for the [Cisco Secure Client - Package Installation [Macintosh]](/docs/33918565-04a9-436e-84ff-f29cbdd27949) automation are:

- [cPVAL Cisco Secure Client Modules](/docs/e6eb3845-8c47-4791-95d6-a9138e457df9) - Required to specify which modules should be installed
- [cPVAL Cisco Secure Client MAC Source](/docs/e1fd56d1-def8-41e6-95bf-41c4817a6323) - Required to provide the installer file path or URL

Additionally, if "All" or "Umbrella" is selected in the Modules field, the following fields become mandatory:

- [cPVAL Cisco Secure Client Umbrella UserID](/docs/e2073d81-d1dc-4b70-84db-6713358ddfae)
- [cPVAL Cisco Secure Client Umbrella Fingerprint](/docs/0bbcbadf-6663-4bd4-87d3-b6f83c5ca598)
- [cPVAL Cisco Secure Client Umbrella OrgID](/docs/2ec6d35c-b9fe-4791-9ba8-3783b0e912bd)

### Do I need to install Core-VPN module to install Umbrella?

Yes, the Umbrella module requires the Core-VPN module to be installed. When installing Umbrella, you must ensure that both **Core-VPN** and **Umbrella** are selected in the [cPVAL Cisco Secure Client Modules](/docs/e6eb3845-8c47-4791-95d6-a9138e457df9) custom field. If you select "All" in the Modules field, both modules will be installed automatically.

### Why is the Core-VPN module not visible in the Windows system tray?

By default, the Core-VPN module is hidden from the Windows system tray icon. This is the standard behavior of Cisco Secure Client. To make the Core-VPN module visible in the system tray, you need to enable the [cPVAL Cisco Secure Client Windows Show VPN](/docs/6e17f64e-eccc-4f67-891c-aea3798b97d3) custom field checkbox. This setting applies only to Windows systems.

### How do custom field levels work (Organization, Location, Device)?

All custom fields in this solution are available at three levels: **Organization**, **Location**, and **Device**. This allows for flexible configuration where you can set default values at the organization level, override them for specific locations, and further customize them for individual devices. Lower-level settings override higher-level settings. For example, if you set a value at the Organization level, you can override it at the Location level, and that Location value can be overridden at the Device level. This hierarchical approach enables centralized management with the flexibility to handle exceptions.

### How do I exclude a machine or location from auto-deployment?

To exclude a machine or location from auto-deployment, set the [cPVAL Cisco Secure Client Deployment](/docs/5fa948c8-d875-4e9e-981f-9b960724719f) custom field to **"Disable"** at the desired level (Location or Device). When set to "Disable," the deployment will not occur for that configuration level, effectively excluding those devices from automatic installation. The compound conditions will not trigger installation on devices where deployment is disabled, even if modules are missing.

### What happens when I select "All" in the Modules field?

When you select "All" in the [cPVAL Cisco Secure Client Modules](/docs/e6eb3845-8c47-4791-95d6-a9138e457df9) custom field, the installation script will install every available module for the target platform, regardless of any other individual module selections. This option overrides individual selections and ensures all modules are installed. Note that if "All" is selected, you must also provide the Umbrella UserID, Fingerprint, and OrgID fields since Umbrella will be included in the installation.

### What's the difference between the Module Comparison automation and the Package Installation automation?

The [Cisco Secure Client - Module Comparison](/docs/c79a196a-ec36-427e-9905-6610898432c9) automation is a pre-check script that compares the number of installed modules on a device with the number of modules selected in the Modules custom field. It does not perform any installation; it only determines if installation is required. This automation is used by the compound conditions to evaluate whether a device needs Cisco Secure Client installed. The [Cisco Secure Client - Package Installation](/docs/ff9b5cb7-981d-4a25-b584-5fb486b92308) automation actually performs the installation of the selected modules using the installer file specified in the Source custom field.

### Can I add modules to an existing installation?

Yes, you can add modules to an existing installation. Simply update the [cPVAL Cisco Secure Client Modules](/docs/e6eb3845-8c47-4791-95d6-a9138e457df9) custom field to include the additional modules you want to install, then run the installation automation again. The installation script will install any missing modules that are selected in the Modules field. The [Cisco Secure Client - Module Comparison](/docs/c79a196a-ec36-427e-9905-6610898432c9) automation will detect that additional modules are needed and can trigger the installation via compound conditions.

### What's the difference between "Windows" and "Windows Workstations" in the Deployment field?

In the [cPVAL Cisco Secure Client Deployment](/docs/5fa948c8-d875-4e9e-981f-9b960724719f) custom field, **"Windows"** includes both Windows workstations and Windows servers, while **"Windows Workstations"** only includes Windows workstation devices. Similarly, **"Windows Server"** only includes Windows server devices. Use "Windows" if you want to deploy to all Windows devices regardless of type, or use the specific options if you need different configurations for workstations versus servers.

### Can I run the installation script multiple times on the same device?

Yes, you can run the installation script multiple times on the same device. The installation script will install any modules that are selected in the Modules custom field but are not currently installed. If all selected modules are already installed, the script will typically skip installation or report that no action is needed. Running the installation script multiple times is safe and can be used to add modules to an existing installation or ensure all selected modules are present.

### How do I update Cisco Secure Client to a newer version?

To update Cisco Secure Client to a newer version, download the latest installer files from the Cisco Software Download Center and update the source URLs in the [cPVAL Cisco Secure Client Windows Source](/docs/be7067c4-47bf-4422-94d3-99ce33519996) or [cPVAL Cisco Secure Client MAC Source](/docs/e1fd56d1-def8-41e6-95bf-41c4817a6323) custom fields. Then run the installation automation again. The installation script will install the new version, which typically upgrades existing installations. Alternatively, you can uninstall the current version first using the uninstallation automation, then install the new version.

### What happens if I change the Deployment field from "All" to "Disable" after installation?

Changing the [cPVAL Cisco Secure Client Deployment](/docs/5fa948c8-d875-4e9e-981f-9b960724719f) custom field from "All" (or any deployment option) to "Disable" will prevent future automatic installations on devices at that configuration level. However, this change does not uninstall Cisco Secure Client from devices that are already installed. The installed software will remain on the devices. If you want to remove the software, you must run the [Cisco Secure Client - Package Uninstallation](/docs/f4a79d4f-1f58-4a45-a9a1-65d402ee4988) automation.

### Does the uninstallation script remove specific modules or all modules?

The [Cisco Secure Client - Package Uninstallation [Windows]](/docs/f4a79d4f-1f58-4a45-a9a1-65d402ee4988) and [Cisco Secure Client - Package Uninstallation [Macintosh]](/docs/9cb4a893-f41a-486f-bc0d-f6338b510651) automations remove all Cisco Secure Client modules from the system. They do not support selective removal of individual modules. If you need to remove specific modules, you would need to uninstall all modules and then reinstall only the modules you want to keep.

### What happens if a device is offline when the compound condition tries to run?

If a device is offline when a compound condition is evaluated, the automation will not execute. Compound conditions only trigger when devices are online and can communicate with the NinjaOne platform. Once the device comes back online and the compound condition is re-evaluated (typically during the next policy check cycle), it will detect if installation is still needed and trigger the installation automation if the conditions are met.

### How often do compound conditions run?

Compound conditions run hourly. After making any changes to the [cPVAL Cisco Secure Client Deployment](/docs/5fa948c8-d875-4e9e-981f-9b960724719f) custom field or other deployment-related custom fields, you should expect deployments to occur within one to two hours, as the compound conditions will be evaluated during the next hourly check cycle. If you need immediate deployment, you can run the installation automation manually instead of waiting for the compound condition to trigger.

### How do I verify that modules were installed correctly?

You can verify module installation by running the [Cisco Secure Client - Module Comparison](/docs/c79a196a-ec36-427e-9905-6610898432c9) automation, which will compare the installed modules against the modules selected in the Modules custom field. Additionally, on Windows systems, you can check the installed modules in the Windows Registry or Add/Remove Programs (if the ARP option is not enabled). On Mac systems, you can check the installed modules in the Applications folder or using system commands. The installation automation's activity details will also provide information about which modules were successfully installed.
