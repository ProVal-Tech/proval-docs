<#
.SYNOPSIS
    Gets Data related to Time Saved via Automation and outputs to a CSV for consultant reporting
.EXAMPLE
    PS C:\> Get-VsaTimeSaved.ps1 -BaseURL https://vsa.provaltech.com -VsaUserName apiServiceAccount -RestApiToken abcd-efgh-ijkl-mnop
    Removes agents offline for 30 days in all groups except proval.development
.PARAMETER BaseURL
    The VSA Server address, i.e https:\\vsa.provaltech.com
.PARAMETER VsaUserName
    API User Account name in the VSA
.PARAMETER RestApiToken
    API Token with REST Scope
.OUTPUTS
    ./Get-VsaTimeSaved-log.txt
.NOTES
    Requires VSAAPI Module to be loaded.
    Org CFs MUST Be initialized with a value during Client Onboarding
#>
[CmdletBinding()]
param (
    [Parameter(Mandatory = $true)][String]$BaseURL,
    [Parameter(Mandatory = $true)][String]$VsaUserName,
    [Parameter(Mandatory = $true)][String]$RestApiToken
)
### Bootstrap ###
if (-not $bootstrapLoaded) {
    [Net.ServicePointManager]::SecurityProtocol = [Enum]::ToObject([Net.SecurityProtocolType], 3072)
    Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://file.provaltech.com/repo/script/Bootstrap.ps1')
    Set-Environment
}
else {
    Write-Log -Text 'Bootstrap already loaded.' -Type INIT
}
### Process ###
####Get VSAAPI Module####
$progressPreference = 'silentlyContinue'
Invoke-WebRequest -Uri 'https://file.provaltech.com/repo/Kaseya/VSAAPI.zip' -OutFile "$PSScriptRoot\VSAAPI.zip"
Expand-Archive -Path "$PSScriptRoot\VSAAPI.zip" -DestinationPath $PSScriptRoot -Force
if (Get-Module VSAAPI) {
    Write-Log -Text 'VSAAPI Module is already loaded in this environment. Removing and reloading.' -Type Log
    Remove-Module vsaapi
}
else {
    Write-Log -Text "vsaapi verified not currently loaded. Loading module now."
}
Import-Module $PSScriptRoot\VSAAPI\VSAAPI.psd1
if (Get-Module VSAAPI) {
    Write-Log -Text 'API Module Loaded Successfully'
}
else {
    Write-Log -Text 'Unable to load API Module. Exiting'
    return
}
$basicParams = @{
    BaseURL      = $BaseURL
    VsaUserName  = $VsaUserName
    RestApiToken = $RestApiToken
}
##########################
class TimeSavedData {
    [string]$OrgName
    [string]$Total
    [string]$Monthly
}
[int]$cumulativeSum = 0
[int]$monthlySum = 0
$agents = Get-VsaAgentList @basicParams
$orgs = Get-VsaOrgList @basicParams
$timestamp = (Get-Date -format MM-yyyy).ToString()
foreach($agent in $agents)
{
    [object]$cflist = Get-VsaAgentCustomFieldList @basicParams -agentID $agent.AgentId
    $cumulativeSum = $cumulativeSum + ($cflist | Where-Object {$_.FieldName -like 'xPVAL Automation Time Saved Cumulative'} | Select-Object -expandProperty FieldValue)
    $monthlySum = $monthlySum + ($cflist | Where-Object {$_.FieldName -like 'xPVAL Automation Time Saved Current Month'} | Select-Object -expandProperty FieldValue)
}
[TimeSavedData]@{
    OrgName = "Entire VSA"
    Total = $((New-TimeSpan -minutes $cumulativeSum).ToString())
    Monthly = $((New-TimeSpan -minutes $monthlySum).ToString())
} | Export-CSV -Path "$env:ProgramData\_automation\AgentProcedure\StackContent\TimeSavedByAutomation_$timestamp.csv" -NoTypeInformation -Append
foreach ($org in $orgs){
    [int]$cumulativeSum = 0
    [int]$monthlySum = 0
    $orgAgents = $agents | Where-Object {$_.OrgId -like $org.OrgId} | Select-Object -ExpandProperty AgentId
    foreach($agent in $orgAgents){
        [object]$cflist = Get-VsaAgentCustomFieldList @basicParams -agentID $agent
        $cumulativeSum = $cumulativeSum + ($cflist | Where-Object {$_.FieldName -like 'xPVAL Automation Time Saved Cumulative'} | Select-Object -expandProperty FieldValue)
        $monthlySum = $monthlySum + ($cflist | Where-Object {$_.FieldName -like 'xPVAL Automation Time Saved Current Month'} | Select-Object -expandProperty FieldValue)
    }
    [TimeSavedData]@{
        OrgName = $org.OrgName
        Total = $((New-TimeSpan -minutes $cumulativeSum).ToString())
        Monthly = $((New-TimeSpan -minutes $monthlySum).ToString())
    } | Export-CSV -Path "$env:ProgramData\_automation\StackContent\TimeSavedByAutomation_$timestamp.csv" -NoTypeInformation -Append
}

