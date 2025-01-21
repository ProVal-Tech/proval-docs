---
id: '860118db-b386-45bd-8dfc-580742b1f467'
title: 'Log4J Scan and Remediation'
title_meta: 'Log4J Scan and Remediation'
keywords: ['datto', 'endpoint', 'security', 'vulnerabilities', 'scan']
description: 'This document discusses the use of the revised Datto Scrip, credited to Stephen Nix, for scanning endpoints for attacks and potential vulnerabilities. It outlines the requirement for an email to be specified in the script and explains the notification process for detected threats.'
tags: ['security']
draft: false
unlisted: false
---

## Uses Revised Datto Scrip

The revised Datto Scrip (revision credited to Stephen Nix) is used to scan endpoints for attacks and potential vulnerabilities.

An email must be specified on line 7 of the script.

An email notification will be sent if vulnerabilities or attack traces are found. No notification will be sent if no threats exist.

![Image](../../../static/img/Log4J-Scan-and-Remediation/image_1.png)



