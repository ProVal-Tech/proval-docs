---
id: 'c40a1797-4315-4c60-90b4-2d68ce2038e8'
slug: /c40a1797-4315-4c60-90b4-2d68ce2038e8
title: 'Check Senteon Installed CF'
title_meta: 'Check Senteon Installed CF'
keywords: ['senteon', 'agent', 'custom', 'field', 'installed', 'check']
description: 'This document outlines the procedure for checking the presence of the Senteon Agent on an endpoint and updating a custom field named cPVAL Senteon Installed with the status. It includes dependencies, implementation steps, and expected output, ensuring all necessary components are in place for successful execution.'
tags: ['installation', 'performance', 'report', 'software']
draft: false
unlisted: false
---

## Summary

This agent procedure is used to check for the presence of the Senteon Agent on the endpoint and updates a custom field **cPVAL Senteon Installed** with the status.

## Dependencies

Custom Field: [cPVAL Senteon Installed](/docs/bc1c7f2d-8eb4-41a3-bb12-8150cdeb0241)

## Associated Content

[SWM - Software Management - Solution - Senteon Agent](/docs/5cc5165d-4314-499b-9357-299f3b04f402)

## Implementation

Ensure all dependencies exist prior to implementation.  
Export the agent procedure from the ProVal VSA and import it into the partner VSA.  
Name: Check Senteon Installed CF  

![Image 1](../../../static/img/docs/c40a1797-4315-4c60-90b4-2d68ce2038e8/image_1.webp)  
![Image 2](../../../static/img/docs/c40a1797-4315-4c60-90b4-2d68ce2038e8/image_2.webp)  

## Output

Agent Procedure Log Entry  

Script Summary of Success is expected  
![Image 3](../../../static/img/docs/c40a1797-4315-4c60-90b4-2d68ce2038e8/image_3.webp)  

Agent Procedure Log Entry & Custom Field - **Installed**  
![Image 4](../../../static/img/docs/c40a1797-4315-4c60-90b4-2d68ce2038e8/image_4.webp)  

Agent Procedure Log Entry & Custom Field - **Not Running**  
![Image 5](../../../static/img/docs/c40a1797-4315-4c60-90b4-2d68ce2038e8/image_5.webp)  

Agent Procedure Log Entry & Custom Field - **Not Present**  
![Image 6](../../../static/img/docs/c40a1797-4315-4c60-90b4-2d68ce2038e8/image_6.webp)  