# Overview
Installs the SIG anyconnect client and selected modules.

# Requirements
For All or Umbrella installations, the OrgID, ClientID, and Fingerprint are required to generate the Umbrella JSON.

# Process
The script will accept parameters for module selection and install the MSI, gathering and checking the exit code on completion. For Umbrella, the provided information is used to generate a JSON file in the appropriate directory.

# Payload Usage
```powershell
.\Install-AnyConnect.ps1 -ClientName 'ProVal' -OrgName 'Development' -Dart -Nvm -Posture
.\Install-AnyConnect.ps1 -ClientName 'ProVal' -OrgName 'Development' -Umbrella -Dart -Nvm -ClientID 1234567 -Fingerprint oash098ashuiue -OrgId 394058
.\Install-AnyConnect.ps1 -ClientName 'ProVal' -OrgName 'Development' -All -ClientId 1234567 -Fingerprint oash098ashuiue -OrgId 394058
.\Install-AnyConnect.ps1 -ClientName 'ProVal' -OrgName 'Development' -Core
```

# Parameters
| Parameter         | Required  | Default   | Type      | Parameter Set Members    | Description                                                    |
| ----------------- | --------- | --------- | --------- |--------------------------|----------------------------------------------------------------|
| All               | False     |           | Switch    | All                      |  Installs All modules. Requires Dynamic Params                 |
| Core              | False     |           | Switch    | Core                     |  Installs only Cisco AnyConnect                                |
| ClientID          | (True)    |           | String    | Dynamic: All, Umbrella   |  Cisco Client ID: Required for Umbrella and All Switches.      |  
| FingerPrint       | (True)    |           | String    | Dynamic: All, Umbrella   |  Cisco Fingerprint: Required for Umbrella and All switches.    |
| orgID             | (True)    |           | String    | Dynamic: All, Umbrella   |  Cisco Org ID: Required for Umbrella and All Switches.         |
| AMP               | False     |           | Switch    | Custom                   |  Installs the indicated module.                                |
| DART              | False     |           | Switch    | Custom                   |  Installs the indicated module.                                |
| NVM               | False     |           | String    | Custom                   |  Installs the indicated module.                                |  
| NAM               | False     |           | String    | Custom                   |  Installs the indicated module.                                |
| Posture           | False     |           | String    | Custom                   |  Installs the indicated module.                                |
| ISEPosture        | False     |           | String    | Custom                   |  Installs the indicated module.                                |
| GINA              | False     |           | String    | Custom                   |  Installs the indicated module.                                |
| Umbrella          | False     |           | String    | Custom                   |  Installs the indicated module. Requires Dynamic Params        |

# Output
Location of output for log, result, and error files.

    .\Install-AnyConnect-log.txt
    .\Install-AnyConnect-data.txt
    .\Install-AnyConnect-error.txt
