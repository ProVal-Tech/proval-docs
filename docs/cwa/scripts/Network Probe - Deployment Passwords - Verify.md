---
id: 'cwa-network-probe-credential-verification'
title: 'Network Probe Credential Verification'
title_meta: 'Network Probe Credential Verification'
keywords: ['credential', 'network', 'probe', 'verification', 'agent', 'deployment', 'authentication']
description: 'This document describes a script that verifies the accuracy of credentials provided to a Network Probe for agent installation. It tests each credential and logs the results, making it useful for troubleshooting agent installation issues.'
tags: ['network', 'credentials', 'agent', 'verification', 'troubleshooting', 'sql', 'logs']
draft: false
unlisted: false
---
## Summary

The script's determines whether or not the credentials given to a Network Probe to install agents are accurate. All the credentials will be tested against the Network Probe. If a username is saved without the "\\" symbol then it will be treated as a domain credential and will be checked as '@Domain@\@Username@'.

![Image](..\..\..\static\img\Network-Probe---Deployment-Passwords---Verify\image_1.png)

It can come in handy while troubleshooting the agent installation issues from a Network Probe.

**Intended Target:** Network Probes with Agent Deployment Enabled

## Sample Run

![Image](..\..\..\static\img\Network-Probe---Deployment-Passwords---Verify\image_2.png)

## Variables

| Name                  | Description                                                                                                                                       |
|-----------------------|---------------------------------------------------------------------------------------------------------------------------------------------------|
| AutoDeploymentCheck    | (0 or 1) An SQL query updates this variable to verify whether "Enable Automated Agent Deployment" is checked or not for the computer.           |
| sqldataset            | SQL data set of "Passwordid | Title | Username | Password" of all the credentials selected for the agent deployment.                          |
| Count                 | Number of credentials. Also serves as counter for the loop.                                                                                     |
| ValidationVariable     | A variable to store and display the result of the credential verification.                                                                       |
| ParsedDomain          | Domain Name of the computer. (Grabbed using powershell command "$env:UserDomain").                                                             |
| sqlusername           | Usernames fetched from sqldataset.                                                                                                             |
| Parsedusername        | Username without domain name. Anything occurring after "\\" symbol in the sqlusername. To be used for the validation.                          |
| sqlpassword           | Password for sqlusername grabbed from sqldataset.                                                                                               |
| sqltitle              | Credential title for the sqlusername grabbed from the sqldataset.                                                                              |
| when                  | Run time of the script                                                                                                                           |

#### Script States

| Name                                   | Example                                                                                                                                                                                                                       | Description                       |
|----------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------|
| Network Probe Credentials Status       | Title: Someone<br>UserName: PROVALDEV\Someone<br>Status: Incorrect Credentials<br>Attempt Sequence: 7<br><br>Title: Test Domain Admin DomainAdmin<br>UserName: ProValDev\DomainAdmin<br>Status: Valid Credentials<br>Domain Admin: True<br>Attempt Sequence: 6<br><br>Title: Testing - OK TO DELETE<br>UserName: PROVALDEV\LadminFE<br>Status: Incorrect Credentials<br>Attempt Sequence: 5<br><br>Title: TESTWINSRV2019<br>UserName: PROVALDEV\DomainUser<br>Status: Valid Credentials<br>Domain Admin: False<br>Attempt Sequence: 4<br><br>Title: -TESTWINSRV2016<br>UserName: PROVALDEV\Incorrect<br>Status: Incorrect Credentials<br>Attempt Sequence: 3<br><br>Title: Location Admin<br>UserName: .\locationadmin<br>Status: Incorrect Credentials<br>Attempt Sequence: 2<br><br>Title: Domain Admin Account<br>UserName: TEST\locationadmin<br>Status: Incorrect Credentials<br>Attempt Sequence: 1 | Final result of the script        |
| Network Probe Credentials Verification Date | 2022-07-31 06:28:01                                                                                                                                                                                                        | Run time of the script            |

## Process

1. Verify whether the computer is a Network Probe or not.
2. Verify whether the probe has Automated agent Deployment Enabled or not.
3. Fetch all of the passwords assigned to the probe for the agent deployment.
4. Store the number of credentials in the @Count@ variable.
5. Verify the number of credentials. Script exits if there are no credentials to check.
6. Define the variable "@ValidationVariable@".
7. Fetch the computer's Domain Name.
8. Initiate the loop to check the authenticity of each credential. Loop will be run once per credential, i.e., @Count@ number of times.
9. Fetch the @Count@ number row from the %sqldataset%.
10. Check whether the stored username contains a "\\" or not. If not, then the credential will be considered as a domain admin and will be used as @ParsedDomain@\@SQLusername@ for the verification purpose.
11. Fetch the @Parsedusername@ from the @sqlusername@, i.e., anything occurring after the "\\" symbol in the username.
12. Run the "whoami" command with the authority of @sqlusername@ and [sqlpassword@](http://@sqlpassword@).
13. Verify the outcome of the command ran in Step 12. If the outcome contains the @Parsedusername@, then the credentials are considered correct; otherwise, credentials are considered incorrect.
14. Check if it's domain admin or not for the correct credentials.
15. Write the @ValidationVariable@ variable for the credential according to the outcome of verification.
16. Repeat the loop for each credential. (Step 8 to Step 15).
17. Store the final consolidated result to the "Network Probe Credentials Status" script state and the current time to the "Network Probe Credentials Verification Date" state.
18. Generate the information logs according to the failure or success of the script.

## Output

- Script State
- Script Logs

**Sample:**

![Image](..\..\..\static\img\Network-Probe---Deployment-Passwords---Verify\image_3.png)



