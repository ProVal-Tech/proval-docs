---
id: '2603fc00-ac56-4466-b220-f2484ceef424'
title: 'Senteon Agent Uninstallation'
title_meta: 'Senteon Agent Uninstallation'
keywords: ['senteon', 'uninstall', 'agent', 'endpoint', 'procedure']
description: 'This document outlines the steps to uninstall the Senteon Agent from an endpoint using the Remove - Application agent procedure template. It provides details on the implementation process, including exporting and importing the agent procedure within the ProVal VSA environment.'
tags: ['software', 'uninstallation']
draft: false
unlisted: false
---

## Summary

This document outlines the steps to uninstall the Senteon Agent from the endpoint.  
This agent procedure utilizes the [Remove - Application](https://proval.itglue.com/5078775/docs/11259375) agent procedure template to perform the uninstall.

## Associated Content

[SWM - Software Management - Solution - Senteon Agent](<../../solutions/Senteon Agent.md>)

## Implementation

Export the agent procedure from the ProVal VSA and import it into the partner VSA.  
**Name:** Senteon - Uninstall  
![Image](../../../static/img/Senteon---Uninstall/image_1.png)  
![Image](../../../static/img/Senteon---Uninstall/image_2.png)  

Proval Plug & Play Procedure: The agent procedure requires no configuration.

## Output

Agent Procedure Log Entry  
**Success**  
![Image](../../../static/img/Senteon---Uninstall/image_3.png)  
