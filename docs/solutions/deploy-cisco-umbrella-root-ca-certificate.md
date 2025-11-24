---
id: 'e1e5a6ab-f810-4e94-8b67-d32b626ab049'
slug: /e1e5a6ab-f810-4e94-8b67-d32b626ab049
title: 'Cisco Umbrella Root CA Certificate Installation'
title_meta: 'Cisco Umbrella Root CA Certificate Installation'
keywords: ['umbrella', 'cisco-secure-client', 'certificate', 'root-ra-certificate', 'umbrella-certificate']
description: ''
tags: ['cisco', 'certificates', 'security', 'application']
draft: false
unlisted: false
---

## Purpose

This solution provides a mechanism to automatically deploy the Cisco Umbrella Root CA certificate to both Windows and Macintosh devices. By utilizing an organization-level custom field, administrators can target specific clients for deployment, ensuring secure SSL inspection and trusted communication with Cisco Umbrella services.

**References:**

* [Install the Cisco Umbrella Root Certificate](https://docs.sse.cisco.com/sse-dns-guide/docs/install-the-cisco-umbrella-root-certificate)

## Associated Content

### Custom Fields

| Name | Type | Function |
| --- | --- | --- |
| [cPVAL Install Cisco Umbrella Root CA Certificate](/docs/3c7ffc5b-3743-46d7-9247-27ac426737ad) | Checkbox | Flag to enable installation of the Cisco Umbrella Root CA certificate on all Windows and Mac devices managed for the client. |

### Automations

| Name | Function |
| --- | --- |
| [Install Cisco Umbrella Root CA Certificate [Windows]](/docs/7370c6a3-143b-4062-9c60-6c6b541ff835) | Downloads and installs the Cisco Umbrella Root CA certificate to the Local Machine Trusted Root store on Windows devices. |
| [Install Cisco Umbrella Root CA Certificate [Macintosh]](/docs/0d5c8a73-05ee-4564-acb7-beea45e27bbc) | Downloads and installs the Cisco Umbrella Root CA certificate to the Local Machine Trusted Root store on Macintosh devices. |

### Groups

| Name | Function |
| --- | --- |
| [Deploy Cisco Umbrella Root CA Certificate](/docs/8776d360-ddcf-459c-95bf-16a2f6f9da65) | Contains all client machines (Windows and Mac) where the organization-level custom field [cPVAL Install Cisco Umbrella Root CA Certificate](/docs/3c7ffc5b-3743-46d7-9247-27ac426737ad)  is enabled. |

### Tasks

| Name | Function |
| --- | --- |
| [Deploy Cisco Umbrella Root CA Certificate](/docs/8df2b6bb-712c-4334-adc8-4758959b9779) | Executes the Cisco Umbrella Root CA certificate installation scripts daily on machines found in the target group. |

## Implementation

### Step 1

Create or import the following custom field:

* [cPVAL Install Cisco Umbrella Root CA Certificate](/docs/3c7ffc5b-3743-46d7-9247-27ac426737ad)

### Step 2

Import the following automations:

* [Install Cisco Umbrella Root CA Certificate [Windows]](/docs/7370c6a3-143b-4062-9c60-6c6b541ff835)
* [Install Cisco Umbrella Root CA Certificate [Macintosh]](/docs/0d5c8a73-05ee-4564-acb7-beea45e27bbc)

### Step 3

Create the following dynamic group to identify target devices:

* [Deploy Cisco Umbrella Root CA Certificate](/docs/8776d360-ddcf-459c-95bf-16a2f6f9da65)

### Step 4

Create the scheduled task to run the installation scripts daily:

* [Deploy Cisco Umbrella Root CA Certificate](/docs/8df2b6bb-712c-4334-adc8-4758959b9779)

### Step 5

To deploy the certificate to an organization:

1. Navigate to the Organization's Custom Fields.
2. Enable the checkbox for **[cPVAL Install Cisco Umbrella Root CA Certificate](/docs/3c7ffc5b-3743-46d7-9247-27ac426737ad)**.
3. Devices will automatically populate into the [Deploy Cisco Umbrella Root CA Certificate](/docs/8776d360-ddcf-459c-95bf-16a2f6f9da65) group.
4. The [Deploy Cisco Umbrella Root CA Certificate](/docs/8df2b6bb-712c-4334-adc8-4758959b9779) task will run at the next scheduled interval (daily at 1:00 PM).

## FAQ

### Q: Why is this certificate installation necessary?

**A:** Installing the Root CA certificate ensures secure SSL inspection and trusted communication with Cisco Umbrella services. It allows the device to trust the inspection performed by Cisco Umbrella.

### Q: How do I deploy the certificate to a client?

**A:** You can enable deployment by flagging the [cPVAL Install Cisco Umbrella Root CA Certificate](/docs/3c7ffc5b-3743-46d7-9247-27ac426737ad) checkbox at the Organization level. Once enabled, machines will automatically be added to the [Deploy Cisco Umbrella Root CA Certificate](/docs/8776d360-ddcf-459c-95bf-16a2f6f9da65) group.

### Q: Which operating systems are supported?

**A:** This solution supports both Windows and Mac devices. It utilizes specific automations for each OS:

* [Install Cisco Umbrella Root CA Certificate [Windows]](/docs/7370c6a3-143b-4062-9c60-6c6b541ff835) for Windows machines.
* [Install Cisco Umbrella Root CA Certificate [Macintosh]](/docs/0d5c8a73-05ee-4564-acb7-beea45e27bbc) for Macintosh machines.

### Q: Where is the certificate installed on the device?

**A:** The automations download and install the certificate to the Local Machine Trusted Root store on the device.

### Q: How often does the installation script run?

**A:** The [Deploy Cisco Umbrella Root CA Certificate](/docs/8df2b6bb-712c-4334-adc8-4758959b9779) task runs daily (repeats every 1 day) at 1:00 PM.

### Q: Does the automation reinstall the certificate every time it runs?

**A:** No. The automation first verifies if the certificate (matching the specific Thumbprint) is already installed and valid. If found, the script exits without making changes. This ensures that the [Install Cisco Umbrella Root CA Certificate [Windows]](/docs/7370c6a3-143b-4062-9c60-6c6b541ff835) and [Install Cisco Umbrella Root CA Certificate [Macintosh]](/docs/0d5c8a73-05ee-4564-acb7-beea45e27bbc) scripts only deploy the certificate when it is missing or invalid.
