#### 1 - Import alert template

△ Custom - Ticket Creation - Computer

#### 2 - Reload the system cache

#### 3 - Copy the following query and replace 'YOUR COMMA SEPARATED LIST OF GROUPID(S)' with the Groupid(s) of the relevant groups: (The string to replace can be found at the very bottom of the query, right after `WHERE`)

```sql
#Insert EDFs
INSERT IGNORE INTO `extrafield` (`Form`, `Name`, `Sort`, `NoBreak`, `FType`, `Section`, `UnEditable`, `Collapsed`, `Fill`, `LtGuid`, `IsPassword`, `IsEncrypted`, `IsHidden`, `IsRestricted`, `ViewPermissions`, `EditPermissions`) VALUES 
(3, 'BSOD Monitoring', 0, 0, 1, 'Monitoring', 0, 0, 'This custom field includes the agent of the client for the BSOD monitoring', '96e96edb-cce4-4a6f-9bf8-398af9bb6b20', 0, 0, 0, 0, '', ''),
(2, 'BSOD Monitoring Exclude', 0, 0, 1, 'Exclusions', 0, 0, 'This checkbox gives feature to exclude the agents of locations from the BSOD monitoring', 'd3a08af9-dbda-488b-b2c6-d0978d931295', 0, 0, 0, 0, '', ''),
(1, 'BSOD Monitoring Exclude', 0, 0, 1, 'Exclusions', 0, 0, 'This excludes the agent from the BSOD Monitoring', 'a3fd846f-60f6-49f9-926d-0b1baf959358', 0, 0, 0, 0, '', '');

#Refresh EDFs
Call v_extradata(1,'computers');
Call v_extradatarefresh(1,'computers');
Call v_extradata(2,'locations');
Call v_extradatarefresh(2,'locations');
Call v_extradata(3,'clients');
Call v_extradatarefresh(3,'clients');


#Insert Search
INSERT INTO `sensorchecks` 
SELECT 
'' as `SensID`,
'BSOD Monitoring'  as `Name`, 
'SELECT \r\n   computers.computerid as `Computer Id`,\r\n   computers.name as `Computer Name`,\r\n   clients.name as `Client Name`,\r\n   computers.domain as `Computer Domain`,\r\n   computers.username as `Computer User`,\r\n   IFNULL(IFNULL(edfAssigned1.Value,edfDefault1.value),\'0\') as `Computer - Client - Extra Data Field - Custom Automation - BSOD Monitoring`,\r\n   IFNULL(IFNULL(edfAssigned2.Value,edfDefault2.value),\'0\') as `Computer - Location - Extra Data Field - Exclusions - BSOD Monitoring Exclude`,\r\n   IFNULL(IFNULL(edfAssigned3.Value,edfDefault3.value),\'0\') as `Computer - Extra Data Field - Exclusions - BSOD Monitoring Exclude`,\r\n   IF(INSTR(IFNULL(inv_operatingsystem.Name, Computers.OS), \'windows\')>0, 1, IF(INSTR(IFNULL(inv_operatingsystem.Name, Computers.OS), \'darwin\') >0, 2, 3)) as `Computer.OS.Type`\r\nFROM Computers \r\nLEFT JOIN inv_operatingsystem ON (Computers.ComputerId=inv_operatingsystem.ComputerId)\r\nLEFT JOIN Clients ON (Computers.ClientId=Clients.ClientId)\r\nLEFT JOIN Locations ON (Computers.LocationId=Locations.LocationID)\r\nLEFT JOIN ExtraFieldData edfAssigned1 ON (edfAssigned1.id=Clients.ClientId and edfAssigned1.ExtraFieldId =(Select ExtraField.id FROM ExtraField WHERE LTGuid=\'96e96edb-cce4-4a6f-9bf8-398af9bb6b20\'))\r\nLEFT JOIN ExtraFieldData edfDefault1 ON (edfDefault1.id=0 and edfDefault1.ExtraFieldId =(Select ExtraField.id FROM ExtraField WHERE LTGuid=\'96e96edb-cce4-4a6f-9bf8-398af9bb6b20\'))\r\nLEFT JOIN ExtraFieldData edfAssigned2 ON (edfAssigned2.id=Locations.LocationId and edfAssigned2.ExtraFieldId =(Select ExtraField.id FROM ExtraField WHERE LTGuid=\'d3a08af9-dbda-488b-b2c6-d0978d931295\'))\r\nLEFT JOIN ExtraFieldData edfDefault2 ON (edfDefault2.id=0 and edfDefault2.ExtraFieldId =(Select ExtraField.id FROM ExtraField WHERE LTGuid=\'d3a08af9-dbda-488b-b2c6-d0978d931295\'))\r\nLEFT JOIN ExtraFieldData edfAssigned3 ON (edfAssigned3.id=Computers.ComputerId and edfAssigned3.ExtraFieldId =(Select ExtraField.id FROM ExtraField WHERE LTGuid=\'a3fd846f-60f6-49f9-926d-0b1baf959358\'))\r\nLEFT JOIN ExtraFieldData edfDefault3 ON (edfDefault3.id=0 and edfDefault3.ExtraFieldId =(Select ExtraField.id FROM ExtraField WHERE LTGuid=\'a3fd846f-60f6-49f9-926d-0b1baf959358\'))\r\n WHERE \r\n((((IFNULL(IFNULL(edfAssigned1.Value,edfDefault1.value),\'0\')<>0) AND (IFNULL(IFNULL(edfAssigned2.Value,edfDefault2.value),\'0\')=0) AND (IFNULL(IFNULL(edfAssigned3.Value,edfDefault3.value),\'0\')=0) AND (IF(INSTR(IFNULL(inv_operatingsystem.Name, Computers.OS), \'windows\')>0, 1, IF(INSTR(IFNULL(inv_operatingsystem.Name, Computers.OS), \'darwin\') >0, 2, 3)) = \'1\'))))\r\n' as `SQL`,
'4' as `QueryType`,
'Select||=||=||=|^Select|||||||^' as `ListData`,
'0' as `FolderID`,
'7a3ec0ad-d589-4efc-ad4a-ede213f4d477' as `GUID`,
'<LabTechAbstractSearch><asn><st>AndNode</st><cn><asn><st>AndNode</st><cn><asn><st>ComparisonNode</st><lon>Computer.Client.Extra Data Field.Custom Automation.BSOD Monitoring</lon><lok>Computer.Client.Edf.96e96edb-cce4-4a6f-9bf8-398af9bb6b20</lok><lmo>IsTrue</lmo><dv>NULL</dv><dk>NULL</dk></asn><asn><st>ComparisonNode</st><lon>Computer.Location.Extra Data Field.Exclusions.BSOD Monitoring Exclude</lon><lok>Computer.Location.Edf.d3a08af9-dbda-488b-b2c6-d0978d931295</lok><lmo>IsFalse</lmo><dv>NULL</dv><dk>NULL</dk></asn><asn><st>ComparisonNode</st><lon>Computer.Extra Data Field.Exclusions.BSOD Monitoring Exclude</lon><lok>Computer.Edf.a3fd846f-60f6-49f9-926d-0b1baf959358</lok><lmo>IsFalse</lmo><dv>NULL</dv><dk>NULL</dk></asn><asn><st>ComparisonNode</st><lon>Computer.OS.Type</lon><lok>Computer.OS.Type</lok><lmo>Equals</lmo><dv>Windows</dv><dk>1</dk></asn></cn></asn></cn></asn></LabTechAbstractSearch>' as `SearchXML`,
(NULL) as `UpdatedBy`,
(NULL) as `UpdateDate`
FROM  (SELECT MIN(computerid) FROM computers) a
Where (SELECT count(*) From SensorChecks where `GUID` = '7a3ec0ad-d589-4efc-ad4a-ede213f4d477') = 0 ;


#INSERT REMOTE monitor
SET @SearchID = (SELECT sensid FROM sensorchecks WHERE GUID = '7a3ec0ad-d589-4efc-ad4a-ede213f4d477');
SET @Alertaction = (SELECT alertactionid FROM alerttemplate WHERE `GUID` = 'ee4bc754-faf7-4667-8bba-8d3923c22c3e');
INSERT INTO groupagents 
SELECT '' as `AgentID`,
`groupid` as `GroupID`,
@SearchID as `SearchID`,
'ProVal Production - Unhealthy - BSOD Detected' as `Name`,
'6' as `CheckAction`,
@AlertAction as `AlertAction`,
'Unhealthy - BSOD detected on %clientname%\\%computername%~~~Unhealthy - BSOD status %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% result %RESULT%. Refer to the csv file at path  "C:\\ProgramData\\_automation\\script\\BlueScreen\\Export.csv" for more details.!!!Unhealthy - BSOD detected on %clientname%\\%computername%~~~Unhealthy - BSOD status %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% result %RESULT%. Refer to the csv file at path  "C:\\ProgramData\\_automation\\script\\BlueScreen\\Export.csv" for more details.' as `AlertMessage`,
'0' as `ContactID`,
'3600' as `interval`,
'127.0.0.1' as `Where`,
'7' as `What`,
'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe -ExecutionPolicy Bypass -Command "[Net.ServicePointManager]::SecurityProtocol = [Enum]::ToObject([Net.SecurityProtocolType], 3072);$WorkingDirectory = \'C:\\\\ProgramData\\\\_Automation\\\\Script\\\\BlueScreen\';$URL = \'https://www.nirsoft.net/utils/bluescreenview.zip\';$Path = \\"$WorkingDirectory\\\\bluescreenview.zip\\"; if ( !(Test-Path $WorkingDirectory) ) { New-Item -path $WorkingDirectory -ItemType \'Directory\' -Force | Out-Null; if (-not ( ( ( Get-Acl $WorkingDirectory ).Access | Where-Object { $_.IdentityReference -Match \'EveryOne\' } ).FileSystemRights -Match \'FullControl\' ) ) { $ACl = Get-ACL $WorkingDirectory ;  $AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule(\'Everyone\', \'FullControl\', \'ContainerInherit, ObjectInherit\', \'none\', \'Allow\'); $Acl.AddAccessRule($AccessRule); Set-Acl  $WorkingDirectory $Acl}};$response = Invoke-WebRequest -Uri $URL -OutFile $Path -UseBasicParsing;if (!(Test-Path -Path $Path)) {return \'An error occurred and the bluescreenview.zip was unable to be downloaded. Exiting.\'};Expand-Archive \\"$Path\\" -DestinationPath \\"$WorkingDirectory\\" -Force;Start-Process -FilePath \\"$WorkingDirectory\\\\BlueScreenView.exe\\" -ArgumentList \\"/scomma `\\"$WorkingDirectory\\\\Export.csv`\\"\\" -Wait;$BSODs = Get-Content \\"$WorkingDirectory\\\\Export.csv\\" | ConvertFrom-Csv -Delimiter \',\' -Header Dumpfile, Timestamp, Reason, Errorcode, Parameter1, Parameter2, Parameter3, Parameter4, CausedByDriver | ForEach-Object { $_.Timestamp = [datetime]::Parse($_.Timestamp, [System.Globalization.CultureInfo]::CurrentCulture); $_ };$BSODFilter = $BSODs | Where-Object { $_.Timestamp -gt ((Get-Date).AddHours(-24)) };if (!$BSODFilter) {Write-Output \\"Healthy - No BSODs found in the last 24 hours\\"} else {Write-Output \\"Unhealthy - BSOD found. Check Diagnostics\\"}"' as `DataOut`,
'16' as `Comparor`,
'10|(^$%7C^(\\s%7COK%7C\\r\\n)$)%7C(Healthy - No BSODs found)|11|(Unhealthy - BSOD found)%7C(^$%7C^(\\s%7COK%7C\\r\\n)$)|10|Unhealthy - BSOD found' as `DataIn`,
'0' as `IDField`,
'1' as `AlertStyle`,
'0' as `ScriptID`,
'' as `datacollector`,
'16' as `Category`,
'0' as `TicketCategory`,
'1' as `ScriptTarget`,
CONCAT(
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
'-',
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
'-',
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
'-',
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
'-',
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1)
) as `GUID`,
'root' as `UpdatedBy`,
(NOW()) as `UpdateDate`
FROM mastergroups m
WHERE m.groupid IN (YOUR COMMA SEPARATED LIST OF GROUPID(S))
AND m.groupid NOT IN  (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal Production - Unhealthy - BSOD Detected') ;
```

#### 4 - An example of a query with a groupid:

```sql
#INSERT REMOTE monitor

#INSERT REMOTE monitor
SET @SearchID = (SELECT sensid FROM sensorchecks WHERE GUID = '7a3ec0ad-d589-4efc-ad4a-ede213f4d477');
SET @Alertaction = (SELECT alertactionid FROM alerttemplate WHERE `GUID` = 'ee4bc754-faf7-4667-8bba-8d3923c22c3e');
INSERT INTO groupagents 
SELECT '' as `AgentID`,
`groupid` as `GroupID`,
@SearchID as `SearchID`,
'ProVal Production - Unhealthy - BSOD Detected' as `Name`,
'6' as `CheckAction`,
@AlertAction as `AlertAction`,
'Unhealthy - BSOD detected on %clientname%\\%computername%~~~Unhealthy - BSOD status %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% result %RESULT%. Refer to the csv file at path  "C:\\ProgramData\\_automation\\script\\BlueScreen\\Export.csv" for more details.!!!Unhealthy - BSOD detected on %clientname%\\%computername%~~~Unhealthy - BSOD status %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% result %RESULT%. Refer to the csv file at path  "C:\\ProgramData\\_automation\\script\\BlueScreen\\Export.csv" for more details.' as `AlertMessage`,
'0' as `ContactID`,
'3600' as `interval`,
'127.0.0.1' as `Where`,
'7' as `What`,
'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe -ExecutionPolicy Bypass -Command "[Net.ServicePointManager]::SecurityProtocol = [Enum]::ToObject([Net.SecurityProtocolType], 3072);$WorkingDirectory = \'C:\\\\ProgramData\\\\_Automation\\\\Script\\\\BlueScreen\';$URL = \'https://www.nirsoft.net/utils/bluescreenview.zip\';$Path = \\"$WorkingDirectory\\\\bluescreenview.zip\\"; if ( !(Test-Path $WorkingDirectory) ) { New-Item -path $WorkingDirectory -ItemType \'Directory\' -Force | Out-Null; if (-not ( ( ( Get-Acl $WorkingDirectory ).Access | Where-Object { $_.IdentityReference -Match \'EveryOne\' } ).FileSystemRights -Match \'FullControl\' ) ) { $ACl = Get-ACL $WorkingDirectory ;  $AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule(\'Everyone\', \'FullControl\', \'ContainerInherit, ObjectInherit\', \'none\', \'Allow\'); $Acl.AddAccessRule($AccessRule); Set-Acl  $WorkingDirectory $Acl}};$response = Invoke-WebRequest -Uri $URL -OutFile $Path -UseBasicParsing;if (!(Test-Path -Path $Path)) {return \'An error occurred and the bluescreenview.zip was unable to be downloaded. Exiting.\'};Expand-Archive \\"$Path\\" -DestinationPath \\"$WorkingDirectory\\" -Force;Start-Process -FilePath \\"$WorkingDirectory\\\\BlueScreenView.exe\\" -ArgumentList \\"/scomma `\\"$WorkingDirectory\\\\Export.csv`\\"\\" -Wait;$BSODs = Get-Content \\"$WorkingDirectory\\\\Export.csv\\" | ConvertFrom-Csv -Delimiter \',\' -Header Dumpfile, Timestamp, Reason, Errorcode, Parameter1, Parameter2, Parameter3, Parameter4, CausedByDriver | ForEach-Object { $_.Timestamp = [datetime]::Parse($_.Timestamp, [System.Globalization.CultureInfo]::CurrentCulture); $_ };$BSODFilter = $BSODs | Where-Object { $_.Timestamp -gt ((Get-Date).AddHours(-24)) };if (!$BSODFilter) {Write-Output \\"Healthy - No BSODs found in the last 24 hours\\"} else {Write-Output \\"Unhealthy - BSOD found. Check Diagnostics\\"}"' as `DataOut`,
'16' as `Comparor`,
'10|(^$%7C^(\\s%7COK%7C\\r\\n)$)%7C(Healthy - No BSODs found)|11|(Unhealthy - BSOD found)%7C(^$%7C^(\\s%7COK%7C\\r\\n)$)|10|Unhealthy - BSOD found' as `DataIn`,
'0' as `IDField`,
'1' as `AlertStyle`,
'0' as `ScriptID`,
'' as `datacollector`,
'16' as `Category`,
'0' as `TicketCategory`,
'1' as `ScriptTarget`,
CONCAT(
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
'-',
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
'-',
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
'-',
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
'-',
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1),
SUBSTRING('abcdef0123456789', FLOOR(RAND()*16+1), 1)
) as `GUID`,
'root' as `UpdatedBy`,
(NOW()) as `UpdateDate`
FROM mastergroups m
WHERE m.groupid IN (2)
AND m.groupid NOT IN  (SELECT DISTINCT groupid FROM groupagents WHERE `Name` = 'ProVal Production - Unhealthy - BSOD Detected') ;
```

#### 5 - Now execute your query from an RAWSQL monitor set.

#### 6 - Locate your remote monitor by opening the group(s) remote monitors tab. 

![alt text](../../../static/img/docs/import-bsod-monitoring/image.png)

Make sure the Alert Template and Limit to search is applied correctly.
