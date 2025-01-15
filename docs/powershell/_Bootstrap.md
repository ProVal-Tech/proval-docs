# Welcome to the Bootstrap! 🥾
The PowerShell Bootstrap script is a set of helper functions that we at ProVal use frequently in other PowerShell scripts. The Bootstrap is commonly called with `Invoke-Expression` at the beginning of a script like so:

```powershell
if (-not $bootstrapLoaded) {
    [Net.ServicePointManager]::SecurityProtocol = [Enum]::ToObject([Net.SecurityProtocolType], 3072)
    Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://file.provaltech.com/repo/script/Bootstrap.ps1')
    Set-Environment
} else {
    Write-Log -Text 'Bootstrap already loaded.' -Type INIT
}
```

A list of the variables and functions to be aware of in the Bootstrap are below. Variables are initialized by the `Set-Enviornment` function.

## Variables

### `logPath`
This variable stores the path to the file where `Write-Log` writes all log entries to. (includes data and error entries)

### `dataPath`
This variable stores the path to the file where `Write-Log` writes all data entries to.

### `errorPath`
This variable stores the path to the file where `Write-Log` writes all error entries to.

### `workingPath`
The path that the calling script is located at. Will default to the directory that the console was in when `Set-Enviornment` was executed if running directly from a shell prompt instead of within a script file.

### `scriptTitle`
The name of the calling script. Will default to `'***Manual Run***'` if `Set-Enviornment` was executed directly from a shell prompt instead of within a script file.

### `powershellTargetVersion` *(Deprecated)*

Used by calling scripts to determine if PowerShell needs to be upgraded. Use `#requires` statements in calling scripts instead of this variable.

### `powershellOutdated` *(Deprecated)*

Used by calling scripts to determine if PowerShell needs to be upgraded. Use `#requires` statements in calling scripts instead of this variable.

### `powershellUpgraded` *(Deprecated)*

Used by calling scripts to determine if PowerShell was upgraded. Use `#requires` statements in calling scripts instead of this variable.

### `provalScriptBasePath` *(Deprecated)*

Used by calling scripts as a quick URL to the ProVal script repo. Deprecated as it does not appear useful.

### `bootstrapLoaded`

Used by calling scripts to determine if the Bootstrap has been loaded. Useful for subscripts that normally also call the Bootstrap to skip their processing.

### `isElevated`

Determines if the current session is running in an elevated shell. Useful for scripts that require elevation.

## Functions

### `Set-Environment`
Function used to initialize variables required for other functions and output initialization log messages.

### `Write-Log`
Writes a message to a log file, the console, or both. See the `comment-help` section of the script for usage information.
#### Examples
```powershell
Write-Log -Text "This is a standard log message."
Write-Log -Text "This is a warning log message." -Type WARN
Write-Log -Text "This is an error log message." -Type ERROR
Write-Log -Text "This is a data message." -Type DATA
Write-Log @('I','can','write','arrays','too')
```

### `Write-LogHelper`
Called by `Write-Log` to minimize code duplication for writing strings vs. arrays.

### `Write-InformationExtended`
Wraps `Write-Information` to allow for the addition of console colors to the output.

### `Install-Chocolatey`
Installs or updates the Chocolatey package manager.

### `Update-PowerShell` *(Deprecated)*
Upgrades PowerShell to the latest version available from the Chocolatey package manager. ProVal targets PowerShell v5 with our scripts and thus this function is no longer necessary.

### `Optimize-Content`
Takes in a file and an optional max size, truncating the beginning of the file until the file is less than or equal to the passed max size. 

### `Set-RegistryKeyProperty`
Sets a Windows registry property value.

### `Get-RegistryHivePath`
Gets a list of registry hives from the local computer.

### `Get-UserRegistryKeyProperty`
Gets a list of existing user registry properties.

### `Set-UserRegistryKeyProperty`
Creates or updates a registry property value for existing user registry hives.

### `Remove-UserRegistryKeyProperty`
Removes a registry property value for existing user registry hives.

### `Copy-RegistryItem`
Copies a registry property or key to the target destination.

#### Examples
*Copy all keys, subkeys, and properties from `HKLM:\SOFTWARE\Canon` to `HKLM:\SOFTWARE\_automation\RegistryBackup`*
```powershell
Copy-RegistryItem -Path HKLM:\SOFTWARE\Canon -Destination HKLM:\SOFTWARE\_automation\RegistryBackup -Force -Recurse
```

*Copy the PDFFormat property from `HKLM:\SOFTWARE\Adobe` to `HKLM:\SOFTWARE\_automation\RegistryBackup\Adobe`*
```powershell
Copy-RegistryItem -Path HKLM:\SOFTWARE\Adobe -Name PDFFormat -Destination HKLM:\SOFTWARE\_automation\RegistryBackup\Adobe -Force
```



