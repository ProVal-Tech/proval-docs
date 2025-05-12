---
id: '2603fc00-ac56-4466-b220-f2484ceef424'
slug: /2603fc00-ac56-4466-b220-f2484ceef424
title: 'Senteon - Uninstall'
title_meta: 'Senteon - Uninstall'
keywords: ['senteon', 'uninstall', 'agent', 'endpoint', 'procedure']
description: 'This document outlines the steps to uninstall the Senteon Agent from an endpoint using the Remove - Application agent procedure template. It provides details on the implementation process, including exporting and importing the agent procedure within the ProVal VSA environment.'
tags: ['software', 'uninstallation']
draft: false
unlisted: false
---

## Summary

This document outlines the steps to uninstall the Senteon Agent from the endpoint.  
This agent procedure utilizes the [Remove - Application](/docs/5197b52f-294e-4b7d-8956-5bc5afc3f51c) agent procedure template to perform the uninstall.

## Associated Content

[SWM - Software Management - Solution - Senteon Agent](/docs/5cc5165d-4314-499b-9357-299f3b04f402)

## Implementation

Export the agent procedure from the ProVal VSA and import it into the partner VSA.  
**Name:** Senteon - Uninstall  
![Image](../../../static/img/docs/2603fc00-ac56-4466-b220-f2484ceef424/image_1.webp)  
![Image](../../../static/img/docs/2603fc00-ac56-4466-b220-f2484ceef424/image_2.webp)  

Proval Plug & Play Procedure: The agent procedure requires no configuration.

## Output

Agent Procedure Log Entry  
**Success**  
![Image](../../../static/img/docs/2603fc00-ac56-4466-b220-f2484ceef424/image_3.webp)  