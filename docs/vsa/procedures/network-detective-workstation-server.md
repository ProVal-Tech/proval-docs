---
id: '6c3d68e8-61cd-4e74-a13f-d6be1516feec'
slug: /6c3d68e8-61cd-4e74-a13f-d6be1516feec
title: 'Network Detective Workstation  Server'
title_meta: 'Network Detective Workstation  Server'
keywords: ['network', 'detective', 'scan', 'results', 'procedure', 'admin']
description: 'This document outlines the procedures for deploying the Network Detective tool to workstations or servers, executing scans, and logging the results for further analysis. It includes detailed steps, dependencies, and expected outcomes.'
tags: ['installation', 'networking', 'setup', 'windows']
draft: false
unlisted: false
---

## Network Detective Procedures

**Procedure intent:**  
To push Network Detective to the workstation or server, then run a scan and log the results.

**Script location within PVAL VSA:**  
Shared/PVAL Content Source/Network Detective/Network Detective Procedure - Server  
Shared/PVAL Content Source/Network Detective/Network Detective Procedure - Workstation

**Dependencies:**  
Directory: VSASharedFiles/Procedures/Network Detective

---

### Shared/PVAL Content Source/Network Detective/Network Detective Procedure - Server

```json
[
    {
        "RefId": "101",
        "Type": 0,
        "Depth": 0,
        "Fold": false,
        "Hide": false,
        "Error": false,
        "ErrorMessage": "",
        "ParameterValues": [
            {
                "Name": "comment",
                "Value": "Gets the variables we'll need to run the Detective from the admin running the procedure",
                "Select": false,
                "PasswordParameter": false
            }
        ],
        "ComparisonValue": {
            "DefaultWidth": 100,
            "Description": "needs description",
            "Value": "Gets the variables we'll need to run the Detective from the admin running the procedure",
            "Type": 9,
            "Position": 9
        }
    },
    {
        "RefId": "426",
        "Type": 3,
        "Depth": 0,
        "Fold": false,
        "Hide": false,
        "Error": false,
        "ErrorMessage": "",
        "ParameterValues": [
            {
                "ScriptParameter": 0,
                "Value": "16",
                "Select": true,
                "NumberOnly": false,
                "VariableDefinition": false,
                "PasswordParameter": false
            },
            {
                "ScriptParameter": 1,
                "Value": "Type the IP range of the LAN segment that the detector will scan in the following format: xxx.xxx.xxx.0-xxx.xxx.xxx.255",
                "PasswordParameter": false
            },
            {
                "ScriptParameter": 2,
                "Value": "iprange",
                "Select": false,
                "NumberOnly": false,
                "VariableDefinition": true,
                "PasswordParameter": false
            },
            {
                "NumberOnly": false,
                "Value": "0",
                "Select": true,
                "VariableDefinition": false,
                "PasswordParameter": false
            },
            {
                "ScriptParameter": 4,
                "Value": "false",
                "Select": true,
                "NumberOnly": false,
                "VariableDefinition": false,
                "PasswordParameter": false
            }
        ]
    },
    {
        "RefId": "426",
        "Type": 3,
        "Depth": 0,
        "Fold": false,
        "Hide": false,
        "Error": false,
        "ErrorMessage": "",
        "ParameterValues": [
            {
                "ScriptParameter": 0,
                "Value": "16",
                "Select": true,
                "NumberOnly": false,
                "VariableDefinition": false,
                "PasswordParameter": false
            },
            {
                "ScriptParameter": 1,
                "Value": "Type the full domain name and username used to run Network Detector (Should be an administrator) in the following format: example.company.com\\administrator",
                "PasswordParameter": false
            },
            {
                "ScriptParameter": 2,
                "Value": "aduser",
                "Select": false,
                "NumberOnly": false,
                "VariableDefinition": true,
                "PasswordParameter": false
            },
            {
                "NumberOnly": false,
                "Value": "0",
                "Select": true,
                "VariableDefinition": false,
                "PasswordParameter": false
            },
            {
                "ScriptParameter": 4,
                "Value": "false",
                "Select": true,
                "NumberOnly": false,
                "VariableDefinition": false,
                "PasswordParameter": false
            }
        ]
    },
    {
        "RefId": "426",
        "Type": 3,
        "Depth": 0,
        "Fold": false,
        "Hide": false,
        "Error": false,
        "ErrorMessage": "",
        "ParameterValues": [
            {
                "ScriptParameter": 0,
                "Value": "16",
                "Select": true,
                "NumberOnly": false,
                "VariableDefinition": false,
                "PasswordParameter": false
            },
            {
                "ScriptParameter": 1,
                "Value": "Type the password of the administrator account used to run Network Detective:",
                "PasswordParameter": false
            },
            {
                "ScriptParameter": 2,
                "Value": "adpswd",
                "Select": false,
                "NumberOnly": false,
                "VariableDefinition": true,
                "PasswordParameter": false
            },
            {
                "NumberOnly": false,
                "Value": "0",
                "Select": true,
                "VariableDefinition": false,
                "PasswordParameter": false
            },
            {
                "ScriptParameter": 4,
                "Value": "false",
                "Select": true,
                "NumberOnly": false,
                "VariableDefinition": false,
                "PasswordParameter": false
            }
        ]
    },
    {
        "RefId": "101",
        "Type": 0,
        "Depth": 0,
        "Fold": false,
        "Hide": false,
        "Error": false,
        "ErrorMessage": "",
        "ParameterValues": [
            {
                "Name": "comment",
                "Value": "Pushes Network Detective scanning tool to agent working directory.",
                "Select": false,
                "PasswordParameter": false
            }
        ],
        "ComparisonValue": {
            "DefaultWidth": 100,
            "Description": "needs description",
            "Value": "Pushes Network Detective scanning tool to agent working directory.",
            "Type": 9,
            "Position": 9
        }
    },
    {
        "RefId": "203",
        "Type": 1,
        "Depth": 0,
        "Fold": false,
        "Hide": false,
        "Error": false,
        "ErrorMessage": "",
        "ParameterValues": [
            {
                "ScriptParameter": 0,
                "Value": "C:\\System\\Network Detective\\nddc.exe",
                "PasswordParameter": false
            }
        ],
        "Operator": {
            "Value": "2"
        },
        "ComparisonValue": {
            "Position": 0,
            "Description": "",
            "Type": 0,
            "DefaultWidth": 150,
            "Value": ""
        },
        "ShowFoldButton": true
    },
    {
        "RefId": "425",
        "Type": 3,
        "Depth": 1,
        "Fold": false,
        "Hide": false,
        "Error": false,
        "ErrorMessage": "",
        "ParameterValues": [
            {
                "ScriptParameter": 0,
                "Value": "Copying Network Detective files to working directory",
                "PasswordParameter": false
            },
            {
                "NumberOnly": false,
                "Value": "0",
                "Select": true,
                "VariableDefinition": false,
                "PasswordParameter": false
            },
            {
                "ScriptParameter": 4,
                "Value": "false",
                "Select": true,
                "NumberOnly": false,
                "VariableDefinition": false,
                "PasswordParameter": false
            }
        ]
    },
    {
        "RefId": "433",
        "Type": 3,
        "Depth": 1,
        "Fold": false,
        "Hide": false,
        "Error": false,
        "ErrorMessage": "",
        "ParameterValues": [
            {
                "ScriptParameter": 1,
                "Value": "VSASharedFiles\\Procedures\\Network Detective\\",
                "SpecialParameter": "FILE_DIRECTORY_PARAMETER"
            },
            {
                "ScriptParameter": 0,
                "Value": "C:\\System\\Network Detective",
                "PasswordParameter": false
            },
            {
                "ScriptParameter": 2,
                "Value": "NoShow",
                "Select": true,
                "NumberOnly": false,
                "VariableDefinition": false,
                "PasswordParameter": false
            },
            {
                "NumberOnly": false,
                "Value": "0",
                "Select": true,
                "VariableDefinition": false,
                "PasswordParameter": false
            },
            {
                "ScriptParameter": 4,
                "Value": "false",
                "Select": true,
                "NumberOnly": false,
                "VariableDefinition": false,
                "PasswordParameter": false
            }
        ]
    },
    {
        "RefId": "102",
        "Type": 1,
        "Depth": 0,
        "Fold": false,
        "Hide": false,
        "Error": false,
        "ErrorMessage": "",
        "ParameterValues": [],
        "ShowFoldButton": true
    },
    {
        "RefId": "425",
        "Type": 3,
        "Depth": 1,
        "Fold": false,
        "Hide": false,
        "Error": false,
        "ErrorMessage": "",
        "ParameterValues": [
            {
                "ScriptParameter": 0,
                "Value": "Deleting old data and copying Network Detective files to working directory",
                "PasswordParameter": false
            },
            {
                "NumberOnly": false,
                "Value": "0",
                "Select": true,
                "VariableDefinition": false,
                "PasswordParameter": false
            },
            {
                "ScriptParameter": 4,
                "Value": "false",
                "Select": true,
                "NumberOnly": false,
                "VariableDefinition": false,
                "PasswordParameter": false
            }
        ]
    },
    {
        "RefId": "540",
        "Type": 3,
        "Depth": 1,
        "Fold": false,
        "Hide": false,
        "Error": false,
        "ErrorMessage": "",
        "ParameterValues": [
            {
                "ScriptParameter": 0,
                "Value": "C:\\System\\Network Detective",
                "PasswordParameter": false
            },
            {
                "ScriptParameter": 1,
                "Value": "true",
                "Select": true,
                "NumberOnly": false,
                "VariableDefinition": false,
                "PasswordParameter": false
            },
            {
                "NumberOnly": false,
                "Value": "0",
                "Select": true,
                "VariableDefinition": false,
                "PasswordParameter": false
            },
            {
                "ScriptParameter": 4,
                "Value": "false",
                "Select": true,
                "NumberOnly": false,
                "VariableDefinition": false,
                "PasswordParameter": false
            }
        ]
    },
    {
        "RefId": "433",
        "Type": 3,
        "Depth": 1,
        "Fold": false,
        "Hide": false,
        "Error": false,
        "ErrorMessage": "",
        "ParameterValues": [
            {
                "ScriptParameter": 1,
                "Value": "VSASharedFiles\\Procedures\\Network Detective\\",
                "SpecialParameter": "FILE_DIRECTORY_PARAMETER"
            },
            {
                "ScriptParameter": 0,
                "Value": "C:\\System\\Network Detective",
                "PasswordParameter": false
            },
            {
                "ScriptParameter": 2,
                "Value": "NoShow",
                "Select": true,
                "NumberOnly": false,
                "VariableDefinition": false,
                "PasswordParameter": false
            },
            {
                "NumberOnly": false,
                "Value": "0",
                "Select": true,
                "VariableDefinition": false,
                "PasswordParameter": false
            },
            {
                "ScriptParameter": 4,
                "Value": "false",
                "Select": true,
                "NumberOnly": false,
                "VariableDefinition": false,
                "PasswordParameter": false
            }
        ]
    },
    {
        "RefId": "425",
        "Type": 3,
        "Depth": 0,
        "Fold": false,
        "Hide": false,
        "Error": false,
        "ErrorMessage": "",
        "ParameterValues": [
            {
                "ScriptParameter": 0,
                "Value": "Network Detective Directory Ready",
                "PasswordParameter": false
            },
            {
                "NumberOnly": false,
                "Value": "0",
                "Select": true,
                "VariableDefinition": false,
                "PasswordParameter": false
            },
            {
                "ScriptParameter": 4,
                "Value": "false",
                "Select": true,
                "NumberOnly": false,
                "VariableDefinition": false,
                "PasswordParameter": false
            }
        ]
    },
    {
        "RefId": "101",
        "Type": 0,
        "Depth": 0,
        "Fold": false,
        "Hide": false,
        "Error": false,
        "ErrorMessage": "",
        "ParameterValues": [
            {
                "Name": "comment",
                "Value": "Then, we run Network Detective and wait for an hour",
                "Select": false,
                "PasswordParameter": false
            }
        ],
        "ComparisonValue": {
            "DefaultWidth": 100,
            "Description": "needs description",
            "Value": "Then, we run Network Detective and wait for an hour",
            "Type": 9,
            "Position": 9
        }
    },
    {
        "RefId": "425",
        "Type": 3,
        "Depth": 0,
        "Fold": false,
        "Hide": false,
        "Error": false,
        "ErrorMessage": "",
        "ParameterValues": [
            {
                "ScriptParameter": 0,
                "Value": "Scan in progress. Please allow up to 1 hour for scan to finish.",
                "PasswordParameter": false
            },
            {
                "NumberOnly": false,
                "Value": "0",
                "Select": true,
                "VariableDefinition": false,
                "PasswordParameter": false
            },
            {
                "ScriptParameter": 4,
                "Value": "false",
                "Select": true,
                "NumberOnly": false,
                "VariableDefinition": false,
                "PasswordParameter": false
            }
        ]
    },
    {
        "RefId": "430",
        "Type": 3,
        "Depth": 0,
        "Fold": false,
        "Hide": false,
        "Error": false,
        "ErrorMessage": "",
        "ParameterValues": [
            {
                "ScriptParameter": 0,
                "Value": "#adminDefaults.adminEmail#",
                "PasswordParameter": false
            },
            {
                "ScriptParameter": 1,
                "Value": "Scan is running on #vAgentConfiguration.Workgroupdomainname#",
                "PasswordParameter": false
            },
            {
                "ScriptParameter": 2,
                "Value": "Scan is running, and could take up to 1 hour to complete. The scan result file will be copied to your working directory once the scan is complete. You will receive an email when the scan is complete and the file is copied.",
                "PasswordParameter": false
            },
            {
                "NumberOnly": false,
                "Value": "0",
                "Select": true,
                "VariableDefinition": false,
                "PasswordParameter": false
            },
            {
                "ScriptParameter": 4,
                "Value": "false",
                "Select": true,
                "NumberOnly": false,
                "VariableDefinition": false,
                "PasswordParameter": false
            }
        ]
    },
    {
        "RefId": "101",
        "Type": 0,
        "Depth": 0,
        "Fold": false,
        "Hide": false,
        "Error": false,
        "ErrorMessage": "",
        "ParameterValues": [
            {
                "Name": "comment",
                "Value": "I found that if we don't pause before starting the scan, the procedure sometimes fails to email the admin that the scan has started. The pause is a safeguard against that behavior.",
                "Select": false,
                "PasswordParameter": false
            }
        ],
        "ComparisonValue": {
            "DefaultWidth": 100,
            "Description": "needs description",
            "Value": "I found that if we don't pause before starting the scan, the procedure sometimes fails to email the admin that the scan has started. The pause is a safeguard against that behavior.",
            "Type": 9,
            "Position": 9
        }
    },
    {
        "RefId": "424",
        "Type": 3,
        "Depth": 0,
        "Fold": false,
        "Hide": false,
        "Error": false,
        "ErrorMessage": "",
        "ParameterValues": [
            {
                "ScriptParameter": 0,
                "Value": "60",
                "Select": false,
                "NumberOnly": true,
                "VariableDefinition": false,
                "PasswordParameter": false
            },
            {
                "NumberOnly": false,
                "Value": "0",
                "Select": true,
                "VariableDefinition": false,
                "PasswordParameter": false
            },
            {
                "ScriptParameter": 4,
                "Value": "false",
                "Select": true,
                "NumberOnly": false,
                "VariableDefinition": false,
                "PasswordParameter": false
            }
        ]
    },
    {
        "RefId": "101",
        "Type": 0,
        "Depth": 0,
        "Fold": false,
        "Hide": false,
        "Error": false,
        "ErrorMessage": "",
        "ParameterValues": [
            {
                "Name": "comment",
                "Value": "Here's the scan itself",
                "Select": false,
                "PasswordParameter": false
            }
        ],
        "ComparisonValue": {
            "DefaultWidth": 100,
            "Description": "needs description",
            "Value": "Here's the scan itself",
            "Type": 9,
            "Position": 9
        }
    },
    {
        "RefId": "420",
        "Type": 3,
        "Depth": 0,
        "Fold": false,
        "Hide": false,
        "Error": false,
        "ErrorMessage": "",
        "ParameterValues": [
            {
                "ScriptParameter": 0,
                "Value": "C:\\System\\Network Detective\\nddc -File C:\\System\\Network Detective\\NetworkDetectiveSettings.ndp -ipranges #iprange# -credsuser #aduser# -credspwd #adpswd#",
                "PasswordParameter": false
            },
            {
                "ScriptParameter": 1,
                "Value": "1",
                "Select": true,
                "NumberOnly": false,
                "VariableDefinition": false,
                "PasswordParameter": false
            },
            {
                "NumberOnly": false,
                "Value": "0",
                "Select": true,
                "VariableDefinition": false,
                "PasswordParameter": false
            },
            {
                "ScriptParameter": 4,
                "Value": "false",
                "Select": true,
                "NumberOnly": false,
                "VariableDefinition": false,
                "PasswordParameter": false
            }
        ]
    },
    {
        "RefId": "101",
        "Type": 0,
        "Depth": 0,
        "Fold": false,
        "Hide": false,
        "Error": false,
        "ErrorMessage": "",
        "ParameterValues": [
            {
                "Name": "comment",
                "Value": "In either case, the admin who ran the procedure gets an email about scan success or failure",
                "Select": false,
                "PasswordParameter": false
            }
        ],
        "ComparisonValue": {
            "DefaultWidth": 100,
            "Description": "needs description",
            "Value": "In either case, the admin who ran the procedure gets an email about scan success or failure",
            "Type": 9,
            "Position": 9
        }
    },
    {
        "RefId": "203",
        "Type": 1,
        "Depth": 0,
        "Fold": false,
        "Hide": false,
        "Error": false,
        "ErrorMessage": "",
        "ParameterValues": [
            {
                "ScriptParameter": 0,
                "Value": "C:\\System\\Network Detective\\scanresults.ndf",
                "PasswordParameter": false
            }
        ],
        "Operator": {
            "Value": "1"
        },
        "ComparisonValue": {
            "Position": 0,
            "Description": "",
            "Type": 0,
            "DefaultWidth": 150,
            "Value": ""
        },
        "ShowFoldButton": true
    },
    {
        "RefId": "515",
        "Type": 3,
        "Depth": 1,
        "Fold": false,
        "Hide": false,
        "Error": false,
        "ErrorMessage": "",
        "ParameterValues": [
            {
                "ScriptParameter": 0,
                "Value": "C:\\System\\Network Detective\\scanresults.ndf",
                "PasswordParameter": false
            },
            {
                "ScriptParameter": 1,
                "Value": "C:\\System\\Network Detective\\NDOutput\\#vAgentConfiguration.Workgroupdomainname#.ndf",
                "PasswordParameter": false
            },
            {
                "ScriptParameter": 2,
                "Value": "false",
                "Select": true,
                "NumberOnly": false,
                "VariableDefinition": false,
                "PasswordParameter": false
            },
            {
                "NumberOnly": false,
                "Value": "0",
                "Select": true,
                "VariableDefinition": false,
                "PasswordParameter": false
            },
            {
                "ScriptParameter": 4,
                "Value": "false",
                "Select": true,
                "NumberOnly": false,
                "VariableDefinition": false,
                "PasswordParameter": false
            }
        ]
    },
    {
        "RefId": "430",
        "Type": 3,
        "Depth": 1,
        "Fold": false,
        "Hide": false,
        "Error": false,
        "ErrorMessage": "",
        "ParameterValues": [
            {
                "ScriptParameter": 0,
                "Value": "#adminDefaults.adminEmail#",
                "PasswordParameter": false
            },
            {
                "ScriptParameter": 1,
                "Value": "Scan is complete on #vAgentConfiguration.Workgroupdomainname#",
                "PasswordParameter": false
            },
            {
                "ScriptParameter": 2,
                "Value": "Please check for the file in C:\\System\\NDDC\\",
                "PasswordParameter": false
            },
            {
                "NumberOnly": false,
                "Value": "0",
                "Select": true,
                "VariableDefinition": false,
                "PasswordParameter": false
            },
            {
                "ScriptParameter": 4,
                "Value": "false",
                "Select": true,
                "NumberOnly": false,
                "VariableDefinition": false,
                "PasswordParameter": false
            }
        ]
    },
    {
        "RefId": "102",
        "Type": 1,
        "Depth": 0,
        "Fold": false,
        "Hide": false,
        "Error": false,
        "ErrorMessage": "",
        "ParameterValues": []
    },
    {
        "RefId": "425",
        "Type": 3,
        "Depth": 1,
        "Fold": false,
        "Hide": false,
        "Error": false,
        "ErrorMessage": "",
        "ParameterValues": [
            {
                "ScriptParameter": 0,
                "Value": "Scan failed to complete.",
                "PasswordParameter": false
            },
            {
                "NumberOnly": false,
                "Value": "0",
                "Select": true,
                "VariableDefinition": false,
                "PasswordParameter": false
            },
            {
                "ScriptParameter": 4,
                "Value": "false",
                "Select": true,
                "NumberOnly": false,
                "VariableDefinition": false,
                "PasswordParameter": false
            }
        ]
    },
    {
        "RefId": "430",
        "Type": 3,
        "Depth": 1,
        "Fold": false,
        "Hide": false,
        "Error": false,
        "ErrorMessage": "",
        "ParameterValues": [
            {
                "ScriptParameter": 0,
                "Value": "#adminDefaults.adminEmail#",
                "PasswordParameter": false
            },
            {
                "ScriptParameter": 1,
                "Value": "Scan has not completed on #vAgentConfiguration.Workgroupdomainname#",
                "PasswordParameter": false
            },
            {
                "ScriptParameter": 2,
                "Value": "Scan has not completed on #vAgentConfiguration.machname#. Please check scan results manually for errors.",
                "PasswordParameter": false
            },
            {
                "NumberOnly": false,
                "Value": "0",
                "Select": true,
                "VariableDefinition": false,
                "PasswordParameter": false
            },
            {
                "ScriptParameter": 4,
                "Value": "false",
                "Select": true,
                "NumberOnly": false,
                "VariableDefinition": false,
                "PasswordParameter": false
            }
        ]
    }
]
```

---

### Shared/PVAL Content Source/Network Detective/Network Detective Procedure - Workstation

```json
[
    {
        "RefId": "101",
        "Type": 0,
        "Depth": 0,
        "Fold": false,
        "Hide": false,
        "Error": false,
        "ErrorMessage": "",
        "ParameterValues": [
            {
                "Name": "comment",
                "Value": "Gets the variables we'll need to run the Detective from the admin running the procedure",
                "Select": false,
                "PasswordParameter": false
            }
        ],
        "ComparisonValue": {
            "DefaultWidth": 100,
            "Description": "needs description",
            "Value": "Gets the variables we'll need to run the Detective from the admin running the procedure",
            "Type": 9,
            "Position": 9
        }
    },
    {
        "RefId": "426",
        "Type": 3,
        "Depth": 0,
        "Fold": false,
        "Hide": false,
        "Error": false,
        "ErrorMessage": "",
        "ParameterValues": [
            {
                "ScriptParameter": 0,
                "Value": "16",
                "Select": true,
                "NumberOnly": false,
                "VariableDefinition": false,
                "PasswordParameter": false
            },
            {
                "ScriptParameter": 1,
                "Value": "Type the Machine ID of the computer where we will save the output files. Ex. dc-01.clientname.edmonton.office",
                "PasswordParameter": false
            },
            {
                "ScriptParameter": 2,
                "Value": "server",
                "Select": false,
                "NumberOnly": false,
                "VariableDefinition": true,
                "PasswordParameter": false
            },
            {
                "NumberOnly": false,
                "Value": "0",
                "Select": true,
                "VariableDefinition": false,
                "PasswordParameter": false
            },
            {
                "ScriptParameter": 4,
                "Value": "false",
                "Select": true,
                "NumberOnly": false,
                "VariableDefinition": false,
                "PasswordParameter": false
            }
        ]
    },
    {
        "RefId": "426",
        "Type": 3,
        "Depth": 0,
        "Fold": false,
        "Hide": false,
        "Error": false,
        "ErrorMessage": "",
        "ParameterValues": [
            {
                "ScriptParameter": 0,
                "Value": "16",
                "Select": true,
                "NumberOnly": false,
                "VariableDefinition": false,
                "PasswordParameter": false
            },
            {
                "ScriptParameter": 1,
                "Value": "Type the full domain name and username used to run Network Detector (Should be an administrator) in the following format: example.company.com\\administrator",
                "PasswordParameter": false
            },
            {
                "ScriptParameter": 2,
                "Value": "aduser",
                "Select": false,
                "NumberOnly": false,
                "VariableDefinition": true,
                "PasswordParameter": false
            },
            {
                "NumberOnly": false,
                "Value": "0",
                "Select": true,
                "VariableDefinition": false,
                "PasswordParameter": false
            },
            {
                "ScriptParameter": 4,
                "Value": "false",
                "Select": true,
                "NumberOnly": false,
                "VariableDefinition": false,
                "PasswordParameter": false
            }
        ]
    },
    {
        "RefId": "426",
        "Type": 3,
        "Depth": 0,
        "Fold": false,
        "Hide": false,
        "Error": false,
        "ErrorMessage": "",
        "ParameterValues": [
            {
                "ScriptParameter": 0,
                "Value": "16",
                "Select": true,
                "NumberOnly": false,
                "VariableDefinition": false,
                "PasswordParameter": false
            },
            {
                "ScriptParameter": 1,
                "Value": "Type the password of the administrator account used to run Network Detective:",
                "PasswordParameter": false
            },
            {
                "ScriptParameter": 2,
                "Value": "adpswd",
                "Select": false,
                "NumberOnly": false,
                "VariableDefinition": true,
                "PasswordParameter": false
            },
            {
                "NumberOnly": false,
                "Value": "0",
                "Select": true,
                "VariableDefinition": false,
                "PasswordParameter": false
            },
            {
                "ScriptParameter": 4,
                "Value": "false",
                "Select": true,
                "NumberOnly": false,
                "VariableDefinition": false,
                "PasswordParameter": false
            }
        ]
    },
    {
        "RefId": "101",
        "Type": 0,
        "Depth": 0,
        "Fold": false,
        "Hide": false,
        "Error": false,
        "ErrorMessage": "",
        "ParameterValues": [
            {
                "Name": "comment",
                "Value": "Pushes Network Detective scanning tool to agent working directory.",
                "Select": false,
                "PasswordParameter": false
            }
        ],
        "ComparisonValue": {
            "DefaultWidth": 100,
            "Description": "needs description",
            "Value": "Pushes Network Detective scanning tool to agent working directory.",
            "Type": 9,
            "Position": 9
        }
    },
    {
        "RefId": "203",
        "Type": 1,
        "Depth": 0,
        "Fold": false,
        "Hide": false,
        "Error": false,
        "ErrorMessage": "",
        "ParameterValues": [
            {
                "ScriptParameter": 0,
                "Value": "#vAgentConfiguration.agentTempDir#\\NetworkDetective\\nddc.exe",
                "PasswordParameter": false
            }
        ],
        "Operator": {
            "Value": "2"
        },
        "ComparisonValue": {
            "Position": 0,
            "Description": "",
            "Type": 0,
            "DefaultWidth": 150,
            "Value": ""
        },
        "ShowFoldButton": true
    },
    {
        "RefId": "425",
        "Type": 3,
        "Depth": 1,
        "Fold": false,
        "Hide": false,
        "Error": false,
        "ErrorMessage": "",
        "ParameterValues": [
            {
                "ScriptParameter": 0,
                "Value": "Copying Network Detective files to working directory",
                "PasswordParameter": false
            },
            {
                "NumberOnly": false,
                "Value": "0",
                "Select": true,
                "VariableDefinition": false,
                "PasswordParameter": false
            },
            {
                "ScriptParameter": 4,
                "Value": "false",
                "Select": true,
                "NumberOnly": false,
                "VariableDefinition": false,
                "PasswordParameter": false
            }
        ]
    },
    {
        "RefId": "433",
        "Type": 3,
        "Depth": 1,
        "Fold": false,
        "Hide": false,
        "Error": false,
        "ErrorMessage": "",
        "ParameterValues": [
            {
                "ScriptParameter": 1,
                "Value": "VSASharedFiles\\Procedures\\Network Detective\\",
                "SpecialParameter": "FILE_DIRECTORY_PARAMETER"
            },
            {
                "ScriptParameter": 0,
                "Value": "#vagentconfiguration.agenttempdir#\\Network Detective",
                "PasswordParameter": false
            },
            {
                "ScriptParameter": 2,
                "Value": "NoShow",
                "Select": true,
                "NumberOnly": false,
                "VariableDefinition": false,
                "PasswordParameter": false
            },
            {
                "NumberOnly": false,
                "Value": "0",
                "Select": true,
                "VariableDefinition": false,
                "PasswordParameter": false
            },
            {
                "ScriptParameter": 4,
                "Value": "false",
                "Select": true,
                "NumberOnly": false,
                "VariableDefinition": false,
                "PasswordParameter": false
            }
        ]
    },
    {
        "RefId": "425",
        "Type": 3,
        "Depth": 0,
        "Fold": false,
        "Hide": false,
        "Error": false,
        "ErrorMessage": "",
        "ParameterValues": [
            {
                "ScriptParameter": 0,
                "Value": "Network Detective Directory Ready",
                "PasswordParameter": false
            },
            {
                "NumberOnly": false,
                "Value": "0",
                "Select": true,
                "VariableDefinition": false,
                "PasswordParameter": false
            },
            {
                "ScriptParameter": 4,
                "Value": "false",
                "Select": true,
                "NumberOnly": false,
                "VariableDefinition": false,
                "PasswordParameter": false
            }
        ]
    },
    {
        "RefId": "101",
        "Type": 0,
        "Depth": 0,
        "Fold": false,
        "Hide": false,
        "Error": false,
        "ErrorMessage": "",
        "ParameterValues": [
            {
                "Name": "comment",
                "Value": "Then, we run Network Detective and wait for an hour",
                "Select": false,
                "PasswordParameter": false
            }
        ],
        "ComparisonValue": {
            "DefaultWidth": 100,
            "Description": "needs description",
            "Value": "Then, we run Network Detective and wait for an hour",
            "Type": 9,
            "Position": 9
        }
    },
    {
        "RefId": "425",
        "Type": 3,
        "Depth": 0,
        "Fold": false,
        "Hide": false,
        "Error": false,
        "ErrorMessage": "",
        "ParameterValues": [
            {
                "ScriptParameter": 0,
                "Value": "Scan in progress. Please allow up to 1 hour for scan to finish.",
                "PasswordParameter": false
            },
            {
                "NumberOnly": false,
                "Value": "0",
                "Select": true,
                "VariableDefinition": false,
                "PasswordParameter": false
            },
            {
                "ScriptParameter": 4,
                "Value": "false",
                "Select": true,
                "NumberOnly": false,
                "VariableDefinition": false,
                "PasswordParameter": false
            }
        ]
    },
    {
        "RefId": "430",
        "Type": 3,
        "Depth": 0,
        "Fold": false,
        "Hide": false,
        "Error": false,
        "ErrorMessage": "",
        "ParameterValues": [
            {
                "ScriptParameter": 0,
                "Value": "#adminDefaults.adminEmail#",
                "PasswordParameter": false
            },
            {
                "ScriptParameter": 1,
                "Value": "Scan is running on #vAgentConfiguration.Workgroupdomainname#",
                "PasswordParameter": false
            },
            {
                "ScriptParameter": 2,
                "Value": "Scan is running, and could take up to 1 hour to complete. The scan result file will be copied to your working directory once the scan is complete. You will receive an email when the scan is complete and the file is copied.",
                "PasswordParameter": false
            },
            {
                "NumberOnly": false,
                "Value": "0",
                "Select": true,
                "VariableDefinition": false,
                "PasswordParameter": false
            },
            {
                "ScriptParameter": 4,
                "Value": "false",
                "Select": true,
                "NumberOnly": false,
                "VariableDefinition": false,
                "PasswordParameter": false
            }
        ]
    },
    {
        "RefId": "101",
        "Type": 0,
        "Depth": 0,
        "Fold": false,
        "Hide": false,
        "Error": false,
        "ErrorMessage": "",
        "ParameterValues": [
            {
                "Name": "comment",
                "Value": "I found that if we don't pause before starting the scan, the procedure sometimes fails to email the admin that the scan has started. The pause is a safeguard against that behavior.",
                "Select": false,
                "PasswordParameter": false
            }
        ],
        "ComparisonValue": {
            "DefaultWidth": 100,
            "Description": "needs description",
            "Value": "I found that if we don't pause before starting the scan, the procedure sometimes fails to email the admin that the scan has started. The pause is a safeguard against that behavior.",
            "Type": 9,
            "Position": 9
        }
    },
    {
        "RefId": "424",
        "Type": 3,
        "Depth": 0,
        "Fold": false,
        "Hide": false,
        "Error": false,
        "ErrorMessage": "",
        "ParameterValues": [
            {
                "ScriptParameter": 0,
                "Value": "60",
                "Select": false,
                "NumberOnly": true,
                "VariableDefinition": false,
                "PasswordParameter": false
            },
            {
                "NumberOnly": false,
                "Value": "0",
                "Select": true,
                "VariableDefinition": false,
                "PasswordParameter": false
            },
            {
                "ScriptParameter": 4,
                "Value": "false",
                "Select": true,
                "NumberOnly": false,
                "VariableDefinition": false,
                "PasswordParameter": false
            }
        ]
    },
    {
        "RefId": "101",
        "Type": 0,
        "Depth": 0,
        "Fold": false,
        "Hide": false,
        "Error": false,
        "ErrorMessage": "",
        "ParameterValues": [
            {
                "Name": "comment",
                "Value": "Here's the scan itself",
                "Select": false,
                "PasswordParameter": false
            }
        ],
        "ComparisonValue": {
            "DefaultWidth": 100,
            "Description": "needs description",
            "Value": "Here's the scan itself",
            "Type": 9,
            "Position": 9
        }
    },
    {
        "RefId": "420",
        "Type": 3,
        "Depth": 0,
        "Fold": false,
        "Hide": false,
        "Error": false,
        "ErrorMessage": "",
        "ParameterValues": [
            {
                "ScriptParameter": 0,
                "Value": "#vagentconfiguration.agenttempdir#\\NetworkDetective\\nddc -File #vagentconfiguration.agenttempdir#\\NetworkDetective\\NetworkDetectiveSettings.ndp -credsuser #aduser# -credspwd #adpswd#",
                "PasswordParameter": false
            },
            {
                "ScriptParameter": 1,
                "Value": "1",
                "Select": true,
                "NumberOnly": false,
                "VariableDefinition": false,
                "PasswordParameter": false
            },
            {
                "NumberOnly": false,
                "Value": "0",
                "Select": true,
                "VariableDefinition": false,
                "PasswordParameter": false
            },
            {
                "ScriptParameter": 4,
                "Value": "false",
                "Select": true,
                "NumberOnly": false,
                "VariableDefinition": false,
                "PasswordParameter": false
            }
        ]
    },
    {
        "RefId": "101",
        "Type": 0,
        "Depth": 0,
        "Fold": false,
        "Hide": false,
        "Error": false,
        "ErrorMessage": "",
        "ParameterValues": [
            {
                "Name": "comment",
                "Value": "If the scan has created the output file we want, we go grab it and copy it to a central retrieval machine, like a file server",
                "Select": false,
                "PasswordParameter": false
            }
        ],
        "ComparisonValue": {
            "DefaultWidth": 100,
            "Description": "needs description",
            "Value": "If the scan has created the output file we want, we go grab it and copy it to a central retrieval machine, like a file server",
            "Type": 9,
            "Position": 9
        }
    },
    {
        "RefId": "101",
        "Type": 0,
        "Depth": 0,
        "Fold": false,
        "Hide": false,
        "Error": false,
        "ErrorMessage": "",
        "ParameterValues": [
            {
                "Name": "comment",
                "Value": "Otherwise, we write a failure to the procedure log",
                "Select": false,
                "PasswordParameter": false
            }
        ],
        "ComparisonValue": {
            "DefaultWidth": 100,
            "Description": "needs description",
            "Value": "Otherwise, we write a failure to the procedure log",
            "Type": 9,
            "Position": 9
        }
    },
    {
        "RefId": "101",
        "Type": 0,
        "Depth": 0,
        "Fold": false,
        "Hide": false,
        "Error": false,
        "ErrorMessage": "",
        "ParameterValues": [
            {
                "Name": "comment",
                "Value": "In either case, the admin who ran the procedure gets an email about scan success or failure",
                "Select": false,
                "PasswordParameter": false
            }
        ],
        "ComparisonValue": {
            "DefaultWidth": 100,
            "Description": "needs description",
            "Value": "In either case, the admin who ran the procedure gets an email about scan success or failure",
            "Type": 9,
            "Position": 9
        }
    },
    {
        "RefId": "203",
        "Type": 1,
        "Depth": 0,
        "Fold": false,
        "Hide": false,
        "Error": false,
        "ErrorMessage": "",
        "ParameterValues": [
            {
                "ScriptParameter": 0,
                "Value": "#vagentconfiguration.agenttempdir#\\NetworkDetective\\scanresults.ndf",
                "PasswordParameter": false
            }
        ],
        "Operator": {
            "Value": "1"
        },
        "ComparisonValue": {
            "Position": 0,
            "Description": "",
            "Type": 0,
            "DefaultWidth": 150,
            "Value": ""
        },
        "ShowFoldButton": true
    },
    {
        "RefId": "519",
        "Type": 3,
        "Depth": 1,
        "Fold": false,
        "Hide": false,
        "Error": false,
        "ErrorMessage": "",
        "ParameterValues": [
            {
                "ScriptParameter": 0,
                "Value": "#server#",
                "PasswordParameter": false
            },
            {
                "ScriptParameter": 1,
                "Value": "#vagentconfiguration.agenttempdir#\\NetworkDetective\\scanresults.ndf",
                "PasswordParameter": false
            },
            {
                "ScriptParameter": 2,
                "Value": "C:\\System\\Network Detective\\NDOutput\\#vAgentConfiguration.Workgroupdomainname#.ndf",
                "PasswordParameter": false
            },
            {
                "NumberOnly": false,
                "Value": "0",
                "Select": true,
                "VariableDefinition": false,
                "PasswordParameter": false
            },
            {
                "ScriptParameter": 4,
                "Value": "false",
                "Select": true,
                "NumberOnly": false,
                "VariableDefinition": false,
                "PasswordParameter": false
            }
        ]
    },
    {
        "RefId": "430",
        "Type": 3,
        "Depth": 1,
        "Fold": false,
        "Hide": false,
        "Error": false,
        "ErrorMessage": "",
        "ParameterValues": [
            {
                "ScriptParameter": 0,
                "Value": "#adminDefaults.adminEmail#",
                "PasswordParameter": false
            },
            {
                "ScriptParameter": 1,
                "Value": "Scan is complete on #vAgentConfiguration.Workgroupdomainname#",
                "PasswordParameter": false
            },
            {
                "ScriptParameter": 2,
                "Value": "Please check for the file in C:\\System\\NDDC\\",
                "PasswordParameter": false
            },
            {
                "NumberOnly": false,
                "Value": "0",
                "Select": true,
                "VariableDefinition": false,
                "PasswordParameter": false
            },
            {
                "ScriptParameter": 4,
                "Value": "false",
                "Select": true,
                "NumberOnly": false,
                "VariableDefinition": false,
                "PasswordParameter": false
            }
        ]
    },
    {
        "RefId": "102",
        "Type": 1,
        "Depth": 0,
        "Fold": false,
        "Hide": false,
        "Error": false,
        "ErrorMessage": "",
        "ParameterValues": []
    },
    {
        "RefId": "425",
        "Type": 3,
        "Depth": 1,
        "Fold": false,
        "Hide": false,
        "Error": false,
        "ErrorMessage": "",
        "ParameterValues": [
            {
                "ScriptParameter": 0,
                "Value": "Scan failed to complete.",
                "PasswordParameter": false
            },
            {
                "NumberOnly": false,
                "Value": "0",
                "Select": true,
                "VariableDefinition": false,
                "PasswordParameter": false
            },
            {
                "ScriptParameter": 4,
                "Value": "false",
                "Select": true,
                "NumberOnly": false,
                "VariableDefinition": false,
                "PasswordParameter": false
            }
        ]
    },
    {
        "RefId": "430",
        "Type": 3,
        "Depth": 1,
        "Fold": false,
        "Hide": false,
        "Error": false,
        "ErrorMessage": "",
        "ParameterValues": [
            {
                "ScriptParameter": 0,
                "Value": "#adminDefaults.adminEmail#",
                "PasswordParameter": false
            },
            {
                "ScriptParameter": 1,
                "Value": "Scan has not completed on #vAgentConfiguration.Workgroupdomainname#",
                "PasswordParameter": false
            },
            {
                "ScriptParameter": 2,
                "Value": "Scan has not completed on #vAgentConfiguration.machname#. Please check scan results manually for errors.",
                "PasswordParameter": false
            },
            {
                "NumberOnly": false,
                "Value": "0",
                "Select": true,
                "VariableDefinition": false,
                "PasswordParameter": false
            },
            {
                "ScriptParameter": 4,
                "Value": "false",
                "Select": true,
                "NumberOnly": false,
                "VariableDefinition": false,
                "PasswordParameter": false
            }
        ]
    }
]
```