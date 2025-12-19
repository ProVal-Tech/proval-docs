---
id: 'dd28b731-7fbc-4345-8d0b-6875df1d5658'
slug: /dd28b731-7fbc-4345-8d0b-6875df1d5658
title: 'Install Windows App'
title_meta: 'Install Windows App'
keywords: ['windows', 'application', 'windows app']
description: '- Install Windows App
- Creates a shortcut on desktop
- User must be logged on to the computer to run this script.'
tags: ['windows', 'application', 'software']
draft: false
unlisted: false
---

## Summary

- Install Windows App
- Creates a shortcut on desktop
- User must be logged on to the computer to run this script

## Sample Run

Execute the script with SetEnvironment = 1, to import the required EDFs.  
![Sample Run 1](../../../static/img/docs/e076294e-fe39-44be-9e03-d620431744a3/image-1.webp) 
Normal execution of the script 
![Sample Run 2](../../../static/img/docs/e076294e-fe39-44be-9e03-d620431744a3/image-2.webp)

## Dependencies

[Solution - Install Windows App](/docs/0d8c4619-b666-44ec-93b1-2d00e4632865)

## User Parameter

| Name            | Example                                      | Required | Description                                                                                                                                                                |
|-----------------|----------------------------------------------|----------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| SetEnvironment   | 1 | False    | Set it to 1, to import the required EDFs. It is needed to run with SetEnvironment = 1, just after importing the script. |

## EDFs

| Name           | Level  | Type  | Tab | Description             |
|-----------------|--------|--------|----------|-----------------------------------------------------------------------|
| Windows App | Client | Checkbox | Software | Flag this EDF to enable Auto deployment of Windows App Windows Workstations ![EDF](../../../static/img/docs/e076294e-fe39-44be-9e03-d620431744a3/image3.webp) |
| Exclude Windows App | Location | Checkbox | Exclusions | Flag this EDF to exclude the location from Windows App auto-deployment solution ![EDF](../../../static/img/docs/e076294e-fe39-44be-9e03-d620431744a3/image4.webp) |
| Exclude Windows App | Computer | Checkbox | Exclusions | Flag this EDF to exclude the computer from Windows App auto-deployment solution ![EDF](../../../static/img/docs/e076294e-fe39-44be-9e03-d620431744a3/image5.webp) |


## Output

- Script Log