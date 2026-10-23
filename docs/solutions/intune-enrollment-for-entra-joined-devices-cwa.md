---
id: '7446369f-7970-49d6-9edd-ac68378165b6'
slug: /7446369f-7970-49d6-9edd-ac68378165b6
title: 'Intune Enrollment for Entra Joined Devices'
title_meta: 'Intune Enrollment for Entra Joined Devices'
keywords: ['intune', 'enrollment', 'windows', 'machine', 'detection', 'role']
description: 'This solution is built to enroll the intune on the Entra AD joined devices.'
tags: ['security', 'software', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-10-23
---

## Purpose

This solution is built to enroll the intune on the Entra AD joined devices.

## Associated Content

| Content                                             | Type                                                      | Function                                               |
|-----------------------------------------------------|-----------------------------------------------------------|--------------------------------------------------------|
| [Intune Enrollment for Entra Joined Devices](/docs/9ea6eea1-814c-4642-bcad-fa34b361eb42)     | Script | The script automates the Microsoft Intune enrollment process for Entra joined Windows devices. |
| [IntuneEnrolled](/docs/ec741594-23b2-4d0c-bf8d-337eefb44e83) | Role | This document outlines the process for determining whether a Windows machine is enrolled in Intune, including the necessary detection string and implementation steps for importing the role into the system. |
| [Microsoft - Entra Joined](/docs/4da626c5-0cec-454e-a517-fc7bf22f80f2) | Role | This document provides details on detecting Entra joined machines using a specific PowerShell command. It includes the detection string, the comparator used, and the applicable operating systems. Understanding this detection mechanism is essential for managing Azure AD (Entra) environments effectively. |
| [ProVal Production - Intune Enrollment](/docs/f2f953b8-9620-40ad-a37c-6eaa4e5c47f1) | Internal Monitor | This monitor is built to detect the agent that is Entra Joined and doesn't have Intune enrolled. This depends on EDF `Deploy Intune Enrollment` being checked at the client level, whereas the EDFs `Exclude Intune Enrollment` should not be checked at the location or computer level. |
| △ Custom - Execute Script - Intune Enrollment | Alert Template | This alert template is created to run the autofix [Script - Intune Enrollment for Entra Joined Devices](/docs/9ea6eea1-814c-4642-bcad-fa34b361eb42) detected on the agents via a [Monitor - ProVal Production - Intune Enrollment](/docs/f2f953b8-9620-40ad-a37c-6eaa4e5c47f1) |


## Implementation

- Import the [Script - Intune Enrollment for Entra Joined Devices](/docs/9ea6eea1-814c-4642-bcad-fa34b361eb42).
- Import the [Role - IntuneEnrolled](/docs/ec741594-23b2-4d0c-bf8d-337eefb44e83)
- Import the [Role - Microsoft - Entra Joined](/docs/4da626c5-0cec-454e-a517-fc7bf22f80f2)
- Import the [Monitor - ProVal Production - Intune Enrollment](/docs/f2f953b8-9620-40ad-a37c-6eaa4e5c47f1)
- Import the **Alert Template - △ Custom - Execute Script - Intune Enrollment**
- Navigate to the Automation > Monitors > Internal Monitors
  Double click the [Monitor - ProVal Production - Intune Enrollment](/docs/f2f953b8-9620-40ad-a37c-6eaa4e5c47f1) to open.
  Set the Alerting **Alert Template - △ Custom - Execute Script - Intune Enrollment** that will run the autofix script [Intune Enrollment for Entra Joined Devices](/docs/9ea6eea1-814c-4642-bcad-fa34b361eb42).

## Changelog

### 2026-10-23

- Initial version of the document