---
id: 'f9b8a027-e797-49c6-848d-7cb667a16ce0'
slug: /f9b8a027-e797-49c6-848d-7cb667a16ce0
title: 'Winget - Export Param'
title_meta: 'Winget - Export Param'
keywords: ['export', 'applications', 'winget', 'report', 'json', 'csv', 'email']
description: 'This document provides a detailed overview of a PowerShell script that exports the list of installed applications in JSON and CSV formats using the Winget command. It also includes functionality to email the generated reports to specified addresses, with options to customize the output format and recipients.'
tags: ['email', 'installation', 'report', 'software', 'windows']
draft: false
unlisted: false
---

## Summary

The script offers the functionality to export the list of installed applications in both JSON and CSV formats using the `winget export --output $Export --include-versions` command.

Additionally, it includes an option to email the generated report(s). By default, the script creates a JSON report. If the `Export_CSV` parameter is enabled, a corresponding CSV report will also be generated.

When the `Email_Report` parameter is set to 1, the script will send out the generated report(s) via email. By default, the report(s) will be sent to the user running the script unless a specific email address is provided in the `Email_Address` user parameter.

If both `Export_CSV` and `Email_Report` parameters are enabled, the script will send two separate emails, each attaching the corresponding report. This is because multiple files cannot be attached to the same email from Automate.

Path to the reports on the local machine:
- `C:/ProgramData/_Automation/Script/Invoke-WingetProcessor/Softwarelist.json`
- `C:/ProgramData/_Automation/Script/Invoke-WingetProcessor/Softwarelist.csv`

**Requirement:** PowerShell v5+

## Sample Run

**Example 1:** Export and place the `Softwarelist.json` file at `C:/ProgramData/_Automation/Script/Invoke-WingetProcessor/Softwarelist.json` on the end machine.

![Example 1](../../../static/img/docs/f9b8a027-e797-49c6-848d-7cb667a16ce0/image_1.webp)

**Example 2:** Export and place both `software.json` and `software.csv` files respectively at `C:/ProgramData/_Automation/Script/Invoke-WingetProcessor/Softwarelist.json` and `C:/ProgramData/_Automation/Script/Invoke-WingetProcessor/Softwarelist.csv` on the end machine. Send out the reports to the user running the script via separate emails.

![Example 2](../../../static/img/docs/f9b8a027-e797-49c6-848d-7cb667a16ce0/image_2.webp)

**Example 3:** Export and place both `software.json` and `software.csv` files respectively at `C:/ProgramData/_Automation/Script/Invoke-WingetProcessor/Softwarelist.json` and `C:/ProgramData/_Automation/Script/Invoke-WingetProcessor/Softwarelist.csv` on the end machine. Send out the reports to [support@provaltech.com](mailto:support@provaltech.com) via separate emails.

![Example 3](../../../static/img/docs/f9b8a027-e797-49c6-848d-7cb667a16ce0/image_3.webp)

### User Parameters

| Name            | Example                                         | Required | Description                                                                                                                                                                                                                                                |
|-----------------|-------------------------------------------------|----------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Export_CSV      | 1                                               | False    | If the parameter is set to 1, the script will generate a corresponding CSV report as well. By default, the script is configured to generate a JSON report only.                                                                                          |
| Email_Report     | 1                                               | False    | If the parameter is set to 1, the script will send the report(s) to the user running the script through email(s).                                                                                                                                      |
| Email_Address   | [support@provaltech.com](mailto:support@provaltech.com) | False    | If email addresses are provided, the script will send the report(s) to the specified email address(es) instead of the user running the script. Multiple email addresses can be set by separating them with a semicolon ';' without any space. Example: [support@provaltech.com](mailto:support@provaltech.com);[Alerts@provaltech.com](mailto:Alerts@provaltech.com) |

## Output

- Script logs
- Email(s) (if enabled)