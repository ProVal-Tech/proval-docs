---
id: '62efcaa3-e03b-4500-a48a-f472a82f039f'
title: 'Browser Saved Password Failure Detection'
title_meta: 'Browser Saved Password Failure Detection'
keywords: ['monitor', 'ticket', 'failure', 'browser', 'passwords']
description: 'This document outlines the steps to create a monitor that generates a ticket when the task to clear or audit browser saved passwords fails. The monitor is essential for ensuring that saved passwords are properly managed and removed when necessary.'
tags: ['security', 'ticketing']
draft: false
unlisted: false
---

## Summary

This monitor is designed to create a ticket for the failure of the [Task - Clear/Audit - Browser Saved Password](https://proval.itglue.com/DOC-5078775-17309286) in removing the browser-saved passwords.

## Create and Implement Monitor

- Click on **Alert Management** -> **Monitors** -> **Create Monitor**  
  ![Image 1](../../../static/img/Browser-Saved-Password-Failure-Detection/image_1.png)  
  ![Image 2](../../../static/img/Browser-Saved-Password-Failure-Detection/image_2.png)  

- **Name**: Browser Saved Password Failure Detection  
  **Description**: This monitor will detect the agents where the [Task - Clear/Audit - Browser Saved Password](https://proval.itglue.com/DOC-5078775-17309286) failed to remove the saved passwords from the browser.  
  **Type**: Custom Field  
  **Severity**: Critical Non-Impact Alerts  
  **Family**: RMM Agent  
  ![Image 3](../../../static/img/Browser-Saved-Password-Failure-Detection/image_3.png)  

- Set the Conditions as shown below:  
  ![Image 4](../../../static/img/Browser-Saved-Password-Failure-Detection/image_4.png)  

- Set a Target to the companies for which you would like to monitor the failure.  
  **Note**: The monitor does not allow the application of the target to a custom group.  
  ![Image 5](../../../static/img/Browser-Saved-Password-Failure-Detection/image_5.png)  

- Once all is done, click **Save**. The monitor will be created, and the ticket creation will be set.



