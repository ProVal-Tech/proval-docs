---
id: '62efcaa3-e03b-4500-a48a-f472a82f039f'
slug: /62efcaa3-e03b-4500-a48a-f472a82f039f
title: 'Browser Saved Password Failure Detection'
title_meta: 'Browser Saved Password Failure Detection'
keywords: ['monitor', 'ticket', 'failure', 'browser', 'passwords']
description: 'This document outlines the steps to create a monitor that generates a ticket when the task to clear or audit browser saved passwords fails. The monitor is essential for ensuring that saved passwords are properly managed and removed when necessary.'
tags: ['security', 'ticketing']
draft: false
unlisted: false
---

## Summary

This monitor is designed to create a ticket for the failure of the [Task - Clear/Audit - Browser Saved Password](/docs/a56e605b-a1d4-45ea-bebb-4411f3890f7e) in removing the browser-saved passwords.

## Create and Implement Monitor

- Click on **Alert Management** -> **Monitors** -> **Create Monitor**  
  ![Image 1](../../../static/img/docs/62efcaa3-e03b-4500-a48a-f472a82f039f/image_1.webp)  
  ![Image 2](../../../static/img/docs/62efcaa3-e03b-4500-a48a-f472a82f039f/image_2.webp)  

- **Name**: Browser Saved Password Failure Detection  
  **Description**: This monitor will detect the agents where the [Task - Clear/Audit - Browser Saved Password](/docs/a56e605b-a1d4-45ea-bebb-4411f3890f7e) failed to remove the saved passwords from the browser.  
  **Type**: Custom Field  
  **Severity**: Critical Non-Impact Alerts  
  **Family**: RMM Agent  
  ![Image 3](../../../static/img/docs/62efcaa3-e03b-4500-a48a-f472a82f039f/image_3.webp)  

- Set the Conditions as shown below:  
  ![Image 4](../../../static/img/docs/62efcaa3-e03b-4500-a48a-f472a82f039f/image_4.webp)  

- Set a Target to the companies for which you would like to monitor the failure.  
  **Note**: The monitor does not allow the application of the target to a custom group.  
  ![Image 5](../../../static/img/docs/62efcaa3-e03b-4500-a48a-f472a82f039f/image_5.webp)  

- Once all is done, click **Save**. The monitor will be created, and the ticket creation will be set.

