---
id: '71faa943-e504-4e87-b8d1-39471af44780'
slug: /71faa943-e504-4e87-b8d1-39471af44780
title: 'Get-HPiLOHealthReport'
title_meta: 'Get-HPiLOHealthReport'
keywords: ['hp', 'ilo', 'health', 'report']
description: 'Documentation for the Get-HPiLOHealthReport command to get a health report from the target HP iLO address.'
tags: ['networking', 'performance']
draft: false
unlisted: false
---

## Description
Gets a health report from the target HP iLO address.

## Requirements
- PowerShell v5
- Desktop edition of PowerShell
- PowerShellGet 2.0+
- .NET Runtime 4.7.2+
- iLO Version 3+

## Usage
- If .NET 4.7.2 or higher is not installed, install it.
  - Will exit due to failure to install.
  - Will exit due to reboot requirement after installation.
  - Will continue if .NET is installed without a necessary reboot.
- Install and import the HPEiLOCmdlets module.
- Get all of the network interfaces on the host machine.
- Start looping through the network interfaces.
  - Get the IPv4 addresses assigned to the interface.
  - Start looping through the IP addresses.
    - Convert the IP address to binary.
    - Find the number of host bits based on the prefix length.
      - 32-bit address - x bits prefix = (32 - x) host bits
        ```
        192.168.159.0/24
        32 - 24 = 8
        192.168.159.0 = 11000000101010001001111100000000
        Prefix (24 bits) --> 110000001010100010011111
        Host (8 bits) --> 00000000
        ```
    - Get the binary representation of the network ID.
    - Get the binary representation of the host ID.
    - Get the total number of possible hosts using string multiplication and binary to decimal conversion.
    - Create an object to store the minimum and maximum values of each octet.
    - Start a loop starting at 1 and ending at the total number of available hosts.
      - Get the next possible binary host ID in the loop.
      - Get the full IP address of the host ID that we just gathered.
      - Start a loop starting at 0 and ending before 4.
        - Get a substring of the octet from the gathered IP address based on the current loop iteration (x * 8).
        - Get the decimal representation of the octet binary.
        - Replace the min or max of the octet in the min/max store with this octet if it is applicable.
- Format the min/max ranges to comply with what the HPEiLOCmdlets module requires (e.g., `192.168.22.0-192.168.23.255` becomes `192.168.22-23.0-255`).
- If an address was passed into the script, only find the iLO at the target address. Otherwise, use the discovered ranges.
- Return the iLO health objects.
  - Attempt to connect to the iLO.
    - If the connection was successful, set the `ConnectionStatus` property of the object to 'Connected' and populate the object.
    - If the connection was unsuccessful, set the `ConnectionStatus` property of the object to the last error message.

Gets the health status of the iLO at IP address '10.1.1.1'.
```powershell
.\Get-HPiLOHealthReport.ps1 -Address 10.1.1.1 -Username "ilouser" -Password $securePassword
```

Gets the health status of all iLOs reachable from the subnets of the host machine's NICs.
```powershell
.\Get-HPiLOHealthReport.ps1 -Username "ilouser" -Password $securePassword
```

## Parameters
| Parameter  | Required | Default | Type         | Description                                                 |
| ---------- | -------- | ------- | ------------ | ----------------------------------------------------------- |
| `Address`  | False    |         | String       | The address of the iLO device to get the health report for. |
| `Username` | True     |         | String       | The username used to authenticate with the target iLO(s).   |
| `Password` | True     |         | SecureString | The password used to authenticate with the target iLO(s).   |

## Output
```
System.Management.Automation.PSCustomObject

Name                       MemberType   Definition
----                       ----------   ----------
Equals                     Method       bool Equals(System.Object obj)
GetHashCode                Method       int GetHashCode()
GetType                    Method       type GetType()
ToString                   Method       string ToString()
AgentlessManagementService NoteProperty string AgentlessManagementService=Ready
BatteryStatus              NoteProperty string BatteryStatus=OK
BIOSHardwareStatus         NoteProperty string BIOSHardwareStatus=OK
ConnectionStatus           NoteProperty string ConnectionStatus=Connected
FanRedundancy              NoteProperty string FanRedundancy=Redundant
FanStatus                  NoteProperty string FanStatus=OK
Hostname                   NoteProperty string Hostname=
HostSystemInformation      NoteProperty HSI HostSystemInformation=HPE.iLO.Response.HSI
IP                         NoteProperty string IP=10.1.1.1
ManagementProcessor        NoteProperty MP ManagementProcessor=HPE.iLO.Response.MP
MemoryStatus               NoteProperty string MemoryStatus=OK
NetworkStatus              NoteProperty string NetworkStatus=OK
PowerSuppliesMismatch      NoteProperty string PowerSuppliesMismatch=No
PowerSuppliesRedundancy    NoteProperty string PowerSuppliesRedundancy=Redundant
PowerSuppliesStatus        NoteProperty string PowerSuppliesStatus=OK
ProcessorStatus            NoteProperty string ProcessorStatus=OK
Status                     NoteProperty StatusType Status=OK
StatusInfo                 NoteProperty object StatusInfo=null
StorageStatus              NoteProperty string StorageStatus=Warning
TemperatureStatus          NoteProperty string TemperatureStatus=OK

HPE.iLO.Response.HSI

Name         MemberType Definition
----         ---------- ----------
Equals       Method     bool Equals(System.Object obj)
GetHashCode  Method     int GetHashCode()
GetType      Method     type GetType()
ToString     Method     string ToString()
cUUID        Property   string cUUID {get;set;}
NICS         Property   HPE.iLO.Response.HSI_NIC[] NICS {get;set;}
ProductID    Property   string ProductID {get;set;}
SerialNumber Property   string SerialNumber {get;set;}
SP           Property   string SP {get;set;}
SPN          Property   string SPN {get;set;}
UUID         Property   string UUID {get;set;}
Virtual      Property   HPE.iLO.Response.HSI_Virtual Virtual {get;set;}

HPE.iLO.Response.MP

Name        MemberType Definition
----        ---------- ----------
Equals      Method     bool Equals(System.Object obj)
GetHashCode Method     int GetHashCode()
GetType     Method     type GetType()
ToString    Method     string ToString()
BBLK        Property   string BBLK {get;set;}
EALERT      Property   string EALERT {get;set;}
ERS         Property   string ERS {get;set;}
FWRI        Property   double FWRI {get;set;}
HWRI        Property   string HWRI {get;set;}
IPM         Property   string IPM {get;set;}
PN          Property   string PN {get;set;}
PWRM        Property   string PWRM {get;set;}
SN          Property   string SN {get;set;}
SSO         Property   string SSO {get;set;}
ST          Property   string ST {get;set;}
UUID        Property   string UUID {get;set;}
```
### Log Files

```
.\Get-HPiLOHealthReport-log.txt
.\Get-HPiLOHealthReport-error.txt
```