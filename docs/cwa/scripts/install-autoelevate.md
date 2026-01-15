---
id: '89cb899c-e0ea-438f-903e-0bea83eb8f6c'
slug: /89cb899c-e0ea-438f-903e-0bea83eb8f6c
title: 'AutoElevate INSTALL - [Mac/Windows] [Param]'
title_meta: 'AutoElevate INSTALL - [Mac/Windows] [Param]'
keywords: ['autoelevate', 'cyberfox']
description: 'It installs the auto elevate to both MAC and Windows OS.'
tags: ['installation', 'deployment', 'application']
draft: false
unlisted: false
---

## Summary

It installs the autoelevate to both MAC and Windows OS.
**You must have the license key copied into the Company->Info screen for the script to successfully work**
Script downloads and installs the AutoElevate agent and license key.
This script was updated by Todd Jones of AutoElevate on 11/6/2019 to reflect the new MSI download location on Amazon
It was modified by ProVal to set the deployment and automation with ticket handling and EDFs deployment.


## Sample Run

- Run the script initially with the SetEnvironment = 1, to import all the required EDFs in the client's Environment
![Sample Run 1](../../../static/img/docs/c034b8a8-9024-47b0-92f7-3b1df4887adc/image.webp)
![Sample Run 2](../../../static/img/docs/c034b8a8-9024-47b0-92f7-3b1df4887adc/image1.webp)

## User Parameters

| Name           | Example                                | Required | Description                                                |
|----------------|----------------------------------------|----------|------------------------------------------------------------|
| SetEnvironment   | 1    | TFalse     | Run the script initially with the SetEnvironment = 1, to import all the required EDFs in the client's Environment |

## EDF

| Name | Level | Type | Editable | Description |
| ----------- | --------- | ------- | ----- | -------------------------------------------- |
| `AutoElevate License Key` | Client | Text | True | Provide the AutoElevate purchased license for the deployment. ![Image1](../../../static/img/docs/c034b8a8-9024-47b0-92f7-3b1df4887adc/image4.webp) |
| `AE Company Short Initials` | Client | Text | True | ENTER 2 or 3 Character Initials for this client that will show up in the Technicians Mobile App ![Image1](../../../static/img/docs/c034b8a8-9024-47b0-92f7-3b1df4887adc/image4.webp) |
| `AutoElevate Enable Deployment` | Client | Checkbox | True | This checkbox will enable the AutoElevate Deployment for the endpoints of the client. ![Image2](../../../static/img/docs/c034b8a8-9024-47b0-92f7-3b1df4887adc/image4.webp) |
| `Exclude AutoElevate Deployment` | Location | Checkbox | True | This checkbox will exclude the AutoElevate deployment on the location's endpoints. ![Image3](../../../static/img/docs/c034b8a8-9024-47b0-92f7-3b1df4887adc/image5.webp) |
| `Exclude AutoElevate Deployment` | Computer | Checkbox | True | This checkbox will exclude the AutoElevate deployment on the endpoint. ![Image4](../../../static/img/docs/c034b8a8-9024-47b0-92f7-3b1df4887adc/image3.webp)|

## Process

The script performs the AutoElevate installation to both MAC and Windows OS.
It downloads the msi or sh file from the "https://autoelevate-installers.s3.us-east-2.amazonaws.com/current" and then deploys it using the license key provided in the EDF `AutoElevate License Key`.

## Output

- Script log