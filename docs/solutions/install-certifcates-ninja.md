---
id: '12034de3-aa3a-4f6c-89da-a6f229e6fbec'
slug: /12034de3-aa3a-4f6c-89da-a6f229e6fbec
title: 'Install Certificates - Windows/Mac'
title_meta: 'Install Certificates - Windows/Mac'
keywords: ['certificate', 'windows', 'mac', 'install', 'root', 'trusted', 'keychain', 'location']
description: 'Manages the deployment of certificates to supported operating systems'
tags: ['installation', 'security', 'setup']
draft: false
unlisted: false
last_update:
  date: 2026-09-28
---

## Purpose

This solution manages the deployment of certificates to supported operating systems using **NinjaOne custom fields** and automated deployment conditions.

The solution supports the following platforms:

* **Windows Workstations**
* **Windows Servers**
* **macOS**

Users can centrally configure the certificate download URL, the certificate store or keychain location, and the operating systems on which the certificate should be deployed. The appropriate automation is then triggered automatically based on the endpoint's operating system and deployment configuration.

### Key Capabilities

1. **Platform Support**

   The solution is designed for **Windows Workstations, Windows Servers, and macOS endpoints**.

2. **Operating System Selection**

   The [cPVAL Enable Certificate Deployment](/docs/d4f25ab4-f6e9-4f70-a4b5-a7fa61c2e69e) custom field is used to select the operating systems on which certificate deployment should be enabled.

3. **Windows Certificate Deployment**

   Windows certificates can be downloaded from a specified URL and imported into a defined Windows certificate store.

   The certificate store can be customized, for example:

   * `Cert:/LocalMachine/Root`
   * `Cert:/LocalMachine/My`
   * `Cert:/CurrentUser/Root`

   If no store location is specified, the solution uses `Cert:/LocalMachine/Root` by default.

4. **macOS Certificate Deployment**

   macOS certificates can be downloaded from a specified URL and imported into a defined keychain.

   The keychain can be customized, for example:

   * `/System/Library/Keychains/SystemRootCertificates.keychain`
   * `/Users/YourUsername/Library/Keychains/login.keychain`
   * `/Library/Keychains/System.keychain`

   If no keychain is specified, the solution uses `/Library/Keychains/System.keychain` by default.

5. **Centralized Configuration**

   Certificate deployment settings are managed through NinjaOne custom fields, allowing administrators to configure certificate deployment without modifying the automation scripts.

6. **Automated Platform Targeting**

   Separate compound conditions are used to target Windows Workstations, Windows Servers, and macOS endpoints. This ensures that the appropriate certificate installation automation is executed on each platform.

## Associated Content

### Custom Fields

| Content                                             | Purpose                                         |
|-----------------------------------------------------|-------------------------------------------------|
| [cPVAL Enable Certificate Deployment](/docs/d4f25ab4-f6e9-4f70-a4b5-a7fa61c2e69e) | Custom field used to select the operating systems on which the certificate should be deployed. |
| [cPVAL Win Certificate Download URL](/docs/1c5e34b8-839e-44b0-87ad-d2cb7e21bdd5)  | Custom field used to specify the direct download URL of the certificate for Windows, for example: `https://example.com/certificates/DNSFilter.cer`. |
| [cPVAL Win CertStoreLocation](/docs/73a3849d-464c-4bf1-ae15-a93a9bd54370) | Custom field used to specify the Windows certificate store into which the certificate is imported, for example: `Cert:/CurrentUser/Root` or `Cert:/LocalMachine/My`. If no value is specified, the default store location `Cert:/LocalMachine/Root` is used. |
| [cPVAL MAC Certificate Download URL](/docs/6771a3e9-b9e9-4347-afb7-68c5fc5cf740)| Custom field used to specify the direct download URL of the certificate for macOS, for example: `https://example.com/certificates/DNSFilter.cer`. |
| [cPVAL MAC CertStoreLocation](/docs/fdaeb10a-efad-47d0-baf4-fd9ee6c074dc) | Custom field used to specify the macOS keychain into which the certificate is imported, for example: `/System/Library/Keychains/SystemRootCertificates.keychain` or `/Users/YourUsername/Library/Keychains/login.keychain`. If no value is specified, the default system-wide keychain `/Library/Keychains/System.keychain` is used, which applies the trusted root certificate to the entire system. |

### Automation

| Name                                     | Purpose                                                                                                   |
| ---------------------------------------- | --------------------------------------------------------------------------------------------------------- |
| [Install Certificate - Windows](/docs/3f49f6d9-758b-49d6-b425-7e816270aab2) | Installs the certificate to the defined certificate store on Windows machines. If no store is defined, the certificate is imported into `Cert:/LocalMachine/Root` and applied to the entire system. |
| [Install Certificate - Macintosh](/docs/c4cb39c2-2b84-44d4-985a-90e297c5c85e) | Installs the certificate to the defined keychain on macOS machines. If no keychain is defined, the certificate is imported into `/Library/Keychains/System.keychain` and applied to the entire system. |

### Compound Conditions

| Name                                     | Purpose                                                                                                   |
| ---------------------------------------- | --------------------------------------------------------------------------------------------------------- |
| [Install Certificate - Workstations](/docs/fe460488-617b-4fc6-944e-5f8cf4c76516) | Triggers the [Automation - Install Certificate - Windows](/docs/3f49f6d9-758b-49d6-b425-7e816270aab2) on Windows Workstations where certificate installation is enabled for Windows Workstations using the [Custom Field - cPVAL Enable Certificate Deployment](/docs/d4f25ab4-f6e9-4f70-a4b5-a7fa61c2e69e). |
| [Install Certificate - Servers](/docs/c02dffe5-9db7-4a86-8b39-8c6a6b9fc17d) | Triggers the [Automation - Install Certificate - Windows](/docs/3f49f6d9-758b-49d6-b425-7e816270aab2) on Windows Servers where certificate installation is enabled for Windows Servers using the [Custom Field - cPVAL Enable Certificate Deployment](/docs/d4f25ab4-f6e9-4f70-a4b5-a7fa61c2e69e). |
| [Install Certificate - Macintosh](/docs/bb552db9-554d-4b72-9492-bf644aadda6e) | Triggers the [Automation - Install Certificate - Macintosh](/docs/c4cb39c2-2b84-44d4-985a-90e297c5c85e) on macOS endpoints where certificate installation is enabled for Macintosh using the [Custom Field - cPVAL Enable Certificate Deployment](/docs/d4f25ab4-f6e9-4f70-a4b5-a7fa61c2e69e). |

## Implementation

### Step 1: Create the Following Custom Fields

Create all the custom fields listed below in NinjaOne. These are required for the solution to function correctly.

* [cPVAL Enable Certificate Deployment](/docs/d4f25ab4-f6e9-4f70-a4b5-a7fa61c2e69e)
* [cPVAL Win Certificate Download URL](/docs/1c5e34b8-839e-44b0-87ad-d2cb7e21bdd5)
* [cPVAL Win CertStoreLocation](/docs/73a3849d-464c-4bf1-ae15-a93a9bd54370)
* [cPVAL MAC Certificate Download URL](/docs/6771a3e9-b9e9-4347-afb7-68c5fc5cf740)
* [cPVAL MAC CertStoreLocation](/docs/fdaeb10a-efad-47d0-baf4-fd9ee6c074dc)

### Step 2: Configure Certificate Deployment

Set the [cPVAL Enable Certificate Deployment](/docs/d4f25ab4-f6e9-4f70-a4b5-a7fa61c2e69e) custom field to the option that matches the operating systems that should receive the certificate.

Then configure the certificate download URL and the certificate store or keychain location for each selected platform.

For Windows endpoints:

* Specify the certificate download URL in [cPVAL Win Certificate Download URL](/docs/1c5e34b8-839e-44b0-87ad-d2cb7e21bdd5).
* Optionally specify the certificate store in [cPVAL Win CertStoreLocation](/docs/73a3849d-464c-4bf1-ae15-a93a9bd54370).
* Optionally, specify the certificate store in [cPVAL Win CertStoreLocation](/docs/73a3849d-464c-4bf1-ae15-a93a9bd54370).
* If no certificate store is specified, `Cert:/LocalMachine/Root` is used.

For macOS endpoints:

* Specify the certificate download URL in [cPVAL MAC Certificate Download URL](/docs/6771a3e9-b9e9-4347-afb7-68c5fc5cf740).
* Optionally, specify the keychain in [cPVAL MAC CertStoreLocation](/docs/fdaeb10a-efad-47d0-baf4-fd9ee6c074dc).
* If no keychain is specified, `/Library/Keychains/System.keychain` is used.

### Step 3: Create the Automations

Set up the following automations:

* [Automation - Install Certificate - Windows](/docs/3f49f6d9-758b-49d6-b425-7e816270aab2)
* [Automation - Install Certificate - Macintosh](/docs/c4cb39c2-2b84-44d4-985a-90e297c5c85e)

The Windows automation handles certificate installation on Windows Workstations and Windows Servers.

The Macintosh automation handles certificate installation on macOS endpoints.

### Step 4: Create the Compound Conditions

Create the compound conditions that automatically target the appropriate endpoints:

* [Compound Condition - Install Certificate - Workstations](/docs/fe460488-617b-4fc6-944e-5f8cf4c76516)
* [Compound Condition - Install Certificate - Servers](/docs/c02dffe5-9db7-4a86-8b39-8c6a6b9fc17d)
* [Compound Condition - Install Certificate - Macintosh](/docs/bb552db9-554d-4b72-9492-bf644aadda6e)

The Workstations compound condition targets Windows Workstations where certificate deployment is enabled.

The Servers compound condition targets Windows Servers where certificate deployment is enabled.

The Macintosh compound condition targets macOS endpoints where certificate deployment is enabled.

## FAQ

### Q: Which platforms are supported?

> The solution supports **Windows Workstations, Windows Servers, and macOS endpoints**.

### Q: Which options are available in the cPVAL Enable Certificate Deployment custom field?

> The [cPVAL Enable Certificate Deployment](/docs/d4f25ab4-f6e9-4f70-a4b5-a7fa61c2e69e) custom field is a drop-down with the following options:
>
> * `Disabled`
> * `Windows Workstations`
> * `Windows Server`
> * `Windows` (Windows Workstations and Windows Servers)
> * `Windows Workstations and Macintosh`
> * `Macintosh`
> * `All` (Windows Workstations, Windows Servers, and macOS)

### Q: What certificate file format should be used?

> The solution is intended to download certificate files, such as `.cer` files, from a direct download URL.

### Q: Where is the certificate installed on Windows by default?

> If no Windows certificate store is specified, the certificate is imported into `Cert:/LocalMachine/Root`.

### Q: Where is the certificate installed on macOS by default?

> If no macOS keychain is specified, the certificate is imported into `/Library/Keychains/System.keychain`.

### Q: Can I specify a different Windows certificate store?

> Yes. Use the [cPVAL Win CertStoreLocation](/docs/73a3849d-464c-4bf1-ae15-a93a9bd54370) custom field to specify the required Windows certificate store, such as `Cert:/LocalMachine/My` or `Cert:/CurrentUser/Root`. If no store is specified, the default location is used.

### Q: Can I specify a different macOS keychain?

> Yes. Use the [cPVAL MAC CertStoreLocation](/docs/fdaeb10a-efad-47d0-baf4-fd9ee6c074dc) custom field to specify the required macOS keychain. If no keychain is specified, the default location is used.

### Q: Can the same certificate be deployed to both Windows and macOS?

> Yes. Select an option in the [cPVAL Enable Certificate Deployment](/docs/d4f25ab4-f6e9-4f70-a4b5-a7fa61c2e69e) custom field that includes both platforms (`Windows Workstations and Macintosh` or `All`). Windows and macOS use separate download URL fields, so enter the certificate URL in both [cPVAL Win Certificate Download URL](/docs/1c5e34b8-839e-44b0-87ad-d2cb7e21bdd5) and [cPVAL MAC Certificate Download URL](/docs/6771a3e9-b9e9-4347-afb7-68c5fc5cf740).

### Q: What happens when certificate deployment is disabled?

> When the [cPVAL Enable Certificate Deployment](/docs/d4f25ab4-f6e9-4f70-a4b5-a7fa61c2e69e) custom field is set to `Disabled` or left empty, the endpoint is not targeted by any of the certificate deployment compound conditions, and the certificate installation automation is not triggered for that endpoint.

### Q: Why is the automation not running on an endpoint?

> Verify that:
>
> * The endpoint is a supported **Windows Workstation, Windows Server, or macOS endpoint**.
> * The [cPVAL Enable Certificate Deployment](/docs/d4f25ab4-f6e9-4f70-a4b5-a7fa61c2e69e) custom field is set to an option that includes the endpoint's operating system.
> * The appropriate Workstations, Servers, or Macintosh compound condition is applied to the endpoint's agent policy.
> * A valid certificate download URL has been configured for the endpoint's platform.
> * The configured certificate store or keychain location is valid.
> * The endpoint can access the configured certificate download URL.

### Q: Is any manual configuration required on the endpoint?

> No. The solution uses the configured NinjaOne custom fields, automations, and compound conditions to deploy the certificate.

## Changelog

### 2026-09-28

* Initial version of the document
