---
id: '12034de3-aa3a-4f6c-89da-a6f229e6fbec'
slug: /12034de3-aa3a-4f6c-89da-a6f229e6fbec
title: 'Install Certificates - Windows/Mac'
title_meta:  'Install Certificates - Windows/Mac'
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

Users can centrally configure the certificate download URL, certificate store or keychain location, and the operating systems on which the certificate should be deployed. The appropriate automation is then triggered automatically based on the endpoint's operating system and deployment configuration.

### Key Capabilities

1. **Platform Support**

   The solution is designed for **Windows Workstations, Windows Servers, and macOS endpoints**.

2. **Operating System Selection**

   The [cPVAL Enable Certificate Deployment](/docs/d4f25ab4-f6e9-4f70-a4b5-a7fa61c2e69e) custom field is used to select the operating systems on which certificate deployment should be enabled.

3. **Windows Certificate Deployment**

   Windows certificates can be downloaded from a specified URL and imported into a defined Windows certificate store.

   The certificate store can be customized, such as:

   * `Cert:/LocalMachine/Root`
   * `Cert:/LocalMachine/My`
   * `Cert:/CurrentUser/Root`

   If no store location is specified, the solution uses `Cert:/LocalMachine/Root` by default.

4. **macOS Certificate Deployment**

   macOS certificates can be downloaded from a specified URL and imported into a defined keychain.

   The keychain can be customized, such as:

   * `/System/Library/Keychains/SystemRootCertificates.keychain`
   * `/Users/YourUsername/Library/Keychains/login.keychain`
   * `/Library/Keychains/System.keychain`

   If no keychain is specified, the solution uses `/Library/Keychains/System.keychain` by default.

5. **Centralized Configuration**

   Certificate deployment settings are managed through NinjaOne custom fields, allowing administrators to configure certificate deployment without modifying the automation scripts.

6. **Automated Platform Targeting**

   Separate compound conditions are used to target Windows Workstations, Windows Servers, and macOS endpoints. This ensures that the appropriate certificate installation automation is executed on the applicable platform.


## Associated Content

### Custom Fields 

| Content                                             | Purpose                                         |
|-----------------------------------------------------|-------------------------------------------------|
| [Custom Field - cPVAL Enable Certificate Deployment](/docs/d4f25ab4-f6e9-4f70-a4b5-a7fa61c2e69e) | Custom Field to select the operating systems on which the certificate should be deployed. |
| [Custom Field - cPVAL Win Certificate Download URL](/docs/c5e34b8-839e-44b0-87ad-d2cb7e21bdd5)  | Custom Field to add direct download URL of the certificate. Something like this: https://labtech.provaltech.com/Labtech/Transfer/software/certficates/DNSFilter.cer |
| [Custom Field - cPVAL Win CertStoreLocation](/docs/73a3849d-464c-4bf1-ae15-a93a9bd54370) | Custom Field to add a particular certificate store on a Windows system to import the certificate. It could be something like Cert:/CurrentUser/Root, Cert:/LocalMachine/My, etc. If nothing is mentioned in the parameter, it will use the default store location, i.e., Cert:/LocalMachine/Root. |
| [Custom Field - cPVAL MAC Certificate Download URL](/docs/6771a3e9-b9e9-4347-afb7-68c5fc5cf740)| Custom Field to add direct download URL of the certificate. Something like this: https://labtech.provaltech.com/Labtech/Transfer/software/certficates/DNSFilter.cer. |
| [Custom Field - cPVAL MAC CertStoreLocation](/docs/fdaeb10a-efad-47d0-baf4-fd9ee6c074dc) | Custom Field to add a Particular keychain to import a certificate on a MAC machine. It could be something like /System/Library/Keychains/SystemRootCertificates.keychain, /Users/YourUsername/Library/Keychains/login.keychain, etc. If nothing is mentioned in the parameter, it will use the default system-wide keychain, applying trusted root certificates to the entire system, i.e., /Library/Keychains/System.keychain. |

### Automation

| Name                                     | Purpose                                                                                                   |
| ---------------------------------------- | --------------------------------------------------------------------------------------------------------- |
| [Automation - Install Certificate - Windows](/docs/3f49f6d9-758b-49d6-b425-7e816270aab2) | This script installs the certificate to a defined certificate location on Windows machines. If no particular location is defined, it will import the certificate at the root location of the machine and apply it to the entire system. |
| [Automation - Install Certificate - Macintosh](/docs/c4cb39c2-2b84-44d4-985a-90e297c5c85e) | This script installs the certificate to a defined certificate location on MAC machines. If no particular location is defined, it will import the certificate at the root location of the machine and apply it to the entire system. |


### Compound Conditions

| Name                                     | Purpose                                                                                                   |
| ---------------------------------------- | --------------------------------------------------------------------------------------------------------- |
| [Compound Condition - Install Certificate - Workstations](/docs/fe460488-617b-4fc6-944e-5f8cf4c76516) | Triggers the [Automation - Install Certificate - Windows](/docs/3f49f6d9-758b-49d6-b425-7e816270aab2) on Windows Workstations where certification installation is enabled for windows workstations using [Custom Field - cPVAL Enable Certificate Deployment](/docs/d4f25ab4-f6e9-4f70-a4b5-a7fa61c2e69e). | 
| [Compound Condition - Install Certificate - Servers](/docs/c02dffe5-9db7-4a86-8b39-8c6a6b9fc17d) | Triggers the [Automation - Install Certificate - Windows](/docs/3f49f6d9-758b-49d6-b425-7e816270aab2) on Windows Servers where certification installation is enabled for windows Servers using [Custom Field - cPVAL Enable Certificate Deployment](/docs/d4f25ab4-f6e9-4f70-a4b5-a7fa61c2e69e). |
|[Compound Condition - Install Certificate - Macintosh](/docs/bb552db9-554d-4b72-9492-bf644aadda6e) | Triggers the [Automation - Install Certificate - Macintosh](/docs/c4cb39c2-2b84-44d4-985a-90e297c5c85e) on Macintosh where certification installation is enabled for Macintosh using [Custom Field - cPVAL Enable Certificate Deployment](/docs/d4f25ab4-f6e9-4f70-a4b5-a7fa61c2e69e). |

## Implementation

### Step 1: Create the Following Custom Fields

Create all the custom fields listed below in NinjaOne. These are required for the solution to function correctly.

* [cPVAL Enable Certificate Deployment](/docs/d4f25ab4-f6e9-4f70-a4b5-a7fa61c2e69e)
* [cPVAL Win Certificate Download URL](/docs/c5e34b8-839e-44b0-87ad-d2cb7e21bdd5)
* [cPVAL Win CertStoreLocation](/docs/73a3849d-464c-4bf1-ae15-a93a9bd54370)
* [cPVAL MAC Certificate Download URL](/docs/6771a3e9-b9e9-4347-afb7-68c5fc5cf740)
* [cPVAL MAC CertStoreLocation](/docs/fdaeb10a-efad-47d0-baf4-fd9ee6c074dc)

### Step 2: Configure Certificate Deployment

Configure the [cPVAL Enable Certificate Deployment](/docs/d4f25ab4-f6e9-4f70-a4b5-a7fa61c2e69e) custom field to select the operating systems that should receive the certificate.

Configure the appropriate certificate download URL and certificate store/keychain location for each selected platform.

For Windows endpoints:

* Specify the certificate download URL in [cPVAL Win Certificate Download URL](/docs/c5e34b8-839e-44b0-87ad-d2cb7e21bdd5).
* Optionally specify the certificate store in [cPVAL Win CertStoreLocation](/docs/73a3849d-464c-4bf1-ae15-a93a9bd54370).
* If no certificate store is specified, `Cert:/LocalMachine/Root` is used.

For macOS endpoints:

* Specify the certificate download URL in [cPVAL MAC Certificate Download URL](/docs/6771a3e9-b9e9-4347-afb7-68c5fc5cf740).
* Optionally specify the keychain in [cPVAL MAC CertStoreLocation](/docs/fdaeb10a-efad-47d0-baf4-fd9ee6c074dc).
* If no keychain is specified, `/Library/Keychains/System.keychain` is used.

### Step 3: Create the Automations

Set up the following automations:

* [Automation - Install Certificate - Windows](/docs/3f49f6d9-758b-49d6-b425-7e816270aab2)
* [Automation - Install Certificate - Macintosh](/docs/c4cb39c2-2b84-44d4-985a-90e297c5c85e)

The Windows automation handles certificate installation on Windows Workstations and Servers.

The Macintosh automation handles certificate installation on macOS endpoints.

### Step 4: Create the Compound Conditions

Create the compound conditions that automatically target the appropriate endpoints.

* [Compound Condition - Install Certificate - Workstations](/docs/fe460488-617b-4fc6-944e-5f8cf4c76516)
* [Compound Condition - Install Certificate - Servers](/docs/c02dffe5-9db7-4a86-8b39-8c6a6b9fc17d)
* [Compound Condition - Install Certificate - Macintosh](/docs/bb552db9-554d-4b72-9492-bf644aadda6e)

The Workstations compound condition targets Windows Workstations where certificate deployment is enabled.

The Servers compound condition targets Windows Servers where certificate deployment is enabled.

The Macintosh compound condition targets macOS endpoints where certificate deployment is enabled.


## FAQ

### Q: Which platforms are supported?

> The Certificate Deployment solution supports **Windows Workstations, Windows Servers, and macOS endpoints**.

### Q: What certificate file format should be used?

> The solution is intended to download certificate files such as `.cer` from a direct download URL.

### Q: Where is the certificate installed on Windows by default?

> If no Windows certificate store is specified, the certificate is imported into `Cert:/LocalMachine/Root`.

### Q: Where is the certificate installed on macOS by default?

> If no macOS keychain is specified, the certificate is imported into `/Library/Keychains/System.keychain`.

### Q: Can I specify a different Windows certificate store?

> Yes. The [cPVAL Win CertStoreLocation](/docs/73a3849d-464c-4bf1-ae15-a93a9bd54370) custom field can be used to specify the required Windows certificate store, such as `Cert:/LocalMachine/My` or `Cert:/CurrentUser/Root`.

### Q: Can I specify a different macOS keychain?

> Yes. The [cPVAL MAC CertStoreLocation](/docs/fdaeb10a-efad-47d0-baf4-fd9ee6c074dc) custom field can be used to specify the required macOS keychain.

### Q: Can the same certificate be deployed to multiple operating systems?

> Yes. Enable the applicable operating systems in the [cPVAL Enable Certificate Deployment](/docs/d4f25ab4-f6e9-4f70-a4b5-a7fa61c2e69e) custom field and configure the corresponding certificate URL and store/keychain settings for each platform.

### Q: What happens when certificate deployment is disabled?

> The endpoint will not be targeted by the applicable certificate deployment compound condition, and the certificate installation automation will not be triggered for that endpoint.

### Q: Why is the automation not running on an endpoint?

> Verify that:
> * The endpoint is a supported **Windows Workstation, Windows Server, or macOS endpoint**.
> * The appropriate operating system is enabled in the [cPVAL Enable Certificate Deployment](/docs/d4f25ab4-f6e9-4f70-a4b5-a7fa61c2e69e) custom field.
> * The endpoint meets the appropriate Workstation, Server, or Macintosh compound condition.
> * A valid certificate download URL has been configured.
> * The configured certificate store or keychain location is valid.
> * The endpoint can access the configured certificate download URL.

### Q: Is any manual configuration required on the endpoint?

> No additional manual endpoint configuration is required. The solution uses the configured NinjaOne custom fields, automations, and compound conditions to deploy the certificate.

### Q: Can I use a custom certificate store or keychain?

> Yes. The solution supports custom certificate store locations on Windows and custom keychain locations on macOS. If no custom location is specified, the applicable default location is used.

## Changelog

### 2026-09-28

* Initial version of the document
