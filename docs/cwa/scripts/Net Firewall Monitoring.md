---
id: 'cwa_network_firewall_setup'
title: 'Network Firewall Setup and Monitoring'
title_meta: 'Network Firewall Setup and Monitoring'
keywords: ['firewall', 'monitoring', 'network', 'security', 'compliance']
description: 'This document provides a comprehensive guide on implementing and removing the Network Firewall solution, detailing the steps required for installation and removal, as well as the processes involved in monitoring network firewall statuses. It includes important notes and troubleshooting tips for effective management of the firewall solution.'
tags: ['network', 'security', 'monitoring', 'setup', 'removal', 'compliance']
draft: false
unlisted: false
---
# Summary

This script will implement or remove the setup of the entire Network Firewall solution.

# Sample Run

## Install the solution

![Image](5078775/docs/11822859/images/16562084)

Leaving the Action blank or entering anything other than uninstall will install the solution based on the following condition

![Image](5078775/docs/11822859/images/16562092)

## Remove the Solution

![Image](5078775/docs/11822859/images/16562098)

Setting Action to Uninstall will remove the solution based on the following condition.

![Image](https://proval.itglue.com/5078775/docs/11822859/images/16562092)

# Technician Required Steps

## Installation

1. Import the Net Firewall Monitoring script 
2. Run the Net Firewall Monitoring script with the Action blank or set to anything other than Uninstall.
3. Go through your clients and set the SecurityCompliance edf at any client you wish to monitor the net firewall.
4. Go through the Client machines and set any exclusion to this monitoring in the computer level securitycompliance Windows Firewall Monitoring Exclusion edf.
5. Remove the Net Firewall Monitoring script from the system.

Important Notes.

1. Groups can take up to an hour to populate with data please be patient when setting this up.

## Removal

1. Import the Net Firewall Monitoring script.
2. Run the Net Firewall Monitoring script with the Action set to Uninstall.
3. Remove the Net Firewall Monitoring script from the system.

# Process (Installation)

## Creates the Network Firewall Monitor EDFs

- Client Level, under Security Compliance

![Image](5078775/docs/11822859/images/16556068)

- Computer Level Exclusion under Security Compliance

![Image](5078775/docs/11822859/images/16556108)

## Creates the Searches

- Windows Firewall Enabled

![Image](5078775/docs/11822859/images/16556159)

- Windows Firewall Monitoring Enabled - Servers

![Image](5078775/docs/11822859/images/16556210)

- Windows Firewall Monitoring Enabled - Workstations

![Image](5078775/docs/11822859/images/16556251)

## Creates the groups

- △ System Monitoring

![Image](5078775/docs/11822859/images/16556281)

- △ Windows Firewall

![Image](5078775/docs/11822859/images/16556324)

## Creates and links the Remote Monitors

- △ Disabled Net Firewall Profile

![Image](5078775/docs/11822859/images/16556343)
![Image](5078775/docs/11822859/images/16556345)

- △ Enable Net Firewall Profile Failed

![Image](5078775/docs/11822859/images/16556350)
![Image](5078775/docs/11822859/images/16556360)

# Process (Removal)

## Remove the remote monitors

![Image](5078775/docs/11822859/images/16562060)

## Remove the Groups

![Image](5078775/docs/11822859/images/16562065)

## Remove the Searches

![Image](5078775/docs/11822859/images/16562068)

## Remove any filled in extra data field data

![Image](5078775/docs/11822859/images/16562071)

## Remove the EDFs

![Image](5078775/docs/11822859/images/16562073)

# Explanation of Solution

1. The EDFs populate the group △ Windows Firewall with computers that should be monitored and are not explicitly excluded with the computer level edf.
2. The remote monitor △ Disabled Net Firewall Profile is limited to the servers in the Windows Firewall Monitoring Enabled - Servers search and creates a ticket if any net firewall profile is set to disabled.
3. The remote monitor △ Enable Net Firewall Profile Failed is limited to the workstations in the Windows Firewall Monitoring Enabled - Workstations search and creates a ticket if any disabled net firewall profile is unable to be set to enabled.

Ticketing is formatted and should not autoclose but every 10 days (a limitation of automate set to maximum) will append another failed note to any created ticket that is still open.

# Ticketing

## △ Enable Net Firewall Profile Failed

![Image](5078775/docs/11822859/images/16562207)

1. This line shows the actionable item that needs to be addressed.
2. This reflects the monitor that triggered this ticket
3. This reflects the status of that monitor on the target
4. This reflects the target of the monitor
5. This is the returned data from the target when running the monitor. This will tell you why the target failed, in the above case it appears that there may be a logon failure preventing this action from being taken, this error should be evaluated on the target and any corrective action to resolve this issue should be taken.

## △ Disabled Net Firewall Profile

![Image](5078775/docs/11822859/images/16562287)

1. This line shows the actionable item that needs to be addressed. (This monitor for some reason is including a :1737 in the return, I believe this has something to do with a potential array being passed back in automate it is formatting as a new line.
2. This reflects the monitor that triggered this ticket
3. This reflects the status of that monitor on the target
4. This reflects the target of the monitor
5. This is the returned data from the target when running the monitor. This will tell you why the target failed, in this case it is showing that the monitor failed because the public Net firewall is disabled.

