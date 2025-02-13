[CmdletBinding()]
Param(
    [Parameter(Mandatory = $true)][ValidatePattern('^[A-z]:\\')][String]$Path,
    [Parameter(Mandatory = $true)][int]$ThresholdDays
)

if ( -not( Test-Path $Path) ) {
    return " Path '$Path' not found."
}
else {
    foreach ($item in (Get-ChildItem -Path $path -Recurse | Where-Object { $_.LastWriteTime -le (Get-Date).AddDays(-$ThresholdDays) })) {
        Try {
            Remove-Item $item.FullName -Force -Recurse -Confirm:$False -Erroraction Stop
        }
        catch {
            $FailedToRemove += $Item.FullName
        }
    }
    if ($failedtoremove -match '[A-z]:') {
        Write-Information 'Failed to remove the following items: '
        return $Failedtoremove
    }
    else {
        return "Files older than $ThresholdDays from '$Path' has been removed."
    }
}