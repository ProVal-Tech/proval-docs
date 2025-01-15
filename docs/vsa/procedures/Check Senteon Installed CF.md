---
id: 'c40a1797-4315-4c60-90b4-2d68ce2038e8'
title: 'Check Senteon Installed Custom Field'
title_meta: 'Check Senteon Installed Custom Field'
keywords: ['senteon', 'agent', 'custom', 'field', 'installed', 'check']
description: 'This document outlines the procedure for checking the presence of the Senteon Agent on an endpoint and updating a custom field named cPVAL Senteon Installed with the status. It includes dependencies, implementation steps, and expected output, ensuring all necessary components are in place for successful execution.'
tags: ['custom-field', 'software', 'installation', 'report', 'performance']
draft: false
unlisted: false
---
## Summary

This agent procedure is used to check for the presence of the Senteon Agent on the endpoint and updates a custom field **cPVAL Senteon Installed** with the status.

## Dependencies

Custom Field: [cPVAL Senteon Installed](https://proval.itglue.com/DOC-5078775-16540467)

## Associated Content

[SWM - Software Management - Solution - Senteon Agent](https://proval.itglue.com/DOC-5078775-16541168)

## Implementation

Ensure all dependencies exist prior to implementation.  
Export the agent procedure from the ProVal VSA, and import into the partner VSA.  
Name: Check Senteon Installed CF  

![Image 1](../../../static/img/Check-Senteon-Installed-CF/image_1.png)  
![Image 2](../../../static/img/Check-Senteon-Installed-CF/image_2.png)  

## Output

Agent Procedure Log Entry  

Script Summary of Success is expected  
![Image 3](../../../static/img/Check-Senteon-Installed-CF/image_3.png)  

Agent Procedure Log Entry & Custom Field - **Installed**  
![Image 4](../../../static/img/Check-Senteon-Installed-CF/image_4.png)  

Agent Procedure Log Entry & Custom Field - **Not_Running**  
![Image 5](../../../static/img/Check-Senteon-Installed-CF/image_5.png)  

Agent Procedure Log Entry & Custom Field - **Not_Present**  
![Image 6](../../../static/img/Check-Senteon-Installed-CF/image_6.png)  






