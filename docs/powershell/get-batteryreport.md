---
id: '992bde06-574b-4b3a-a442-6962736a18d2'
slug: /992bde06-574b-4b3a-a442-6962736a18d2
title: 'Get-BatteryReport'
title_meta: 'Get-BatteryReport'
keywords: ['battery', 'report', 'powercfg', 'system']
description: 'Documentation for the Get-BatteryReport command to generate and return a detailed battery report using powercfg /batteryreport.'
tags: ['performance', 'report', 'windows']
draft: false
unlisted: false
---

## Description
Returns a system object containing all information that can be gathered by running `powercfg /batteryreport`.

## Usage
1. Set up the Report object classes.
2. Attempt to get the report; if an error occurs, return nothing.
3. Attempt to get the content of the exported XML report; if that fails, return nothing.
4. Loop through all the data returned in the XML, formatting the system object and removing unnecessary XML tags, returning just the passed information.
5. Combine into one object of objects.
6. Return that object.

```powershell
.\Get-BatteryReport.ps1
```
Returns a system object containing all data from the generated battery report.

## Output
```plaintext
[System.Object]
    XMLNS
    ReportInformation
        LocalReportStartTime
        LocalScanTime
        ReportDuration
        reportGuid
        reportStartTime
        ReportVersion
        ScanTime
        Utcoffset
    SystemInformation
        BiosDate
        BiosVersion
        ComputerName
        ConnectedStandby
        osBuild
        PlatformRole
        SystemManufacturer
        SystemProductName
    Batteries
        Chemistry
        CycleCount
        DesignCapacity
        FullChargeCapacity
        Id
        LongTerm
        ManufactureDate
        Manufacturer
        RelativeCapacity
        SerialNumber
    DesignCapacity
        ActiveRuntime
        Capacity
        ConnectedStandbyRuntime
    FullChargeCapacity
        ActiveRuntime
        Capacity
        ConnectedStandbyRuntime
    RecentUsage
        Ac
        ChargeCapacity
        Discharge
        Duration
        EntryType
        FullChargeCapacity
        IsNextOnBattery
        LocalTimestamp
        Timestamp
    History
        ActiveAcTime
        ActiveDcEnergy
        ActiveDcTime
        BatteryChanged
        CsAcTime
        CsDcEnergy
        CsDcTime
        CycleCount
        DesignCapacity
        EndDate
        EstimatedDesignActiveTime
        EstimatedDesignCsTime
        EstimatedFullChargeActiveTime
        EstimatedFullChargeCsTime
        FullChargeCapacity
        LocalEndDate
        LocalStartDate
        StartDate
    EnergyDrains
        EndChargeCapacity
        EndFullChargeCapacity
        EndTimestamp
        LocalEndTimestamp
        LocalStartTimestamp
        StartChargeCapacity
        StartFullChargeCapacity
        StartTimestamp
```