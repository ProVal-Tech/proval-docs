---
id: '1462c9f3-6c6d-4703-a2f5-07a1e1d62fd9'
slug: /1462c9f3-6c6d-4703-a2f5-07a1e1d62fd9
title: 'Crystal Disk Info - Ticket Troubleshooting Guide'
title_meta: 'Crystal Disk Info - Ticket Troubleshooting Guide'
keywords: ['ticket', 'troubleshooting', 'ssd', 'spinning', 'disk', 'replacement']
description: 'This document provides a comprehensive guide for troubleshooting hard drive issues, including steps for identifying SSD and spinning disk drives, understanding health status indicators, and recommending replacement processes. It includes visual aids and links to additional resources for further assistance.'
tags: ['disk-encryption', 'performance', 'recovery', 'setup', 'windows']
draft: false
unlisted: false
---

## Ticket Example

![Ticket Example](../../../static/img/docs/1462c9f3-6c6d-4703-a2f5-07a1e1d62fd9/image_1.webp)

If you are reading this document, you should have received a ticket similar to the one above. This document is intended to guide you through the troubleshooting steps to resolve this problem.

### Prerequisites

Determine if the hard drive in question is an SSD or a normal spinning disk:

- You can confirm whether the hard drive is an SSD by looking at the Health Status.
- **SSD** - If there is a percentage next to the health status, that indicates the remaining life of the SSD.
  ![SSD Health Status](../../../static/img/docs/1462c9f3-6c6d-4703-a2f5-07a1e1d62fd9/image_2.webp)
- **Spinning Disk** - If there is no percentage, that means it is a spinning disk.
  ![Spinning Disk Health Status](../../../static/img/docs/1462c9f3-6c6d-4703-a2f5-07a1e1d62fd9/image_3.webp)

Click the section (in the left navigation of this document) where your ticket is associated to begin troubleshooting.

## Troubleshooting Steps:

### SSD

1. **Understanding the Flags that Crystal Disk Info is Looking For:**
   ![Crystal Disk Info Flags](../../../static/img/docs/1462c9f3-6c6d-4703-a2f5-07a1e1d62fd9/image_4.webp)
   Percentage Used - Color correlation
   ![Percentage Used](../../../static/img/docs/1462c9f3-6c6d-4703-a2f5-07a1e1d62fd9/image_5.webp)
   - Note that the "Bad" flag on the remaining life is completely vendor-defined. If the percentage used is flagged as red, it is recommended to replace the drive as soon as possible.
   - **The Critical Warning Flag**
     - This is vendor-controlled, and the drive should be replaced if it is flagged as 'Red'.
   (5 minutes)

2. You can run a different hard drive test, like SeaTools, on the drive to validate whether the hard drive is actually failing.
   - [SeaTools Download](https://www.seagate.com/support/downloads/seatools/)
   If the hard drive is not reporting issues, you can proceed to the next step. If it is reporting issues, recommend drive replacement.
   - Follow the Replacement Process linked on the left to recommend replacing the drive.
   (25 minutes)

3. Other than this, there is not much that can be done for a Solid State Drive other than replacing the drive or excluding it from monitoring using the 'Disks to Exclude from Disk Health Alerting' EDF.

   **NOTE**: Before excluding the drive from detection, it is highly recommended that this only be used as a last resort, and confirm the client is fully aware that the hard drive is failing and is willing to let it die.
   ![SSD Exclusion](../../../static/img/docs/1462c9f3-6c6d-4703-a2f5-07a1e1d62fd9/image_6.webp)
   (5 minutes)

### Spinning Disk

1. **Understanding the Flags that Crystal Disk is Looking For:**
   ![Crystal Disk Spinning Disk Flags](../../../static/img/docs/1462c9f3-6c6d-4703-a2f5-07a1e1d62fd9/image_7.webp)

   The key flags from spinning disks:
   - **Reallocated Sectors Count**
     - This indicates the total number of times that the hard drive has encountered an error when attempting to copy data to a specific sector of the hard drive and ultimately needed to move the data to a different spot on the hard drive. The health status is dependent on this SMART value nearly every time on a spinning disk.

   Options:
   - You can run a different hard drive test, like SeaTools, on the drive to validate whether the hard drive is actually failing.
     - [SeaTools Download](https://www.seagate.com/support/downloads/seatools/)
   - OR - Skip to the next step.
   (5 minutes)

2. If available, log in to the machine using ScreenConnect Backstage Mode:
   ![ScreenConnect](../../../static/img/docs/1462c9f3-6c6d-4703-a2f5-07a1e1d62fd9/image_8.webp)
   (5 minutes)

3. Navigate to the storage location for the Crystal Disk Info application. Currently, it is stored under:
   ```
   C:/Programdata/_automation/CrystalDiskInfo/CrystalDiskInfo/DiskInfo64.exe
   ```
   But it may also be found here if the solution is not fully up to date:
   ```
   C:/CrystalDiskInfo/CrystalDiskInfo/DiskInfo64.exe
   ```
   Simply paste that line into the command prompt, and it should open Crystal Disk Info within backstage mode.

   If backstage mode was not an option, skip to the next step:
   (5 minutes)

4. Grab the HEX value of the Reallocated Sector Count stat to review how bad the drive is:
   - ![Reallocated Sector Count](../../../static/img/docs/1462c9f3-6c6d-4703-a2f5-07a1e1d62fd9/image_9.webp)
   - OR from the log file:
     ![Log File 1](../../../static/img/docs/1462c9f3-6c6d-4703-a2f5-07a1e1d62fd9/image_10.webp)
     ![Log File 2](../../../static/img/docs/1462c9f3-6c6d-4703-a2f5-07a1e1d62fd9/image_11.webp)
       - *Note*: The above screenshot is of a different drive, which is why the values are different. This is just showing where the numbers can be found.
   - And run it through this converter: [Hex to Decimal Converter](https://www.rapidtables.com/convert/number/hex-to-decimal.html)
     ![Hex to Decimal](../../../static/img/docs/1462c9f3-6c6d-4703-a2f5-07a1e1d62fd9/image_12.webp)
   (5 minutes)

5. Based on how high the decimal value is, you will either want to replace the drive or monitor for progression:
   - For lower values, you can adjust the threshold on a per-machine basis by following the steps below:
     1. Open the Computer Management screen for the machine in question.
     2. Right-click on the gear and select 'Extra Data Fields'.
     3. Navigate to the Crystal Disk Info - HDD Test tab and enter a higher value in the 'Crystal Disk - Reallocated Sectors' EDF than what was reported as the decimal number.
        - In the above example, I would set the threshold to 150.
        ![Threshold Example](../../../static/img/docs/1462c9f3-6c6d-4703-a2f5-07a1e1d62fd9/image_6.webp)
   - If the decimal value is higher than 500, I would recommend replacing the drive as soon as possible.
     - Follow the Replacement Process linked on the left to recommend replacing the drive.
   (5 minutes)

6. Then re-run the Crystal Disk Audit script on the machine to update the database with the correct information.
   ![Crystal Disk Audit 1](../../../static/img/docs/1462c9f3-6c6d-4703-a2f5-07a1e1d62fd9/image_13.webp)
   ![Crystal Disk Audit 2](../../../static/img/docs/1462c9f3-6c6d-4703-a2f5-07a1e1d62fd9/image_14.webp)
   (5 minutes)

## Replacement Process

1. Check to see if the PC is under warranty:
   - If WarrantyMaster/ScalePad is set up and deployed:
   ![Warranty Check](../../../static/img/docs/1462c9f3-6c6d-4703-a2f5-07a1e1d62fd9/image_15.webp)
   - If this plugin is not set up, you will need to hit the 'Show Details' button in the Computer Management screen → Grab the S/N of the machine and look up the warranty status manually:
   ![Manual Warranty Check](../../../static/img/docs/1462c9f3-6c6d-4703-a2f5-07a1e1d62fd9/image_16.webp)
     - For Dell Machines: [Dell Warranty Check](https://www.dell.com/support/contractservices/en-us)
     - For HP Machines: [HP Warranty Check](https://support.hp.com/us-en/check-warranty)
     - For Lenovo Machines: [Lenovo Warranty Check](https://pcsupport.lenovo.com/us/en/warranty-lookup#/)

   (5 minutes)

2. If the machine is **not under warranty and is more than 5 years old**, a full PC replacement would be recommended rather than investing money into an old machine.

3. If the **machine is under warranty**, an additional drive test may be required by the manufacturer to allow the drive to be replaced under warranty.

4. If the **machine's warranty has just recently expired**, a replacement drive quote should be sent to the client for approval.
   - **NOTE**: Always recommend an SSD as the replacement. Spinning disks may be cheaper, but they are much slower and not worth the headache.
