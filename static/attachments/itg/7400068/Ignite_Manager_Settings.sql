USE `labtech`;

/*Table structure for table `plugin_coreservices_appliedmonitors` */

DROP TABLE IF EXISTS `plugin_coreservices_appliedmonitors`;

CREATE TABLE `plugin_coreservices_appliedmonitors` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(200) NOT NULL,
  `CheckAction` int(11) NOT NULL,
  `AlertAction` int(11) NOT NULL,
  `AlertMessage` text NOT NULL,
  `ContactID` int(11) NOT NULL,
  `Interval` int(11) NOT NULL,
  `Where` varchar(255) NOT NULL,
  `What` varchar(255) NOT NULL,
  `DataOut` text NOT NULL,
  `Comparor` int(11) NOT NULL,
  `DataIn` varchar(200) NOT NULL,
  `IDField` varchar(500) NOT NULL,
  `AlertStyle` int(11) NOT NULL DEFAULT '0',
  `Changed` int(11) NOT NULL,
  `DataCollector` varchar(100) NOT NULL,
  `Category` int(11) NOT NULL,
  `TicketCategory` int(11) NOT NULL,
  `ScriptTarget` int(11) DEFAULT '1',
  `GUID` char(36) NOT NULL,
  `ServerType` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ContactID` (`ContactID`),
  KEY `Name` (`Name`),
  KEY `ServerType` (`ServerType`)
) ENGINE=InnoDB AUTO_INCREMENT=876 DEFAULT CHARSET=utf8;

/*Data for the table `plugin_coreservices_appliedmonitors` */

insert  into `plugin_coreservices_appliedmonitors`(`ID`,`Name`,`CheckAction`,`AlertAction`,`AlertMessage`,`ContactID`,`Interval`,`Where`,`What`,`DataOut`,`Comparor`,`DataIn`,`IDField`,`AlertStyle`,`Changed`,`DataCollector`,`Category`,`TicketCategory`,`ScriptTarget`,`GUID`,`ServerType`) values 
(207,'SVC-Citrix Encryption Service',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','Citrix Encryption Service',1,'1','',1,0,'',5,134,0,'c73e9580-00a6-499b-989e-12a0bf3f817e',9),
(208,'SVC-Citrix Licensing',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','Citrix Licensing',1,'1','',1,0,'',5,134,0,'d1c278c3-5805-42f0-889a-d1710b13c350',9),
(209,'SVC-CitrixCseEngine',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','CitrixCseEngine',1,'1','',1,0,'',5,134,0,'4f15fe72-4417-4f74-9cd2-d0e3fe25d861',9),
(210,'SVC-CitrixHealthMon',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','CitrixHealthMon',1,'1','',1,0,'',5,134,0,'f3f480a1-4c51-44c6-83d1-a57d14255b07',9),
(211,'SVC-Citrix_GTLicensingProv',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','Citrix_GTLicensingProv',1,'1','',1,0,'',5,134,0,'49f6d003-ab75-476e-a2a5-78079a57b10f',9),
(328,'SVC-DNS',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','DNS',1,'1','',1,0,'',5,138,0,'e799023a-dea8-4102-9f7e-2d7becadca24',1),
(329,'SVC-nvspwmi',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','nvspwmi',1,'1','',1,0,'',5,134,0,'3d5c808a-f4e3-11e4-8452-080027715141',4),
(330,'SVC-vhdsvc',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','vhdsvc',1,'1','',1,0,'',5,137,0,'3d5c8220-f4e3-11e4-8452-080027715141',4),
(331,'SVC-vmms',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','vmms',1,'1','',1,0,'',5,134,0,'3d5c82e0-f4e3-11e4-8452-080027715141',4),
(367,'SVC-DHCPServer',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','DHCPServer',1,'1','',1,0,'',5,138,0,'68dec598-26c6-453a-91f6-93e6ccfcacbc',2),
(385,'SVC-TSGateway',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','TSGateway',1,'1','',1,0,'',5,137,0,'56700e77-7c3b-4640-94bc-607dc057976b',9),
(398,'SVC-NTDS',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','NTDS',1,'1','',1,0,'',5,137,0,'d090ee9d-026b-40dd-8b4b-35ba999d551d',0),
(424,'SVC-named',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','named',1,'1','',1,0,'',5,134,0,'d9b0fd86-6a74-4b8d-8ca8-c22ed3a1c9bc',1),
(428,'SVC-W32Time',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','W32Time',1,'1','',1,0,'',5,138,0,'5ff3fbfc-6eb1-46f7-baef-b0e1a16a1d23',0),
(429,'SVC-LanmanServer',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','LanmanServer',1,'1','',1,0,'',5,137,0,'bf047896-5656-49dc-99d0-c8aa49fa19e5',0),
(430,'SVC-RpcSs',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','RpcSs',1,'1','',1,0,'',5,137,0,'6b611107-de84-462b-9b78-3057fe7e5b44',0),
(431,'SVC-kdc',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','kdc',1,'1','',1,0,'',5,137,0,'66715537-9d74-4a55-ba20-e9c28d10aed6',0),
(434,'SVC-Spooler',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','Spooler',1,'1','',1,0,'',5,134,0,'6d42cf44-089e-4379-8f6e-3f630a4ab788',5),
(562,'Perf - DRA Inbound Bytes Total/Sec',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\\This counter shows the number of bytes received through inbound Active Directory related replication. If this number is consistently equal to zero, it means that replication is not occurring. Low numbers may indicate that there is a network bottleneck or that the server\'s NIC is too busy with other traffic to receive the requests in a timely manner.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\\This counter shows the number of bytes received through inbound Active Directory related replication. If this number is consistently equal to zero, it means that replication is not occurring. Low numbers may indicate that there is a network bottleneck or that the server\'s NIC is too busy with other traffic to receive the requests in a timely manner.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','NTDS!!!DRA Inbound Bytes Total/sec!!!',6,'','',1,0,'Collect,Collect',7,123,0,'97cdf806-29b6-43a1-a710-80bd38d7730d',0),
(563,'Perf - DRA Inbound Object Updates Remaining in Pac',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\\This counter displays the number of Active Directory objects that have been received through replication, but that have not yet been applied. This number may start high, but should diminish very quickly. If this value takes a while to diminish, it is a clue that the server\'s hardware might not be fast enough to keep up with the demand.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\\This counter displays the number of Active Directory objects that have been received through replication, but that have not yet been applied. This number may start high, but should diminish very quickly. If this value takes a while to diminish, it is a clue that the server\'s hardware might not be fast enough to keep up with the demand.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','NTDS!!!DRA Inbound Object Updates Remaining in Packet!!!',6,'','',1,0,'Collect,Collect',7,123,0,'7dd59817-24cf-4a28-a4ac-4e38282cf797',0),
(564,'Perf - DRA Outbound Bytes Total/Sec',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\\This counter displays the total number of bytes (compressed and uncompressed) that are being transmitted each second as a result of the replication process. A lack of activity often indicates insufficient hardware.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\\This counter displays the total number of bytes (compressed and uncompressed) that are being transmitted each second as a result of the replication process. A lack of activity often indicates insufficient hardware.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','NTDS!!!DRA Outbound Bytes Total/sec!!!',6,'','',1,0,'Collect,Collect',7,123,0,'4267839c-a975-4ee8-bf44-0d8161d2866f',0),
(565,'Perf - DRA Pending Replication Synchronization',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\\This number indicates the number of objects which must be synchronized. Like the DRA Inbound Object Updated Remaining in Packet counter, this value may start high, but should quickly dissipate. If this counter\'s value remains high, it usually means that the hardware is having trouble keeping pace with the demands being made of it.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\\This number indicates the number of objects which must be synchronized. Like the DRA Inbound Object Updated Remaining in Packet counter, this value may start high, but should quickly dissipate. If this counter\'s value remains high, it usually means that the hardware is having trouble keeping pace with the demands being made of it.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','NTDS!!!DRA Pending Replication Synchronizations!!!',6,'','',1,0,'Collect,Collect',7,123,0,'4f61afbd-ac82-4c4a-839e-68cfa4bafa5f',0),
(566,'Perf - DS Threads in Use',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\\This counter indicates the number of threads that are currently servicing client API calls. You can use this value to determine whether or not the domain controller could benefit from additional processors.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\\This counter indicates the number of threads that are currently servicing client API calls. You can use this value to determine whether or not the domain controller could benefit from additional processors.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','NTDS!!!DS Threads in Use!!!',6,'','',1,0,'Collect,Collect',7,123,0,'bd38aa76-848d-45f7-81c0-07cf255cce5c',0),
(567,'Perf - LDAP Bind Time',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\\This counter indicates the number of milliseconds that the last successful LDAP bind took to complete. This value should remain consistently low. Longer bind times can be an indication of network problems or of hardware that needs to be upgraded.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\\This counter indicates the number of milliseconds that the last successful LDAP bind took to complete. This value should remain consistently low. Longer bind times can be an indication of network problems or of hardware that needs to be upgraded.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','NTDS!!!LDAP Bind Time!!!',6,'','',1,0,'Collect,Collect',7,123,0,'4ce14067-4114-485d-a250-9ca78841a9bb',0),
(568,'Perf - LDAP Client Sessions',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\\This number indicates the number of LDAP sessions that are connected to the domain controller at the moment. The appropriate value depends on your network, but if this value remains at zero, it means that you probably have some network problems that are preventing client sessions from connecting with the server.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\\This number indicates the number of LDAP sessions that are connected to the domain controller at the moment. The appropriate value depends on your network, but if this value remains at zero, it means that you probably have some network problems that are preventing client sessions from connecting with the server.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','NTDS!!!LDAP Client Sessions!!!',6,'','',1,0,'Collect,Collect',7,123,0,'c7eb3919-0309-4b2f-b4d6-5c8ebe9fe844',0),
(569,'Perf - LDAP Searches/Sec',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\\The LDAP Searches / Sec counter indicates the number of LDAP queries made by clients each second. I recommend viewing this counter along with the LDAP Successful Binds / Sec counter, which shows the number of successful LDAP binds each second. The biggest thing that you are looking for in these two counters is activity. A lack of activity would almost always indicate that network problems are disrupting the client\'s ability to interact with the domain controller.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\\The LDAP Searches / Sec counter indicates the number of LDAP queries made by clients each second. I recommend viewing this counter along with the LDAP Successful Binds / Sec counter, which shows the number of successful LDAP binds each second. The biggest thing that you are looking for in these two counters is activity. A lack of activity would almost always indicate that network problems are disrupting the client\'s ability to interact with the domain controller.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','NTDS!!!LDAP Searches/sec!!!',6,'','',1,0,'Collect,Collect',7,123,0,'6383e32b-76cd-46d7-aa2c-8bc60ca9374d',0),
(577,'Perf - AD DB Cache % Hit',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\\This counter shows the percentage of CoreServices page requests handled by the cache, thereby not causing a file I/O. A lack of activity can indicate that the server has insufficient physical memory.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','CoreServices!!!CoreServices Cache % Hit!!!',6,'','',1,0,'Collect,Collect',7,124,0,'6161b633-8ead-411d-a9f9-45eec2795bae',0),
(578,'Perf - Cache Page Fault Stalls/Sec',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\\This counter shows the number of page faults per second that go unserviced due to lack of available pages in the CoreServices cache. A value other than zero indicates insufficient physical memory in the server.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','CoreServices!!!CoreServices Page Fault Stalls/sec!!!',6,'','',1,0,'Collect,Collect',7,123,0,'f3df8ad1-fb66-4d7b-b9c3-12412daf094c',0),
(579,'Perf - Cache Page Faults/Sec',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\\This counter shows the number of page requests per second that cause the CoreServices cache to allocate new pages from the cache. This value should be low, with a higher value indicating insufficient physical memory in the server.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','CoreServices!!!CoreServices Page Faults/sec!!!',6,'','',1,0,'Collect,Collect',7,123,0,'e1258bf5-3d0d-42ad-bbdb-e8289f2c91f1',0),
(580,'Perf - Log Record Stalls/Sec',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\\This counter shows the number of log records per second that could not be added to the log buffers because the buffers were full. The value should be zero or close to zero, with a higher value indicating inadequate physical memory in the server.\\|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','CoreServices!!!Log Record Stalls/sec!!!',6,'','',1,0,'Collect,Collect',7,123,0,'bbb348cb-2d57-455a-971a-8743e8174d05',0),
(581,'Perf - Log Threads Waiting',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\\This counter indicates the number of threads waiting on pending log writes. The value should be low, with a higher value indicating insufficient physical memory, poor disk performance, or poor disk structuring.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','CoreServices!!!Log Threads Waiting!!!',6,'','',1,0,'Collect,Collect',7,123,0,'9653fec2-3841-4793-86a1-d6847c00b370',0),
(582,'Perf - Table Open Cache Hits/Sec',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\\This counter shows the number of directory CoreServices tables open per second from the cache. A high value indicates better caching, with a lower value typically indicating inadequate physical memory in the server. |tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','CoreServices!!!Table Open Cache Hits/sec!!!',6,'','',1,0,'Collect,Collect',7,123,0,'fa0f360f-a8ea-4048-b301-ee57a191c840',0),
(584,'EXE - KCC Consistency Check',6,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,43200,'127.0.0.1','7','kcctest.bat',5,'successful','',1,0,'',16,143,0,'4eb00219-9eab-470b-babc-ee7fa30aeaee',0),
(585,'Perf - DHCP Acks/Sec',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\\The number of DHCP acknowledgment messages (DHCPACKs) sent per second by the DHCP server to clients. A sudden or unusual increase in this number indicates that a large number of clients are being renewed by the DHCP server. This might indicate that scope lease durations are too short.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','DHCP Server!!!Acks/sec!!!',6,'','',1,0,'Collect,Collect',7,123,0,'f2563d39-3875-44ce-a0b9-5bb190aec4a5',2),
(586,'Perf - DHCP Active Queue Length',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.The current length of the internal message queue of the DHCP server. This number equals the number of unprocessed messages received by the server. A large number might indicate heavy server traffic.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','DHCP Server!!!Active Queue Length!!!',6,'','',1,0,'Collect,Collect',7,123,0,'1313d8ee-a01c-4add-9ded-25207f5b1184',2),
(587,'Perf - DHCP Conflict Check Queue Length',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\\The current length of the conflict check queue for the DHCP server. This queue holds messages without responses while the DHCP server performs address conflict detection. A large value here might indicate that Conflict Detection Attempts has been set too high or that there is unusually heavy lease traffic at the server.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','DHCP Server!!!Conflict Check Queue Length!!!',6,'','',1,0,'Collect,Collect',7,123,0,'aec6526b-fffc-45c4-b962-c219588a6474',2),
(588,'Perf - DHCP Declines Sec',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\\The number of DHCP decline messages (DHCPDECLINEs) received per second by the DHCP server from clients. A high value indicates that several clients have found their address to be in conflict, possibly indicating network trouble. In this situation, it can help to enable conflict detection on the DHCP server. This should only be used temporarily. Once the situation returns to normal, it should be turned off.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','DHCP Server!!!Declines/sec!!!',6,'','',1,0,'Collect,Collect',7,123,0,'f79008e5-bf19-423a-817e-42ee79234bf9',2),
(589,'Perf - DHCP Discovers Sec',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\\The number of DHCP discover messages (DHCPDISCOVERs) received per second by the server. These messages are sent by clients when they start on the network and obtain a new address lease. A sudden or unusual increase indicates a large number of clients are attempting to initialize and obtain an IP address lease from the server, such as when a number of client computers are started at any given time.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','DHCP Server!!!Discovers/sec!!!',6,'','',1,0,'Collect,Collect',7,123,0,'f00eb5d9-7fee-46f1-bcd7-a4383ee44049',2),
(590,'Perf - DHCP Informs Sec',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\\The number of DHCP information messages (DHCPINFORMs) received per second by the DHCP server. DHCP inform messages are used when the DHCP server queries for the directory service for the enterprise root and when dynamic updates are being done on behalf of clients by the server.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','DHCP Server!!!Informs/sec!!!',6,'','',1,0,'Collect,Collect',7,123,0,'c9452b6b-2dd7-496f-a711-9a4c4888592b',2),
(591,'Perf - DHCP Nacks Sec',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\\The number of DHCP negative acknowledgment messages (DHCPNAKs) sent per second by the DHCP server to clients. A very high value might indicate potential network trouble in the form of misconfiguration of either the server or clients. When servers are misconfigured, one possible cause is a deactivated scope. For clients, a very high value could be caused by computers moving between subnets, such as laptop portables or other mobile devices.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','DHCP Server!!!Nacks/sec!!!',6,'','',1,0,'Collect,Collect',7,123,0,'43c6b41e-707b-4fde-b8b7-48ebf1baf649',2),
(592,'Perf - DHCP Requests Sec',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\\The number of DHCP request messages (DHCPREQUESTs) received per second by the DHCP server from clients. A sudden or unusual increase in this number indicates a large number of clients trying to renew their leases with the DHCP server. This might indicate that scope lease durations are too short.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','DHCP Server!!!Requests/sec!!!',6,'','',1,0,'Collect,Collect',7,123,0,'f0db76d3-99e8-45e1-859c-f6ba38ae9cb3',2),
(593,'Perf - DNS Caching Memory',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\\The total amount of system memory in use by the DNS Server service for caching.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','DNS!!!Caching Memory!!!',6,'','',1,0,'Collect,Collect',7,123,0,'4f0ddfa6-83ac-48c2-9af5-b89eb58f85e3',1),
(594,'Perf - DNS Database Node Memory',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\\The total amount of system memory in use by the DNS Server service for CoreServices nodes.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','DNS!!!CoreServices Node Memory!!!',6,'','',1,0,'Collect,Collect',7,123,0,'f351aa9e-53eb-4aa8-b986-cb8655ccc2f8',1),
(595,'Perf - DNS Dynamic Updates Timeouts',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\\The total number of dynamic update time-outs of the DNS server.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','DNS!!!Dynamic Update TimeOuts!!!',6,'','',1,0,'Collect,Collect',7,123,0,'1d1f9463-6f2c-4618-8029-f6a465ce11f9',1),
(596,'Perf - DNS Nbtstat Memory',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\\The total amount of system memory in use by the DNS Server service for Nbtstat.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','DNS!!!Nbtstat Memory!!!',6,'','',1,0,'Collect,Collect',7,123,0,'238740d9-d72b-4fa9-a428-fd6ae8abef21',1),
(597,'Perf - DNS Zone Transfer Failure',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\\The total number of failed zone transfers of the master DNS server.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','DNS!!!Zone Transfer Failure!!!',4,'5','',1,0,'Collect,Collect',7,123,0,'2274adf8-4a3f-490d-a6b9-517b9b760d34',1),
(598,'Perf - Hyper V Logical Processors',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%. This monitors the number of logical processors present in the system.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','Hyper-V Hypervisor!!!Logical Processors!!!',6,'','',1,0,'Collect,Collect',7,123,0,'3d5c851c-f4e3-11e4-8452-080027715141',4),
(599,'Perf - Hyper V Machine Health Critical',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%. This monitors the Machine Health performance counter for any Critical health alerts.',0,60,'127.0.0.1','0','Hyper-V Virtual Machine Health Summary!!!Health Critical!!!',4,'1','',1,0,'Collect,Collect',7,123,0,'3d5c8621-f4e3-11e4-8452-080027715141',4),
(600,'Perf - Hyper V Partitions',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%. This monitors the number of partitions (virtual machines) present in the system.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','Hyper-V Hypervisor!!!Partitions!!!',6,'','',1,0,'Collect,Collect',7,123,0,'3d5c867c-f4e3-11e4-8452-080027715141',4),
(601,'Perf - Hyper V Total Pages',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%. This monitors the number of bootstrap and deposited pages in the hypervisor.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','Hyper-V Hypervisor!!!Total Pages!!!',6,'','',1,0,'Collect,Collect',7,123,0,'3d5c8703-f4e3-11e4-8452-080027715141',4),
(602,'Perf - Print Job Errors',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.Total number of job errors in a print queue since last restart.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','Print Queue!!!Job Errors!!!',6,'','',1,0,'Collect,Collect',7,123,0,'cb6bd925-50d3-4a6b-a915-59e7aa265633',5),
(603,'Perf - Jobs',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\\Current number of jobs in a print queue. Valid values are positive integers in the range 0 to 2147483647 and can include the use of the *AVG, *MIN, *MAX, or *SUM functions.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','Print Queue!!!Jobs!!!',6,'','',1,0,'Collect,Collect',7,123,0,'1a8775ad-3e29-4ed3-aace-ce98f1aa7978',5),
(604,'Perf - Not Ready Errors',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\\Total number of printer not ready errors in a print queue since the last restart.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','Print Queue!!!Not Ready Errors!!!',4,'10','',1,0,'Collect,Collect',7,123,0,'e29dfbb5-ea7f-43f1-a31d-77eae5bc43a6',5),
(605,'Perf - Total Jobs Printed',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\\Total number of jobs printed on a print queue since the last restart.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','Print Queue!!!Total Jobs Printed!!!',6,'','',1,0,'Collect,Collect',7,123,0,'f0036b47-6f20-48d2-a833-168754f2e160',5),
(606,'Perf - Total Pages Printed',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\\Total number of pages printed through GDI on a print queue since the last restart.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','Print Queue!!!Total Pages Printed!!!',6,'','',1,0,'Collect,Collect',7,123,0,'cb503551-63cf-4f39-8f34-152f7aeb3b05',5),
(607,'Perf -  Files Opened Total',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','Server!!!Files Opened Total!!!',6,'','',1,0,'Collect,Collect',7,124,0,'543702a0-bf8c-41df-8426-40837bae722b',3),
(608,'Perf -  Files Open',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','Server!!!Files Open!!!',6,'','',1,0,'Collect,Collect',7,124,0,'62be6819-9a6c-4f12-a1f7-578896825df8',3),
(609,'Perf -  File Directory Searches',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','Server!!!File Directory Searches!!!',6,'','',1,0,'Collect,Collect',7,124,0,'99b19592-0c88-4adf-9d2f-ad71214c4a67',3),
(610,'Perf - Active Sessions',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.Total active sessions connected to this terminal server.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','Terminal Services!!!Active Sessions!!!',6,'','',1,0,'Collect,Collect',7,124,0,'0728fea4-21c4-45f1-b053-5d3e218e2474',9),
(611,'Perf - Total Sessions',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.Terminal Server Total Session number. This includes both active and inactive sessions and is used for capacity planning.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','Terminal Services!!!Total Sessions!!!',6,'','',1,0,'Collect,Collect',7,123,0,'4d12ac95-3b31-40dd-9c1f-515b1f20ce69',9),
(612,'Perf - Inactive Sessions',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.Total number of sessions that have gone inactive on this terminal server.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','Terminal Services!!!Inactive Sessions!!!',6,'','',1,0,'Collect,Collect',7,123,0,'3a04b8f2-d15b-447a-b30b-ae6687a9e8e4',9),
(617,'Perf - Data Store Connection Failure',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.The number of minutes that the XenApp server has been disconnected from the data store.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','Citrix MetaFrame Presentation Server!!!Data Store Connection Failure!!',6,'','',1,0,'Collect,Collect',7,121,0,'f215f6cb-3d72-42c2-ac93-cf30b4edee5e',9),
(618,'Perf - Application Resolution Time (ms)',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.The time in milliseconds that a resolution took to complete.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','Citrix MetaFrame Presentation Server!!!Application Resolution Time (ms)!!',6,'','',1,0,'Collect,Collect',7,121,0,'49f164b6-4e3b-414c-ac26-4468b943d8df',9),
(651,'EXE - Domain Controller Diagnostic',6,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,86400,'127.0.0.1','7','dctest.bat',9,'failed test','',1,0,'',16,143,0,'aeca6a30-e891-4f20-825d-69b674e89900',0),
(841,'SVC-cups',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','cups',1,'1','',1,0,'',5,134,0,'6d4946c0-cef0-477d-b8b0-efd18aee55f2',5),
(842,'SVC-dhcpd',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','dhcpd',1,'1','',1,0,'',5,134,0,'16c21580-db7c-4eff-9492-6beb4ae33cc4',2),
(843,'SVC-named',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','named',1,'1','',1,0,'',5,134,0,'0f2644ec-31c0-47b6-a439-f42fd95333a9',1),
(844,'SVC-radius',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','radius',1,'1','',1,0,'',5,134,0,'ff4083ed-7e18-47a7-ba17-a712a59d613e',6),
(845,'SVC-vsftpd',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','vsftpd',1,'1','',1,0,'',5,134,0,'df66c33a-3a2f-408e-a84a-630ec0016a81',7),
(846,'SVC-ntpd',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','ntpd',1,'1','',1,0,'',5,134,0,'f18392e2-fc82-4210-bee3-07b91759566a',8),
(847,'SVC-sshd',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','sshd',1,'1','',1,0,'',5,134,0,'baa87545-66d2-41db-a61b-c33d5f2c7cab',9),
(866,'SVC-afp',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|MacService=afp|tzcompdisabled=1|priority=5',0,120,'127.0.0.1','7','serveradmin status afp',5,'RUNNING','',1,0,'',5,134,0,'a225dd59-6855-4cd5-af2a-abe4fe10bf95',3),
(869,'SVC-dhcp',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|MacService=dhcp|tzcompdisabled=1|priority=5',0,120,'127.0.0.1','7','serveradmin status dhcp',5,'RUNNING','',1,0,'',5,134,0,'d9195758-d22f-4bd5-aefa-570565a6052d',2),
(870,'SVC-dns',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|MacService=dns|tzcompdisabled=1|priority=5',0,120,'127.0.0.1','7','serveradmin status dns',5,'RUNNING','',1,0,'',5,134,0,'90c5fc40-8130-4520-9f70-08db4954b6f1',1),
(871,'SVC-ipfilter',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|MacService=ipfilter|tzcompdisabled=1|priority=5',0,120,'127.0.0.1','7','serveradmin status ipfilter',5,'RUNNING','',1,0,'',5,134,0,'a7c464a4-e97d-463f-9efa-192bf9434bdf',10),
(873,'SVC-nfs',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|MacService=nfs|tzcompdisabled=1|priority=5',0,120,'127.0.0.1','7','serveradmin status nfs',5,'RUNNING','',1,0,'',5,134,0,'2ea8d477-6a0a-455d-bcac-7f5aab6cd0e7',3),
(874,'SVC-smb',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|MacService=smb|tzcompdisabled=1|priority=5',0,120,'127.0.0.1','7','serveradmin status smb',5,'RUNNING','',1,0,'',5,134,0,'d1ef0fa4-d2c6-4769-8b51-73ec679f5b3b',3),
(875,'SVC-vpn',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|MacService=vpn|tzcompdisabled=1|priority=5',0,120,'127.0.0.1','7','serveradmin status vpn',5,'RUNNING','',1,0,'',5,134,0,'d3e143c3-2854-4f49-aef2-2c488f92fd14',11);

/*Table structure for table `plugin_coreservices_appliesto` */

DROP TABLE IF EXISTS `plugin_coreservices_appliesto`;

CREATE TABLE `plugin_coreservices_appliesto` (
  `MonitorGUID` char(36) NOT NULL,
  `Versions` varchar(100) NOT NULL DEFAULT '',
  `Roles` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`MonitorGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `plugin_coreservices_appliesto` */

insert  into `plugin_coreservices_appliesto`(`MonitorGUID`,`Versions`,`Roles`) values 
('0728fea4-21c4-45f1-b053-5d3e218e2474','Terminal Servers',''),
('0f2644ec-31c0-47b6-a439-f42fd95333a9','Linux DNS-Bind Servers',''),
('1313d8ee-a01c-4add-9ded-25207f5b1184','Windows DHCP Servers',''),
('16c21580-db7c-4eff-9492-6beb4ae33cc4','Linux DHCP Servers',''),
('1a8775ad-3e29-4ed3-aace-ce98f1aa7978','Windows Print Servers',''),
('1d1f9463-6f2c-4618-8029-f6a465ce11f9','Windows DNS Servers',''),
('2274adf8-4a3f-490d-a6b9-517b9b760d34','Windows DNS Servers',''),
('238740d9-d72b-4fa9-a428-fd6ae8abef21','Windows DNS Servers',''),
('2ea8d477-6a0a-455d-bcac-7f5aab6cd0e7','OS X File Sharing - NFS',''),
('3a04b8f2-d15b-447a-b30b-ae6687a9e8e4','Terminal Servers',''),
('3d5c808a-f4e3-11e4-8452-080027715141','Hyper-V',''),
('3d5c8220-f4e3-11e4-8452-080027715141','Hyper-V',''),
('3d5c82e0-f4e3-11e4-8452-080027715141','Hyper-V',''),
('3d5c851c-f4e3-11e4-8452-080027715141','Hyper-V',''),
('3d5c8621-f4e3-11e4-8452-080027715141','Hyper-V',''),
('3d5c867c-f4e3-11e4-8452-080027715141','Hyper-V',''),
('3d5c8703-f4e3-11e4-8452-080027715141','Hyper-V',''),
('4267839c-a975-4ee8-bf44-0d8161d2866f','Domain Controllers',''),
('43c6b41e-707b-4fde-b8b7-48ebf1baf649','Windows DHCP Servers',''),
('49f164b6-4e3b-414c-ac26-4468b943d8df','Citrix XenApp Servers',''),
('49f6d003-ab75-476e-a2a5-78079a57b10f','Citrix XenApp Servers',''),
('4ce14067-4114-485d-a250-9ca78841a9bb','Domain Controllers',''),
('4d12ac95-3b31-40dd-9c1f-515b1f20ce69','Terminal Servers',''),
('4eb00219-9eab-470b-babc-ee7fa30aeaee','Domain Controllers','2008+ Class Servers'),
('4f0ddfa6-83ac-48c2-9af5-b89eb58f85e3','Windows DNS Servers',''),
('4f15fe72-4417-4f74-9cd2-d0e3fe25d861','Citrix XenApp Servers',''),
('4f61afbd-ac82-4c4a-839e-68cfa4bafa5f','Domain Controllers',''),
('543702a0-bf8c-41df-8426-40837bae722b','Windows File Servers',''),
('56700e77-7c3b-4640-94bc-607dc057976b','Terminal Server Gateway',''),
('5ff3fbfc-6eb1-46f7-baef-b0e1a16a1d23','Domain Controllers',''),
('6161b633-8ead-411d-a9f9-45eec2795bae','Domain Controllers',''),
('62be6819-9a6c-4f12-a1f7-578896825df8','Windows File Servers',''),
('6383e32b-76cd-46d7-aa2c-8bc60ca9374d','Domain Controllers',''),
('66715537-9d74-4a55-ba20-e9c28d10aed6','Domain Controllers',''),
('68dec598-26c6-453a-91f6-93e6ccfcacbc','Windows DHCP Servers',''),
('6b611107-de84-462b-9b78-3057fe7e5b44','Domain Controllers',''),
('6d42cf44-089e-4379-8f6e-3f630a4ab788','Windows Print Servers',''),
('6d4946c0-cef0-477d-b8b0-efd18aee55f2','Linux CUPS Print Servers',''),
('7dd59817-24cf-4a28-a4ac-4e38282cf797','Domain Controllers',''),
('90c5fc40-8130-4520-9f70-08db4954b6f1','OS X DNS',''),
('9653fec2-3841-4793-86a1-d6847c00b370','Domain Controllers',''),
('97cdf806-29b6-43a1-a710-80bd38d7730d','Domain Controllers',''),
('99b19592-0c88-4adf-9d2f-ad71214c4a67','Windows File Servers',''),
('a225dd59-6855-4cd5-af2a-abe4fe10bf95','OS X File Sharing - AFP',''),
('a7c464a4-e97d-463f-9efa-192bf9434bdf','OS X Firewall IPFilter',''),
('aec6526b-fffc-45c4-b962-c219588a6474','Windows DHCP Servers',''),
('aeca6a30-e891-4f20-825d-69b674e89900','Domain Controllers',''),
('baa87545-66d2-41db-a61b-c33d5f2c7cab','Linux SSH Servers',''),
('bbb348cb-2d57-455a-971a-8743e8174d05','Domain Controllers',''),
('bd38aa76-848d-45f7-81c0-07cf255cce5c','Domain Controllers',''),
('bf047896-5656-49dc-99d0-c8aa49fa19e5','Domain Controllers',''),
('c73e9580-00a6-499b-989e-12a0bf3f817e','Citrix XenApp Servers',''),
('c7eb3919-0309-4b2f-b4d6-5c8ebe9fe844','Domain Controllers',''),
('c9452b6b-2dd7-496f-a711-9a4c4888592b','Windows DHCP Servers',''),
('cb503551-63cf-4f39-8f34-152f7aeb3b05','Windows Print Servers',''),
('cb6bd925-50d3-4a6b-a915-59e7aa265633','Windows Print Servers',''),
('d090ee9d-026b-40dd-8b4b-35ba999d551d','Domain Controllers','NTDS'),
('d1c278c3-5805-42f0-889a-d1710b13c350','Citrix XenApp Servers',''),
('d1ef0fa4-d2c6-4769-8b51-73ec679f5b3b','OS X File Sharing - SMB/Windows',''),
('d3e143c3-2854-4f49-aef2-2c488f92fd14','OS X VPN',''),
('d9195758-d22f-4bd5-aefa-570565a6052d','OS X DHCP',''),
('d9b0fd86-6a74-4b8d-8ca8-c22ed3a1c9bc','Windows DNS Servers','Bind'),
('df66c33a-3a2f-408e-a84a-630ec0016a81','Linux FTP-vsftpd Servers',''),
('e1258bf5-3d0d-42ad-bbdb-e8289f2c91f1','Domain Controllers',''),
('e29dfbb5-ea7f-43f1-a31d-77eae5bc43a6','Windows Print Servers',''),
('e799023a-dea8-4102-9f7e-2d7becadca24','Windows DNS Servers',''),
('f0036b47-6f20-48d2-a833-168754f2e160','Windows Print Servers',''),
('f00eb5d9-7fee-46f1-bcd7-a4383ee44049','Windows DHCP Servers',''),
('f0db76d3-99e8-45e1-859c-f6ba38ae9cb3','Windows DHCP Servers',''),
('f18392e2-fc82-4210-bee3-07b91759566a','Linux NTP Servers',''),
('f215f6cb-3d72-42c2-ac93-cf30b4edee5e','Citrix XenApp Servers',''),
('f2563d39-3875-44ce-a0b9-5bb190aec4a5','Windows DHCP Servers',''),
('f351aa9e-53eb-4aa8-b986-cb8655ccc2f8','Windows DNS Servers',''),
('f3df8ad1-fb66-4d7b-b9c3-12412daf094c','Domain Controllers',''),
('f3f480a1-4c51-44c6-83d1-a57d14255b07','Citrix XenApp Servers',''),
('f79008e5-bf19-423a-817e-42ee79234bf9','Windows DHCP Servers',''),
('fa0f360f-a8ea-4048-b301-ee57a191c840','Domain Controllers',''),
('ff4083ed-7e18-47a7-ba17-a712a59d613e','Linux FreeRadius Servers','');

/*Table structure for table `plugin_coreservices_deprecatedgroupagents` */

DROP TABLE IF EXISTS `plugin_coreservices_deprecatedgroupagents`;

CREATE TABLE `plugin_coreservices_deprecatedgroupagents` (
  `AgentID` int(11) NOT NULL AUTO_INCREMENT,
  `GroupID` int(11) NOT NULL,
  `SearchID` int(11) NOT NULL,
  `Name` varchar(200) NOT NULL,
  `CheckAction` int(11) NOT NULL,
  `AlertAction` int(11) NOT NULL,
  `AlertMessage` text NOT NULL,
  `ContactID` int(11) NOT NULL,
  `interval` int(11) NOT NULL,
  `Where` varchar(255) NOT NULL,
  `What` varchar(255) NOT NULL,
  `DataOut` text NOT NULL,
  `Comparor` int(11) NOT NULL,
  `DataIn` varchar(8000) NOT NULL,
  `IDField` varchar(500) NOT NULL,
  `AlertStyle` int(11) NOT NULL DEFAULT '0',
  `ScriptID` int(11) NOT NULL,
  `DataCollector` varchar(100) NOT NULL,
  `Category` int(11) NOT NULL,
  `TicketCategory` int(11) NOT NULL,
  `ScriptTarget` int(11) DEFAULT '1',
  `GUID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`AgentID`),
  KEY `ContactID` (`ContactID`),
  KEY `Name` (`Name`),
  KEY `GroupID` (`GroupID`),
  KEY `SearchID` (`SearchID`)
) ENGINE=InnoDB AUTO_INCREMENT=864 DEFAULT CHARSET=utf8;

/*Data for the table `plugin_coreservices_deprecatedgroupagents` */

insert  into `plugin_coreservices_deprecatedgroupagents`(`AgentID`,`GroupID`,`SearchID`,`Name`,`CheckAction`,`AlertAction`,`AlertMessage`,`ContactID`,`interval`,`Where`,`What`,`DataOut`,`Comparor`,`DataIn`,`IDField`,`AlertStyle`,`ScriptID`,`DataCollector`,`Category`,`TicketCategory`,`ScriptTarget`,`GUID`) values 
(207,959,441,'SVC-Citrix Encryption Service',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',1,60,'127.0.0.1','2','Citrix Encryption Service',1,'1','',1,0,'',5,134,1,'5de7e7ac-7877-4276-996d-548c396bb0ea'),
(208,959,838,'SVC-Citrix Licensing',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',1,60,'127.0.0.1','2','Citrix Licensing',1,'1','',1,0,'',5,134,1,'21cd6adf-e3d0-4759-a203-1a0afe5174d1'),
(209,959,441,'SVC-CitrixCseEngine',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',1,60,'127.0.0.1','2','CitrixCseEngine',1,'1','',1,0,'',5,134,1,'5ce3f643-542f-4e83-86ff-ccb2d3404b6b'),
(210,959,441,'SVC-CitrixHealthMon',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',1,60,'127.0.0.1','2','CitrixHealthMon',1,'1','',1,0,'',5,134,1,'8a5e2a99-28c9-49ed-b3c1-46f7e2fd74fe'),
(211,959,441,'SVC-Citrix_GTLicensingProv',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',1,60,'127.0.0.1','2','Citrix_GTLicensingProv',1,'1','',1,0,'',5,134,1,'607ce028-8577-40b8-b936-db999891623f'),
(328,949,554,'SVC-DNS',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',1,60,'127.0.0.1','2','DNS',1,'1','',1,0,'',5,138,1,'704cbcf8-b7af-428c-b21e-842838a751e0'),
(329,847,659,'SVC-nvspwmi',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',1,60,'127.0.0.1','2','nvspwmi',1,'1','',1,0,'',5,134,1,'1ac2dda0-7756-40d5-bbe8-e55deb371297'),
(330,847,659,'SVC-vhdsvc',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',1,60,'127.0.0.1','2','vhdsvc',1,'1','',1,0,'',5,137,1,'5991e7a4-8035-4c05-9897-d85a5df920ab'),
(331,847,0,'SVC-vmms',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',1,60,'127.0.0.1','2','vmms',1,'1','',1,0,'',5,134,1,'f1539b91-8f68-4434-925b-b0b792c44de7'),
(367,948,0,'SVC-DHCPServer',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',1,60,'127.0.0.1','2','DHCPServer',1,'1','',1,0,'',5,138,1,'95525cee-f8ec-47e1-8a1f-d84c6619c8f9'),
(385,994,0,'SVC-TSGateway',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',1,60,'127.0.0.1','2','TSGateway',1,'1','',1,0,'',5,137,1,'763165ce-d0b6-4b01-a505-b43d1cd4668c'),
(398,828,576,'SVC-NTDS',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',1,60,'127.0.0.1','2','NTDS',1,'1','',1,0,'',5,137,1,'777e3c48-2f4c-4c1c-b10e-564c77638e7f'),
(424,949,555,'SVC-BIND',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',1,60,'127.0.0.1','2','named',1,'1','',1,0,'',5,134,1,'5ec013ec-0c23-445f-a29f-82f3253a9ec9'),
(428,828,0,'SVC-W32Time',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',1,60,'127.0.0.1','2','W32Time',1,'1','',1,0,'',5,138,1,'b58c03de-9435-4fd1-bb6f-e0a801d19f1c'),
(429,828,0,'SVC-LanmanServer',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',1,60,'127.0.0.1','2','LanmanServer',1,'1','',1,0,'',5,137,1,'f128e2c5-71cd-4a70-b00f-d72d0b66d042'),
(430,828,0,'SVC-RpcSs',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',1,60,'127.0.0.1','2','RpcSs',1,'1','',1,0,'',5,137,1,'da1feefa-7aaf-4c2c-b601-bbd3512494c1'),
(431,828,0,'SVC-kdc',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',1,60,'127.0.0.1','2','kdc',1,'1','',1,0,'',5,137,1,'e56cddee-d6fe-4f50-ba35-7af834b54160'),
(434,956,0,'SVC-Spooler',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',1,60,'127.0.0.1','2','Spooler',1,'1','',1,0,'',5,134,1,'5d3d0c48-a441-4247-af71-95d4e6df0ad2'),
(562,828,0,'Perf - DRA Inbound Bytes Total/Sec',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r\nThis counter shows the number of bytes received through inbound Active Directory related replication. If this number is consistently equal to zero, it means that replication is not occurring. Low numbers may indicate that there is a network bottleneck or that the server\'s NIC is too busy with other traffic to receive the requests in a timely manner.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r\nThis counter shows the number of bytes received through inbound Active Directory related replication. If this number is consistently equal to zero, it means that replication is not occurring. Low numbers may indicate that there is a network bottleneck or that the server\'s NIC is too busy with other traffic to receive the requests in a timely manner.',0,60,'127.0.0.1','0','NTDS!!!DRA Inbound Bytes Total/sec!!!',6,'','',1,0,'',7,123,1,'537b9ef6-d1eb-43cf-8df4-722464ca2a1e'),
(563,828,0,'Perf - DRA Inbound Object Updates Remaining in Pac',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r\nThis counter displays the number of Active Directory objects that have been received through replication, but that have not yet been applied. This number may start high, but should diminish very quickly. If this value takes a while to diminish, it is a clue that the server\'s hardware might not be fast enough to keep up with the demand.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r\nThis counter displays the number of Active Directory objects that have been received through replication, but that have not yet been applied. This number may start high, but should diminish very quickly. If this value takes a while to diminish, it is a clue that the server\'s hardware might not be fast enough to keep up with the demand.',0,60,'127.0.0.1','0','NTDS!!!DRA Inbound Object Updates Remaining in Packet!!!',6,'','',1,0,'',7,123,1,'35fa8a67-46fe-4b1a-8526-68faeebb67a7'),
(564,828,0,'Perf - DRA Outbound Bytes Total / Sec',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r\nThis counter displays the total number of bytes (compressed and uncompressed) that are being transmitted each second as a result of the replication process. A lack of activity often indicates insufficient hardware.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r\nThis counter displays the total number of bytes (compressed and uncompressed) that are being transmitted each second as a result of the replication process. A lack of activity often indicates insufficient hardware.',0,60,'127.0.0.1','0','NTDS!!!DRA Outbound Bytes Total/sec!!!',6,'','',1,0,'',7,123,1,'7810f239-3f74-4bc7-91b3-b200d9474531'),
(565,828,0,'Perf - DRA Pending Replication Synchronization',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r\nThis number indicates the number of objects which must be synchronized. Like the DRA Inbound Object Updated Remaining in Packet counter, this value may start high, but should quickly dissipate. If this counter\'s value remains high, it usually means that the hardware is having trouble keeping pace with the demands being made of it.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r\nThis number indicates the number of objects which must be synchronized. Like the DRA Inbound Object Updated Remaining in Packet counter, this value may start high, but should quickly dissipate. If this counter\'s value remains high, it usually means that the hardware is having trouble keeping pace with the demands being made of it.',0,60,'127.0.0.1','0','NTDS!!!DRA Pending Replication Synchronizations!!!',6,'','',1,0,'',7,123,1,'7ca00e0d-e1d3-4052-ac9e-84bb5d79f874'),
(566,828,0,'Perf - DS Threads in Use',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r\nThis counter indicates the number of threads that are currently servicing client API calls. You can use this value to determine whether or not the domain controller could benefit from additional processors.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r\nThis counter indicates the number of threads that are currently servicing client API calls. You can use this value to determine whether or not the domain controller could benefit from additional processors.',0,60,'127.0.0.1','0','NTDS!!!DS Threads in Use!!!',6,'','',1,0,'',7,123,1,'128b7d64-63b5-45e4-ae4a-58956b221936'),
(567,828,0,'Perf - LDAP Bind Time',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r\nThis counter indicates the number of milliseconds that the last successful LDAP bind took to complete. This value should remain consistently low. Longer bind times can be an indication of network problems or of hardware that needs to be upgraded.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r\nThis counter indicates the number of milliseconds that the last successful LDAP bind took to complete. This value should remain consistently low. Longer bind times can be an indication of network problems or of hardware that needs to be upgraded.',0,60,'127.0.0.1','0','NTDS!!!LDAP Bind Time!!!',6,'','',1,0,'',7,123,1,'53a3bdfc-f90f-4828-8f4b-57cafaa7aca6'),
(568,828,0,'Perf - LDAP Client Sessions',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r\nThis number indicates the number of LDAP sessions that are connected to the domain controller at the moment. The appropriate value depends on your network, but if this value remains at zero, it means that you probably have some network problems that are preventing client sessions from connecting with the server.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r\nThis number indicates the number of LDAP sessions that are connected to the domain controller at the moment. The appropriate value depends on your network, but if this value remains at zero, it means that you probably have some network problems that are preventing client sessions from connecting with the server.',0,60,'127.0.0.1','0','NTDS!!!LDAP Client Sessions!!!',6,'','',1,0,'',7,123,1,'b4abe6c0-3094-4a07-bf15-3d6c6fedc9ee'),
(569,828,0,'Perf - LDAP Searches / Sec',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r\nThe LDAP Searches / Sec counter indicates the number of LDAP queries made by clients each second. I recommend viewing this counter along with the LDAP Successful Binds / Sec counter, which shows the number of successful LDAP binds each second. The biggest thing that you are looking for in these two counters is activity. A lack of activity would almost always indicate that network problems are disrupting the client\'s ability to interact with the domain controller.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r\nThe LDAP Searches / Sec counter indicates the number of LDAP queries made by clients each second. I recommend viewing this counter along with the LDAP Successful Binds / Sec counter, which shows the number of successful LDAP binds each second. The biggest thing that you are looking for in these two counters is activity. A lack of activity would almost always indicate that network problems are disrupting the client\'s ability to interact with the domain controller.',0,60,'127.0.0.1','0','NTDS!!!LDAP Searches/sec!!!',6,'','',1,0,'',7,123,1,'7953cbb0-937f-4bce-901d-3e1d5f211fb6'),
(577,828,0,'Perf - AD DB Cache % Hit',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r\nThis counter shows the percentage of database page requests handled by the cache, thereby not causing a file I/O. A lack of activity can indicate that the server has insufficient physical memory.\r\n',0,60,'127.0.0.1','0','Database!!!Database Cache % Hit!!!',6,'','',1,0,'',7,124,1,'d577937d-aadd-46ab-b430-b596fe3576c5'),
(578,828,0,'Perf - Cache Page Fault Stalls/Sec',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r\nThis counter shows the number of page faults per second that go unserviced due to lack of available pages in the database cache. A value other than zero indicates insufficient physical memory in the server.\r\n',0,60,'127.0.0.1','0','Database!!!Database Page Fault Stalls/sec!!!',6,'','',1,0,'',7,123,1,'cb7d2ba2-28a7-46ee-aced-f21bd860a502'),
(579,828,0,'Perf - Cache Page Faults/Sec',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r\nThis counter shows the number of page requests per second that cause the database cache to allocate new pages from the cache. This value should be low, with a higher value indicating insufficient physical memory in the server.\r\n',0,60,'127.0.0.1','0','Database!!!Database Page Faults/sec!!!',6,'','',1,0,'',7,123,1,'30821793-8cbc-40d3-abdc-5021fd7531d0'),
(580,828,0,'Perf - Log Record Stalls/Sec',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r\nThis counter shows the number of log records per second that could not be added to the log buffers because the buffers were full. The value should be zero or close to zero, with a higher value indicating inadequate physical memory in the server.\r\n\r\n',0,60,'127.0.0.1','0','Database!!!Log Record Stalls/sec!!!',6,'','',1,0,'',7,123,1,'521686b4-a799-45f4-9545-013ebebe305b'),
(581,828,0,'Perf - Log Threads Waiting',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r\nThis counter indicates the number of threads waiting on pending log writes. The value should be low, with a higher value indicating insufficient physical memory, poor disk performance, or poor disk structuring.\r\n',0,60,'127.0.0.1','0','Database!!!Log Threads Waiting!!!',6,'','',1,0,'',7,123,1,'78b7cf51-9dfa-4b1b-9d1a-ff72e51f0f00'),
(582,828,0,'Perf - Table Open Cache Hits/Sec',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r\nThis counter shows the number of directory database tables open per second from the cache. A high value indicates better caching, with a lower value typically indicating inadequate physical memory in the server. \r\n',0,60,'127.0.0.1','0','Database!!!Table Open Cache Hits/sec!!!',6,'','',1,0,'',7,123,1,'ddb019c3-6d3b-4971-ab6f-e469ae9597b5'),
(584,828,659,'EXE - KCC Consistency Check',6,45,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.',0,43200,'127.0.0.1','7','kcctest.bat',5,'successful','',1,0,'',16,143,1,'b30c7a17-7cd8-4446-8844-2e74f6c59b4c'),
(585,948,0,'Perf - DHCP Acks / Sec',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r\nThe number of DHCP acknowledgment messages (DHCPACKs) sent per second by the DHCP server to clients. A sudden or unusual increase in this number indicates that a large number of clients are being renewed by the DHCP server. This might indicate that scope lease durations are too short.\r\n',0,60,'127.0.0.1','0','DHCP Server!!!Acks/sec!!!',6,'','',1,0,'',7,123,1,'05f92ad9-7392-4cfd-a66c-4a9083f96d19'),
(586,948,0,'Perf - DHCP Active Queue Length',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\nThe current length of the internal message queue of the DHCP server. This number equals the number of unprocessed messages received by the server. A large number might indicate heavy server traffic.\r\n',0,60,'127.0.0.1','0','DHCP Server!!!Active Queue Length!!!',6,'','',1,0,'',7,123,1,'36533c56-72f3-44dc-9eb5-fb7f7988bdfd'),
(587,948,0,'Perf - DHCP Conflict Check Queue Length',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r\nThe current length of the conflict check queue for the DHCP server. This queue holds messages without responses while the DHCP server performs address conflict detection. A large value here might indicate that Conflict Detection Attempts has been set too high or that there is unusually heavy lease traffic at the server.\r\n',0,60,'127.0.0.1','0','DHCP Server!!!Conflict Check Queue Length!!!',6,'','',1,0,'',7,123,1,'97af1879-1ee0-4fa9-85f6-08ec87d65654'),
(588,948,0,'Perf - DHCP Declines Sec',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r\nThe number of DHCP decline messages (DHCPDECLINEs) received per second by the DHCP server from clients. A high value indicates that several clients have found their address to be in conflict, possibly indicating network trouble. In this situation, it can help to enable conflict detection on the DHCP server. This should only be used temporarily. Once the situation returns to normal, it should be turned off.\r\n',0,60,'127.0.0.1','0','DHCP Server!!!Declines/sec!!!',6,'','',1,0,'',7,123,1,'190f39c7-9ca1-4875-ae42-0c972a686f4b'),
(589,948,0,'Perf - DHCP Discovers Sec',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r\nThe number of DHCP discover messages (DHCPDISCOVERs) received per second by the server. These messages are sent by clients when they start on the network and obtain a new address lease. A sudden or unusual increase indicates a large number of clients are attempting to initialize and obtain an IP address lease from the server, such as when a number of client computers are started at any given time.\r\n',0,60,'127.0.0.1','0','DHCP Server!!!Discovers/sec!!!',6,'','',1,0,'',7,123,1,'95fb60ce-31b0-48a0-802c-5638af599de8'),
(590,948,0,'Perf - DHCP Informs Sec',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r\nThe number of DHCP information messages (DHCPINFORMs) received per second by the DHCP server. DHCP inform messages are used when the DHCP server queries for the directory service for the enterprise root and when dynamic updates are being done on behalf of clients by the server.\r\n',0,60,'127.0.0.1','0','DHCP Server!!!Informs/sec!!!',6,'','',1,0,'',7,123,1,'5f6c5c3d-2a3a-4676-a74e-675e76360805'),
(591,948,0,'Perf - DHCP Nacks Sec',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r\nThe number of DHCP negative acknowledgment messages (DHCPNAKs) sent per second by the DHCP server to clients. A very high value might indicate potential network trouble in the form of misconfiguration of either the server or clients. When servers are misconfigured, one possible cause is a deactivated scope. For clients, a very high value could be caused by computers moving between subnets, such as laptop portables or other mobile devices.\r\n',0,60,'127.0.0.1','0','DHCP Server!!!Nacks/sec!!!',6,'','',1,0,'',7,123,1,'9d5b3ec5-7c5e-479f-9142-ca89ddf4b9f8'),
(592,948,0,'Perf - DHCP Requests Sec',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r\nThe number of DHCP request messages (DHCPREQUESTs) received per second by the DHCP server from clients. A sudden or unusual increase in this number indicates a large number of clients trying to renew their leases with the DHCP server. This might indicate that scope lease durations are too short.\r\n',0,60,'127.0.0.1','0','DHCP Server!!!Requests/sec!!!',6,'','',1,0,'',7,123,1,'5215f1cc-2a69-4572-b6b8-e82095f0b2ed'),
(593,949,0,'Perf - DNS Caching Memory',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r\nThe total amount of system memory in use by the DNS Server service for caching.\r\n',0,60,'127.0.0.1','0','DNS!!!Caching Memory!!!',6,'','',1,0,'',7,123,1,'75b9346b-e6ba-4dbb-9a55-fae4b7c247d9'),
(594,949,0,'Perf - DNS Database Node Memory',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r\nThe total amount of system memory in use by the DNS Server service for database nodes.\r\n',0,60,'127.0.0.1','0','DNS!!!Database Node Memory!!!',6,'','',1,0,'',7,123,1,'af121652-96ce-4419-b9e1-4cfa6629ba81'),
(595,949,0,'Perf - DNS Dynamic Updates Timeouts',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r\nThe total number of dynamic update time-outs of the DNS server.\r\n',0,60,'127.0.0.1','0','DNS!!!Dynamic Update TimeOuts!!!',6,'','',1,0,'',7,123,1,'9980620d-5e74-401b-8b74-28d233b3a397'),
(596,949,0,'Perf - DNS Nbstat Memory',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r\nThe total amount of system memory in use by the DNS Server service for Nbtstat.\r\n',0,60,'127.0.0.1','0','DNS!!!Nbstat Memory!!!',6,'','',1,0,'',7,123,1,'9ed9f019-ed1b-40be-ad40-67017be254a0'),
(597,949,0,'Perf - DNS Zone Transfer Failure',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r\nThe total number of failed zone transfers of the master DNS server.\r\n',0,60,'127.0.0.1','0','DNS!!!Zone Transfer Failure!!!',4,'5','',1,0,'',7,123,1,'5c09ecb1-b488-4ebe-818f-dfe10bb2ecdc'),
(598,847,0,'Perf - Hyper V Logical Processors',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r\nWhereas Hyper-V identifies a Virtual Processor as one that is assigned in a virtual machine\'s configuration, a Logical Processor is equivalent to the count of actual processors actually on the system. In effect, a Virtual Processor can run atop any Logical Processor in accomplishing its mission. \r\n\r\nThis counter is referred to as Logical Processor as opposed to physical processor because it takes into account the number of cores per socket as well as hyperthreading CPUs. Thus, a dual-core, quad-socket computer with hyperthreading enabled will show 16 logical processors. This added counter gives you a second perspective of processor utilization on your Hyper-V system. While the earlier counter identifies processor use by a specific virtual machine, this secondary counter gives you utilization by individual processor device. Both can come in handy during performance monitoring to determine how well Hyper-V is making use of its available logical processors.',0,60,'127.0.0.1','0','Hyper-V Hypervisor!!!Logical Processors!!!',6,'','',1,0,'',7,123,1,'256522d5-4346-4ffe-bc83-267a156493ca'),
(599,847,0,'Perf - Hyper V Machine Health Critical',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r\nIf anything is Critical it means some resource (most likely disk) has been exhausted or other unrecoverable error has occurred. If you ever see ',0,60,'127.0.0.1','0','Hyper-V Virtual Machine Health Summary!!!Health Critical!!!',4,'1','',1,0,'',7,123,1,'9ab267fc-aafd-4ea7-b2bf-aa1ad9ad44cc'),
(600,847,0,'Perf - Hyper V Partitions',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.',0,60,'127.0.0.1','0','Hyper-V Hypervisor!!!Partitions!!!',6,'','',1,0,'',7,123,1,'9f1315a0-886e-482f-b832-ea35db86e5f5'),
(601,847,0,'Perf - Hyper V Total Pages',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.',0,60,'127.0.0.1','0','Hyper-V Hypervisor!!!Total Pages!!!',6,'','',1,0,'',7,123,1,'31b2bf38-99b9-4f36-ab1d-4b4e72dd9218'),
(602,956,0,'Perf - Print Job Errors',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\nTotal number of job errors in a print queue since last restart.',0,60,'127.0.0.1','0','Print Queue!!!Job Errors!!!',6,'','',1,0,'',7,123,1,'a4b5bd53-e0f6-4070-9722-8d4b9ff991a0'),
(603,956,0,'Perf - Jobs',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r\nCurrent number of jobs in a print queue. Valid values are positive integers in the range 0 to 2147483647 and can include the use of the *AVG, *MIN, *MAX, or *SUM functions.',0,60,'127.0.0.1','0','Print Queue!!!Jobs!!!',6,'','',1,0,'',7,123,1,'4b89e0aa-05ef-4042-9874-9de580a6ea6b'),
(604,956,0,'Perf - Not Ready Errors',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r\nTotal number of printer not ready errors in a print queue since the last restart.',0,60,'127.0.0.1','0','Print Queue!!!Not Ready Errors!!!',4,'10','',1,0,'',7,123,1,'8227e1c0-1b75-44a2-9ad4-0fb8c4754b1c'),
(605,956,0,'Perf - Total Jobs Printed',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r\nTotal number of jobs printed on a print queue since the last restart.',0,60,'127.0.0.1','0','Print Queue!!!Total Jobs Printed!!!',6,'','',1,0,'',7,123,1,'fea6159d-7662-429e-9e0a-73b7a74ed9ff'),
(606,956,0,'Perf - Total Pages Printed',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r\nTotal number of pages printed through GDI on a print queue since the last restart.',0,60,'127.0.0.1','0','Print Queue!!!Total Pages Printed!!!',6,'','',1,0,'',7,123,1,'9af2bd4f-81a9-4d2f-939b-fd2ba8ef54d7'),
(607,955,0,'Perf -  Files Opened Total',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.',0,60,'127.0.0.1','0','Server!!!Files Opened Total!!!',6,'','',1,0,'',7,124,1,'0da77a26-c343-4c0e-a6ac-26f931109f64'),
(608,955,0,'Perf -  Files Open',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.',0,60,'127.0.0.1','0','Server!!!Files Open!!!',6,'','',1,0,'',7,124,1,'ce8693ef-81e9-4c3e-98d0-0d48cf3c1c1d'),
(609,955,0,'Perf -  File Directory Searches',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.',0,60,'127.0.0.1','0','Server!!!File Directory Searches!!!',6,'','',1,0,'',7,124,1,'8f8de2ed-28d9-41b9-9f05-8b31d20c8e19'),
(610,848,0,'Perf - Active Sessions',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r\nTotal active sessions connected to this terminal server.',0,60,'127.0.0.1','0','Terminal Services!!!Active Sessions!!!',6,'','',1,0,'',7,124,1,'581a5457-e52c-4ae7-9089-421141225c4e'),
(611,848,0,'Perf - Total Sessions',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r\nTerminal Server Total Sesion number. This includes both active and inactive sessions and is used for capacity planning.',0,60,'127.0.0.1','0','Terminal Services!!!Total Sessions!!!',6,'','',1,0,'',7,123,1,'67cf1b1a-fad4-43e2-96d5-4a393242b0a4'),
(612,848,0,'Perf - Inactive Sessions',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r\nTotal number of sessions that have gone inactive on this terminal server.',0,60,'127.0.0.1','0','Terminal Services!!!Inactive Sessions!!!',6,'','',1,0,'',7,123,1,'39ed11fb-7e10-45fd-b450-efed2792274f'),
(617,959,0,'Perf - Data Store Connection Failure',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r\nThe number of minutes that the XenApp server has been disconnected from the data store.',0,60,'127.0.0.1','0','Citrix MetaFrame Presentation Server!!!Data Store Connection Failure!!!',6,'','',1,0,'',7,121,1,'ea932d5d-98d2-43ec-9dac-369f62086545'),
(618,959,0,'Perf - Application Resolution Time (ms)',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r\nThe time in milliseconds that a resolution took to complete.',0,60,'127.0.0.1','0','Citrix MetaFrame Presentation Server!!!Application Resolution Time (ms)!!!',6,'','',1,0,'',7,121,1,'36cc8191-25e4-435c-82ed-2a694133bd37'),
(682,1163,693,'SVC-named',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','named',1,'1','',1,0,'',5,134,1,'03f69f50-db27-49b5-94f0-576f4e56bf72'),
(695,1174,0,'SVC-vpn',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|MacService=vpn|tzcompdisabled=1|priority=5',0,120,'127.0.0.1','7','/Applications/Server.app/Contents/ServerRoot/usr/sbin/serveradmin status vpn',5,'RUNNING','',1,0,'',5,134,1,'342c177b-b969-49b5-9001-40ba9bd44dc4'),
(706,1192,0,'SVC-smb',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|MacService=smb|tzcompdisabled=1|priority=5',0,120,'127.0.0.1','7','/Applications/Server.app/Contents/ServerRoot/usr/sbin/serveradmin status smb',5,'RUNNING','',1,0,'',5,134,1,'4928bdd4-1462-4cad-8df1-e1efa64774bb'),
(707,1193,0,'SVC-nfs',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|MacService=nfs|tzcompdisabled=1|priority=5',0,120,'127.0.0.1','7','/Applications/Server.app/Contents/ServerRoot/usr/sbin/serveradmin status nfs',5,'RUNNING','',1,0,'',5,134,1,'4cb1fe0b-7930-43db-afd2-cfec1c124795'),
(717,1195,0,'SVC-ipfilter',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|MacService=ipfilter|tzcompdisabled=1|priority=5',0,120,'127.0.0.1','7','/Applications/Server.app/Contents/ServerRoot/usr/sbin/serveradmin status ipfilter',5,'RUNNING','',1,0,'',5,134,1,'6eafd94d-b571-4823-a57e-0d05f2897232'),
(719,1199,693,'SVC-vsftpd',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','vsftpd',1,'1','',1,0,'',5,134,1,'709be68e-fdd6-49e5-814f-5284b567db0c'),
(721,1171,0,'SVC-dhcp',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|MacService=dhcp|tzcompdisabled=1|priority=5',0,120,'127.0.0.1','7','/Applications/Server.app/Contents/ServerRoot/usr/sbin/serveradmin status dhcp',5,'RUNNING','',1,0,'',5,134,1,'7525c4cb-91b9-44b0-a614-4282be3eb540'),
(723,1191,0,'SVC-dns',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|MacService=dns|tzcompdisabled=1|priority=5',0,120,'127.0.0.1','7','/Applications/Server.app/Contents/ServerRoot/usr/sbin/serveradmin status dns',5,'RUNNING','',1,0,'',5,134,1,'7ca6598a-3a72-4992-b28e-cd675f3c7f5a'),
(734,1198,0,'SVC-afp',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|MacService=afp|tzcompdisabled=1|priority=5',0,120,'127.0.0.1','7','/Applications/Server.app/Contents/ServerRoot/usr/sbin/serveradmin status afp',5,'RUNNING','',1,0,'',5,134,1,'98a8d2d7-b706-498f-933c-29569badad95'),
(746,1189,693,'SVC-ntpd',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','ntpd',1,'1','',1,0,'',5,134,1,'cbfa19f1-a9b6-40f8-8477-84c6ace1ae61'),
(747,1202,693,'SVC-cups',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','cups',1,'1','',1,0,'',5,134,1,'cbffd336-da49-4bb5-8f1c-da067af4df0f'),
(750,1197,693,'SVC-sshd',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','sshd',1,'1','',1,0,'',5,134,1,'d9bd1a52-adeb-483c-b2b6-919be0d920c2'),
(762,1194,693,'SVC-radius',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','radius',1,'1','',1,0,'',5,134,1,'f9fc7216-b2aa-43af-a381-b005890214d3'),
(765,1183,693,'SVC-dhcpd',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','dhcpd',1,'1','',1,0,'',5,134,1,'fa86d0d6-9718-43e5-be4e-17f31334653d'),
(863,828,0,'EXE - Domain Controller Diagnostic',6,36,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\n|tzcompdisabled=1|priority=3',0,86400,'127.0.0.1','7','dctest.bat',9,'failed test','',1,0,'',16,143,1,'9c354c53-01d1-4e9f-924e-319b1d2de25b');

/*Table structure for table `plugin_coreservices_deprecatedmonitors` */

DROP TABLE IF EXISTS `plugin_coreservices_deprecatedmonitors`;

CREATE TABLE `plugin_coreservices_deprecatedmonitors` (
  `GUID` char(36) NOT NULL,
  `MonitorName` varchar(255) NOT NULL,
  PRIMARY KEY (`GUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `plugin_coreservices_deprecatedmonitors` */

insert  into `plugin_coreservices_deprecatedmonitors`(`GUID`,`MonitorName`) values 
('03f69f50-db27-49b5-94f0-576f4e56bf72','Service Plans.Linux Machines.Server Roles.Linux Server Core Services.Linux DNS-Bind Servers'),
('05f92ad9-7392-4cfd-a66c-4a9083f96d19','Service Plans.Windows Servers.Server Roles.Windows Servers Core Services.Windows DHCP Servers'),
('0da77a26-c343-4c0e-a6ac-26f931109f64','Service Plans.Windows Servers.Server Roles.Windows Servers Core Services.Windows File Servers'),
('128b7d64-63b5-45e4-ae4a-58956b221936','Service Plans.Windows Servers.Server Roles.Windows Servers Core Services.Domain Controllers'),
('190f39c7-9ca1-4875-ae42-0c972a686f4b','Service Plans.Windows Servers.Server Roles.Windows Servers Core Services.Windows DHCP Servers'),
('1ac2dda0-7756-40d5-bbe8-e55deb371297','Service Plans.Windows Servers.Server Roles.Windows Servers Core Services.Windows HyperV Host'),
('21cd6adf-e3d0-4759-a203-1a0afe5174d1','Service Plans.Windows Servers.Server Roles.Windows Remote Access Servers.Citrix XenApp Servers'),
('256522d5-4346-4ffe-bc83-267a156493ca','Service Plans.Windows Servers.Server Roles.Windows Servers Core Services.Windows HyperV Host'),
('30821793-8cbc-40d3-abdc-5021fd7531d0','Service Plans.Windows Servers.Server Roles.Windows Servers Core Services.Domain Controllers'),
('31b2bf38-99b9-4f36-ab1d-4b4e72dd9218','Service Plans.Windows Servers.Server Roles.Windows Servers Core Services.Windows HyperV Host'),
('342c177b-b969-49b5-9001-40ba9bd44dc4','Service Plans.MAC Servers.Server Roles.OS X Core Services.OS X VPN'),
('35fa8a67-46fe-4b1a-8526-68faeebb67a7','Service Plans.Windows Servers.Server Roles.Windows Servers Core Services.Domain Controllers'),
('36533c56-72f3-44dc-9eb5-fb7f7988bdfd','Service Plans.Windows Servers.Server Roles.Windows Servers Core Services.Windows DHCP Servers'),
('36cc8191-25e4-435c-82ed-2a694133bd37','Service Plans.Windows Servers.Server Roles.Windows Remote Access Servers.Citrix XenApp Servers'),
('39ed11fb-7e10-45fd-b450-efed2792274f','Service Plans.Windows Servers.Server Roles.Windows Remote Access Servers.Terminal Servers'),
('4928bdd4-1462-4cad-8df1-e1efa64774bb','Service Plans.MAC Servers.Server Roles.OS X Core Services.OS X File Sharing - SMB/Windows'),
('4b89e0aa-05ef-4042-9874-9de580a6ea6b','Service Plans.Windows Servers.Server Roles.Windows Servers Core Services.Windows Print Servers'),
('4cb1fe0b-7930-43db-afd2-cfec1c124795','Service Plans.MAC Servers.Server Roles.OS X Core Services.OS X File Sharing - NFS'),
('5215f1cc-2a69-4572-b6b8-e82095f0b2ed','Service Plans.Windows Servers.Server Roles.Windows Servers Core Services.Windows DHCP Servers'),
('521686b4-a799-45f4-9545-013ebebe305b','Service Plans.Windows Servers.Server Roles.Windows Servers Core Services.Domain Controllers'),
('537b9ef6-d1eb-43cf-8df4-722464ca2a1e','Service Plans.Windows Servers.Server Roles.Windows Servers Core Services.Domain Controllers'),
('53a3bdfc-f90f-4828-8f4b-57cafaa7aca6','Service Plans.Windows Servers.Server Roles.Windows Servers Core Services.Domain Controllers'),
('581a5457-e52c-4ae7-9089-421141225c4e','Service Plans.Windows Servers.Server Roles.Windows Remote Access Servers.Terminal Servers'),
('5991e7a4-8035-4c05-9897-d85a5df920ab','Service Plans.Windows Servers.Server Roles.Windows Servers Core Services.Windows HyperV Host'),
('5c09ecb1-b488-4ebe-818f-dfe10bb2ecdc','Service Plans.Windows Servers.Server Roles.Windows Servers Core Services.Windows DNS Servers'),
('5ce3f643-542f-4e83-86ff-ccb2d3404b6b','Service Plans.Windows Servers.Server Roles.Windows Remote Access Servers.Citrix XenApp Servers'),
('5d3d0c48-a441-4247-af71-95d4e6df0ad2','Service Plans.Windows Servers.Server Roles.Windows Servers Core Services.Windows Print Servers'),
('5de7e7ac-7877-4276-996d-548c396bb0ea','Service Plans.Windows Servers.Server Roles.Windows Remote Access Servers.Citrix XenApp Servers'),
('5ec013ec-0c23-445f-a29f-82f3253a9ec9','Service Plans.Windows Servers.Server Roles.Windows Servers Core Services.Windows DNS Servers'),
('5f6c5c3d-2a3a-4676-a74e-675e76360805','Service Plans.Windows Servers.Server Roles.Windows Servers Core Services.Windows DHCP Servers'),
('607ce028-8577-40b8-b936-db999891623f','Service Plans.Windows Servers.Server Roles.Windows Remote Access Servers.Citrix XenApp Servers'),
('67cf1b1a-fad4-43e2-96d5-4a393242b0a4','Service Plans.Windows Servers.Server Roles.Windows Remote Access Servers.Terminal Servers'),
('6eafd94d-b571-4823-a57e-0d05f2897232','Service Plans.MAC Servers.Server Roles.OS X Core Services.OS X Firewall IPFilter'),
('704cbcf8-b7af-428c-b21e-842838a751e0','Service Plans.Windows Servers.Server Roles.Windows Servers Core Services.Windows DNS Servers'),
('709be68e-fdd6-49e5-814f-5284b567db0c','Service Plans.Linux Machines.Server Roles.Linux Server Core Services.Linux FTP-vsftpd Servers'),
('7525c4cb-91b9-44b0-a614-4282be3eb540','Service Plans.MAC Servers.Server Roles.OS X Core Services.OS X DHCP'),
('75b9346b-e6ba-4dbb-9a55-fae4b7c247d9','Service Plans.Windows Servers.Server Roles.Windows Servers Core Services.Windows DNS Servers'),
('763165ce-d0b6-4b01-a505-b43d1cd4668c','Service Plans.Windows Servers.Server Roles.Windows Remote Access Servers.Terminal Server Gateway'),
('777e3c48-2f4c-4c1c-b10e-564c77638e7f','Service Plans.Windows Servers.Server Roles.Windows Servers Core Services.Domain Controllers'),
('7810f239-3f74-4bc7-91b3-b200d9474531','Service Plans.Windows Servers.Server Roles.Windows Servers Core Services.Domain Controllers'),
('78b7cf51-9dfa-4b1b-9d1a-ff72e51f0f00','Service Plans.Windows Servers.Server Roles.Windows Servers Core Services.Domain Controllers'),
('7953cbb0-937f-4bce-901d-3e1d5f211fb6','Service Plans.Windows Servers.Server Roles.Windows Servers Core Services.Domain Controllers'),
('7ca00e0d-e1d3-4052-ac9e-84bb5d79f874','Service Plans.Windows Servers.Server Roles.Windows Servers Core Services.Domain Controllers'),
('7ca6598a-3a72-4992-b28e-cd675f3c7f5a','Service Plans.MAC Servers.Server Roles.OS X Core Services.OS X DNS'),
('8227e1c0-1b75-44a2-9ad4-0fb8c4754b1c','Service Plans.Windows Servers.Server Roles.Windows Servers Core Services.Windows Print Servers'),
('8a5e2a99-28c9-49ed-b3c1-46f7e2fd74fe','Service Plans.Windows Servers.Server Roles.Windows Remote Access Servers.Citrix XenApp Servers'),
('8f8de2ed-28d9-41b9-9f05-8b31d20c8e19','Service Plans.Windows Servers.Server Roles.Windows Servers Core Services.Windows File Servers'),
('95525cee-f8ec-47e1-8a1f-d84c6619c8f9','Service Plans.Windows Servers.Server Roles.Windows Servers Core Services.Windows DHCP Servers'),
('95fb60ce-31b0-48a0-802c-5638af599de8','Service Plans.Windows Servers.Server Roles.Windows Servers Core Services.Windows DHCP Servers'),
('97af1879-1ee0-4fa9-85f6-08ec87d65654','Service Plans.Windows Servers.Server Roles.Windows Servers Core Services.Windows DHCP Servers'),
('98a8d2d7-b706-498f-933c-29569badad95','Service Plans.MAC Servers.Server Roles.OS X Core Services.OS X File Sharing - AFP'),
('9980620d-5e74-401b-8b74-28d233b3a397','Service Plans.Windows Servers.Server Roles.Windows Servers Core Services.Windows DNS Servers'),
('9ab267fc-aafd-4ea7-b2bf-aa1ad9ad44cc','Service Plans.Windows Servers.Server Roles.Windows Servers Core Services.Windows HyperV Host'),
('9af2bd4f-81a9-4d2f-939b-fd2ba8ef54d7','Service Plans.Windows Servers.Server Roles.Windows Servers Core Services.Windows Print Servers'),
('9c354c53-01d1-4e9f-924e-319b1d2de25b','Service Plans.Windows Servers.Server Roles.Windows Servers Core Services.Domain Controllers'),
('9d5b3ec5-7c5e-479f-9142-ca89ddf4b9f8','Service Plans.Windows Servers.Server Roles.Windows Servers Core Services.Windows DHCP Servers'),
('9ed9f019-ed1b-40be-ad40-67017be254a0','Service Plans.Windows Servers.Server Roles.Windows Servers Core Services.Windows DNS Servers'),
('9f1315a0-886e-482f-b832-ea35db86e5f5','Service Plans.Windows Servers.Server Roles.Windows Servers Core Services.Windows HyperV Host'),
('a4b5bd53-e0f6-4070-9722-8d4b9ff991a0','Service Plans.Windows Servers.Server Roles.Windows Servers Core Services.Windows Print Servers'),
('af121652-96ce-4419-b9e1-4cfa6629ba81','Service Plans.Windows Servers.Server Roles.Windows Servers Core Services.Windows DNS Servers'),
('b30c7a17-7cd8-4446-8844-2e74f6c59b4c','Service Plans.Windows Servers.Server Roles.Windows Servers Core Services.Domain Controllers'),
('b4abe6c0-3094-4a07-bf15-3d6c6fedc9ee','Service Plans.Windows Servers.Server Roles.Windows Servers Core Services.Domain Controllers'),
('b58c03de-9435-4fd1-bb6f-e0a801d19f1c','Service Plans.Windows Servers.Server Roles.Windows Servers Core Services.Domain Controllers'),
('cb7d2ba2-28a7-46ee-aced-f21bd860a502','Service Plans.Windows Servers.Server Roles.Windows Servers Core Services.Domain Controllers'),
('cbfa19f1-a9b6-40f8-8477-84c6ace1ae61','Service Plans.Linux Machines.Server Roles.Linux Server Core Services.Linux NTP Servers'),
('cbffd336-da49-4bb5-8f1c-da067af4df0f','Service Plans.Linux Machines.Server Roles.Linux Server Core Services.Linux CUPS Print Servers'),
('ce8693ef-81e9-4c3e-98d0-0d48cf3c1c1d','Service Plans.Windows Servers.Server Roles.Windows Servers Core Services.Windows File Servers'),
('d577937d-aadd-46ab-b430-b596fe3576c5','Service Plans.Windows Servers.Server Roles.Windows Servers Core Services.Domain Controllers'),
('d9bd1a52-adeb-483c-b2b6-919be0d920c2','Service Plans.Linux Machines.Server Roles.Linux Server Core Services.Linux SSH Servers'),
('da1feefa-7aaf-4c2c-b601-bbd3512494c1','Service Plans.Windows Servers.Server Roles.Windows Servers Core Services.Domain Controllers'),
('ddb019c3-6d3b-4971-ab6f-e469ae9597b5','Service Plans.Windows Servers.Server Roles.Windows Servers Core Services.Domain Controllers'),
('e56cddee-d6fe-4f50-ba35-7af834b54160','Service Plans.Windows Servers.Server Roles.Windows Servers Core Services.Domain Controllers'),
('ea932d5d-98d2-43ec-9dac-369f62086545','Service Plans.Windows Servers.Server Roles.Windows Remote Access Servers.Citrix XenApp Servers'),
('f128e2c5-71cd-4a70-b00f-d72d0b66d042','Service Plans.Windows Servers.Server Roles.Windows Servers Core Services.Domain Controllers'),
('f1539b91-8f68-4434-925b-b0b792c44de7','Service Plans.Windows Servers.Server Roles.Windows Servers Core Services.Windows HyperV Host'),
('f9fc7216-b2aa-43af-a381-b005890214d3','Service Plans.Linux Machines.Server Roles.Linux Server Core Services.Linux FreeRadius Servers'),
('fa86d0d6-9718-43e5-be4e-17f31334653d','Service Plans.Linux Machines.Server Roles.Linux Server Core Services.Linux DHCP Servers'),
('fea6159d-7662-429e-9e0a-73b7a74ed9ff','Service Plans.Windows Servers.Server Roles.Windows Servers Core Services.Windows Print Servers');

/*Table structure for table `plugin_coreservices_guidmap` */

DROP TABLE IF EXISTS `plugin_coreservices_guidmap`;

CREATE TABLE `plugin_coreservices_guidmap` (
  `OldGUID` char(36) NOT NULL,
  `NewGUID` char(36) NOT NULL,
  PRIMARY KEY (`OldGUID`,`NewGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `plugin_coreservices_guidmap` */

insert  into `plugin_coreservices_guidmap`(`OldGUID`,`NewGUID`) values 
('03f69f50-db27-49b5-94f0-576f4e56bf72','0f2644ec-31c0-47b6-a439-f42fd95333a9'),
('05f92ad9-7392-4cfd-a66c-4a9083f96d19','f2563d39-3875-44ce-a0b9-5bb190aec4a5'),
('0da77a26-c343-4c0e-a6ac-26f931109f64','543702a0-bf8c-41df-8426-40837bae722b'),
('128b7d64-63b5-45e4-ae4a-58956b221936','bd38aa76-848d-45f7-81c0-07cf255cce5c'),
('190f39c7-9ca1-4875-ae42-0c972a686f4b','f79008e5-bf19-423a-817e-42ee79234bf9'),
('1ac2dda0-7756-40d5-bbe8-e55deb371297','3d5c808a-f4e3-11e4-8452-080027715141'),
('21cd6adf-e3d0-4759-a203-1a0afe5174d1','d1c278c3-5805-42f0-889a-d1710b13c350'),
('256522d5-4346-4ffe-bc83-267a156493ca','3d5c851c-f4e3-11e4-8452-080027715141'),
('30821793-8cbc-40d3-abdc-5021fd7531d0','e1258bf5-3d0d-42ad-bbdb-e8289f2c91f1'),
('31b2bf38-99b9-4f36-ab1d-4b4e72dd9218','3d5c8703-f4e3-11e4-8452-080027715141'),
('342c177b-b969-49b5-9001-40ba9bd44dc4','d3e143c3-2854-4f49-aef2-2c488f92fd14'),
('35fa8a67-46fe-4b1a-8526-68faeebb67a7','7dd59817-24cf-4a28-a4ac-4e38282cf797'),
('36533c56-72f3-44dc-9eb5-fb7f7988bdfd','1313d8ee-a01c-4add-9ded-25207f5b1184'),
('36cc8191-25e4-435c-82ed-2a694133bd37','49f164b6-4e3b-414c-ac26-4468b943d8df'),
('39ed11fb-7e10-45fd-b450-efed2792274f','3a04b8f2-d15b-447a-b30b-ae6687a9e8e4'),
('4928bdd4-1462-4cad-8df1-e1efa64774bb','d1ef0fa4-d2c6-4769-8b51-73ec679f5b3b'),
('4b89e0aa-05ef-4042-9874-9de580a6ea6b','1a8775ad-3e29-4ed3-aace-ce98f1aa7978'),
('4cb1fe0b-7930-43db-afd2-cfec1c124795','2ea8d477-6a0a-455d-bcac-7f5aab6cd0e7'),
('5215f1cc-2a69-4572-b6b8-e82095f0b2ed','f0db76d3-99e8-45e1-859c-f6ba38ae9cb3'),
('521686b4-a799-45f4-9545-013ebebe305b','bbb348cb-2d57-455a-971a-8743e8174d05'),
('537b9ef6-d1eb-43cf-8df4-722464ca2a1e','97cdf806-29b6-43a1-a710-80bd38d7730d'),
('53a3bdfc-f90f-4828-8f4b-57cafaa7aca6','4ce14067-4114-485d-a250-9ca78841a9bb'),
('581a5457-e52c-4ae7-9089-421141225c4e','0728fea4-21c4-45f1-b053-5d3e218e2474'),
('5991e7a4-8035-4c05-9897-d85a5df920ab','3d5c8220-f4e3-11e4-8452-080027715141'),
('5c09ecb1-b488-4ebe-818f-dfe10bb2ecdc','2274adf8-4a3f-490d-a6b9-517b9b760d34'),
('5ce3f643-542f-4e83-86ff-ccb2d3404b6b','4f15fe72-4417-4f74-9cd2-d0e3fe25d861'),
('5d3d0c48-a441-4247-af71-95d4e6df0ad2','6d42cf44-089e-4379-8f6e-3f630a4ab788'),
('5de7e7ac-7877-4276-996d-548c396bb0ea','c73e9580-00a6-499b-989e-12a0bf3f817e'),
('5ec013ec-0c23-445f-a29f-82f3253a9ec9','d9b0fd86-6a74-4b8d-8ca8-c22ed3a1c9bc'),
('5f6c5c3d-2a3a-4676-a74e-675e76360805','c9452b6b-2dd7-496f-a711-9a4c4888592b'),
('607ce028-8577-40b8-b936-db999891623f','49f6d003-ab75-476e-a2a5-78079a57b10f'),
('67cf1b1a-fad4-43e2-96d5-4a393242b0a4','4d12ac95-3b31-40dd-9c1f-515b1f20ce69'),
('6eafd94d-b571-4823-a57e-0d05f2897232','a7c464a4-e97d-463f-9efa-192bf9434bdf'),
('704cbcf8-b7af-428c-b21e-842838a751e0','e799023a-dea8-4102-9f7e-2d7becadca24'),
('709be68e-fdd6-49e5-814f-5284b567db0c','df66c33a-3a2f-408e-a84a-630ec0016a81'),
('7525c4cb-91b9-44b0-a614-4282be3eb540','d9195758-d22f-4bd5-aefa-570565a6052d'),
('75b9346b-e6ba-4dbb-9a55-fae4b7c247d9','4f0ddfa6-83ac-48c2-9af5-b89eb58f85e3'),
('763165ce-d0b6-4b01-a505-b43d1cd4668c','56700e77-7c3b-4640-94bc-607dc057976b'),
('777e3c48-2f4c-4c1c-b10e-564c77638e7f','d090ee9d-026b-40dd-8b4b-35ba999d551d'),
('7810f239-3f74-4bc7-91b3-b200d9474531','4267839c-a975-4ee8-bf44-0d8161d2866f'),
('78b7cf51-9dfa-4b1b-9d1a-ff72e51f0f00','9653fec2-3841-4793-86a1-d6847c00b370'),
('7953cbb0-937f-4bce-901d-3e1d5f211fb6','6383e32b-76cd-46d7-aa2c-8bc60ca9374d'),
('7ca00e0d-e1d3-4052-ac9e-84bb5d79f874','4f61afbd-ac82-4c4a-839e-68cfa4bafa5f'),
('7ca6598a-3a72-4992-b28e-cd675f3c7f5a','90c5fc40-8130-4520-9f70-08db4954b6f1'),
('8227e1c0-1b75-44a2-9ad4-0fb8c4754b1c','e29dfbb5-ea7f-43f1-a31d-77eae5bc43a6'),
('8a5e2a99-28c9-49ed-b3c1-46f7e2fd74fe','f3f480a1-4c51-44c6-83d1-a57d14255b07'),
('8f8de2ed-28d9-41b9-9f05-8b31d20c8e19','99b19592-0c88-4adf-9d2f-ad71214c4a67'),
('95525cee-f8ec-47e1-8a1f-d84c6619c8f9','68dec598-26c6-453a-91f6-93e6ccfcacbc'),
('95fb60ce-31b0-48a0-802c-5638af599de8','f00eb5d9-7fee-46f1-bcd7-a4383ee44049'),
('97af1879-1ee0-4fa9-85f6-08ec87d65654','aec6526b-fffc-45c4-b962-c219588a6474'),
('98a8d2d7-b706-498f-933c-29569badad95','a225dd59-6855-4cd5-af2a-abe4fe10bf95'),
('9980620d-5e74-401b-8b74-28d233b3a397','1d1f9463-6f2c-4618-8029-f6a465ce11f9'),
('9ab267fc-aafd-4ea7-b2bf-aa1ad9ad44cc','3d5c8621-f4e3-11e4-8452-080027715141'),
('9af2bd4f-81a9-4d2f-939b-fd2ba8ef54d7','cb503551-63cf-4f39-8f34-152f7aeb3b05'),
('9c354c53-01d1-4e9f-924e-319b1d2de25b','aeca6a30-e891-4f20-825d-69b674e89900'),
('9d5b3ec5-7c5e-479f-9142-ca89ddf4b9f8','43c6b41e-707b-4fde-b8b7-48ebf1baf649'),
('9ed9f019-ed1b-40be-ad40-67017be254a0','238740d9-d72b-4fa9-a428-fd6ae8abef21'),
('9f1315a0-886e-482f-b832-ea35db86e5f5','3d5c867c-f4e3-11e4-8452-080027715141'),
('a4b5bd53-e0f6-4070-9722-8d4b9ff991a0','cb6bd925-50d3-4a6b-a915-59e7aa265633'),
('af121652-96ce-4419-b9e1-4cfa6629ba81','f351aa9e-53eb-4aa8-b986-cb8655ccc2f8'),
('b30c7a17-7cd8-4446-8844-2e74f6c59b4c','4eb00219-9eab-470b-babc-ee7fa30aeaee'),
('b4abe6c0-3094-4a07-bf15-3d6c6fedc9ee','c7eb3919-0309-4b2f-b4d6-5c8ebe9fe844'),
('b58c03de-9435-4fd1-bb6f-e0a801d19f1c','5ff3fbfc-6eb1-46f7-baef-b0e1a16a1d23'),
('cb7d2ba2-28a7-46ee-aced-f21bd860a502','f3df8ad1-fb66-4d7b-b9c3-12412daf094c'),
('cbfa19f1-a9b6-40f8-8477-84c6ace1ae61','f18392e2-fc82-4210-bee3-07b91759566a'),
('cbffd336-da49-4bb5-8f1c-da067af4df0f','6d4946c0-cef0-477d-b8b0-efd18aee55f2'),
('ce8693ef-81e9-4c3e-98d0-0d48cf3c1c1d','62be6819-9a6c-4f12-a1f7-578896825df8'),
('d577937d-aadd-46ab-b430-b596fe3576c5','6161b633-8ead-411d-a9f9-45eec2795bae'),
('d9bd1a52-adeb-483c-b2b6-919be0d920c2','baa87545-66d2-41db-a61b-c33d5f2c7cab'),
('da1feefa-7aaf-4c2c-b601-bbd3512494c1','6b611107-de84-462b-9b78-3057fe7e5b44'),
('ddb019c3-6d3b-4971-ab6f-e469ae9597b5','fa0f360f-a8ea-4048-b301-ee57a191c840'),
('e56cddee-d6fe-4f50-ba35-7af834b54160','66715537-9d74-4a55-ba20-e9c28d10aed6'),
('ea932d5d-98d2-43ec-9dac-369f62086545','f215f6cb-3d72-42c2-ac93-cf30b4edee5e'),
('f128e2c5-71cd-4a70-b00f-d72d0b66d042','bf047896-5656-49dc-99d0-c8aa49fa19e5'),
('f1539b91-8f68-4434-925b-b0b792c44de7','3d5c82e0-f4e3-11e4-8452-080027715141'),
('f9fc7216-b2aa-43af-a381-b005890214d3','ff4083ed-7e18-47a7-ba17-a712a59d613e'),
('fa86d0d6-9718-43e5-be4e-17f31334653d','16c21580-db7c-4eff-9492-6beb4ae33cc4'),
('fea6159d-7662-429e-9e0a-73b7a74ed9ff','f0036b47-6f20-48d2-a833-168754f2e160');

/*Table structure for table `plugin_coreservices_servertypes` */

DROP TABLE IF EXISTS `plugin_coreservices_servertypes`;

CREATE TABLE `plugin_coreservices_servertypes` (
  `ID` int(11) NOT NULL,
  `ServerType` varchar(255) NOT NULL,
  `Enabled` tinyint(1) NOT NULL DEFAULT '0',
  `ReportCategory` int(11) DEFAULT '7',
  `TicketCategory` int(11) DEFAULT '123',
  `AlertLevel` int(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `plugin_coreservices_servertypes` */

insert  into `plugin_coreservices_servertypes`(`ID`,`ServerType`,`Enabled`,`ReportCategory`,`TicketCategory`,`AlertLevel`) values 
(0,'DomainController',1,7,123,-1),
(1,'DNS',1,7,123,-1),
(2,'DHCP',1,7,123,-1),
(3,'File',1,7,123,-1),
(4,'HyperV',1,7,123,-1),
(5,'Print',1,7,123,-1),
(6,'Authentication',1,7,123,-1),
(7,'FTP',1,7,123,-1),
(8,'NTP',1,7,123,-1),
(9,'RemoteAccess',1,7,123,-1),
(10,'OSXFirewall',1,7,123,-1),
(11,'OSXVPN',1,7,123,-1);

/*Table structure for table `plugin_coreservices_settings` */

DROP TABLE IF EXISTS `plugin_coreservices_settings`;

CREATE TABLE `plugin_coreservices_settings` (
  `SettingName` varchar(255) NOT NULL,
  `Value` int(11) NOT NULL,
  PRIMARY KEY (`SettingName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `plugin_coreservices_settings` */

insert  into `plugin_coreservices_settings`(`SettingName`,`Value`) values 
('AlertLevel',-1),
('DbVersion',4),
('FirstSave',0),
('IsSaving',0),
('IsSyncing',0),
('ReportCategory',7),
('TicketCategory',123),
('UseEdfs',1);

/*Table structure for table `plugin_database_appliedmonitors` */

DROP TABLE IF EXISTS `plugin_database_appliedmonitors`;

CREATE TABLE `plugin_database_appliedmonitors` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(200) NOT NULL,
  `CheckAction` int(11) NOT NULL,
  `AlertAction` int(11) NOT NULL,
  `AlertMessage` text NOT NULL,
  `ContactID` int(11) NOT NULL,
  `Interval` int(11) NOT NULL,
  `Where` varchar(255) NOT NULL,
  `What` varchar(255) NOT NULL,
  `DataOut` text NOT NULL,
  `Comparor` int(11) NOT NULL,
  `DataIn` varchar(200) NOT NULL,
  `IDField` varchar(500) NOT NULL,
  `AlertStyle` int(11) NOT NULL DEFAULT '0',
  `Changed` int(11) NOT NULL,
  `DataCollector` varchar(100) NOT NULL,
  `Category` int(11) NOT NULL,
  `TicketCategory` int(11) NOT NULL,
  `ScriptTarget` int(11) DEFAULT '1',
  `GUID` char(36) NOT NULL,
  `ServerType` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ContactID` (`ContactID`),
  KEY `Name` (`Name`),
  KEY `ServerType` (`ServerType`)
) ENGINE=InnoDB AUTO_INCREMENT=988 DEFAULT CHARSET=utf8;

/*Data for the table `plugin_database_appliedmonitors` */

insert  into `plugin_database_appliedmonitors`(`ID`,`Name`,`CheckAction`,`AlertAction`,`AlertMessage`,`ContactID`,`Interval`,`Where`,`What`,`DataOut`,`Comparor`,`DataIn`,`IDField`,`AlertStyle`,`Changed`,`DataCollector`,`Category`,`TicketCategory`,`ScriptTarget`,`GUID`,`ServerType`) values 
(432,'SVC-MySQL',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','MySQL',1,'1','',1,0,'',5,134,0,'20625837-41C6-43C0-9BAD-4A238A33B674',1),
(531,'SVC-MSSQLSERVER',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','MSSQLSERVER',1,'1','',1,0,'',5,134,0,'20D9179C-7B0D-4E5A-8672-30647292DEB7',0),
(532,'SVC-MSSQLSERVER',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','MSSQLSERVER',1,'1','',1,0,'',5,134,0,'E42E3D00-E5EE-4A34-BF8F-B1D9D0C06D84',0),
(533,'SVC-MSSQLSERVER',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','MSSQLSERVER',1,'1','',1,0,'',5,134,0,'8437C087-0BE6-4E3E-922B-B0D4A4066007',0),
(542,'SVC-SQLBrowser',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','SQLBrowser',1,'1','',1,0,'',5,134,0,'EF404D4F-E066-4647-96F0-18CB931F30DD',0),
(543,'SVC-SQLWriter',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','SQLWriter',1,'1','',1,0,'',5,134,0,'4A0C8AFB-3B9B-4C6E-91EF-DE7E294E34D8',0),
(544,'SVC-SQLBrowser',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','SQLBrowser',1,'1','',1,0,'',5,134,0,'E089262F-1DD7-491B-ABA9-4E807B9B1CAC',0),
(545,'SVC-SQLWriter',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','SQLWriter',1,'1','',1,0,'',5,134,0,'CA25447F-9BBA-4AFA-9966-C7A05671D313',0),
(546,'SVC-SQLBrowser',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','SQLBrowser',1,'1','',1,0,'',5,134,0,'A6A8EB40-36B2-4F85-B1BB-4A95D28BD6AD',0),
(547,'SVC-SQLWriter',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','SQLWriter',1,'1','',1,0,'',5,134,0,'FB41E837-E4E8-4334-BA74-45F892B33F37',0),
(625,'SVC-ReportServer',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','ReportServer',1,'1','',1,0,'',5,134,0,'883D2BD0-814D-41E4-A983-D689D9C96C2F',0),
(626,'Perf - Active Temp Tables',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','SQLServer:General Statistics!!!Active Temp Tables!!!',6,'','',1,0,'Collect,Collect',7,145,0,'0BA37A74-321F-42E4-98D5-844240504CAD',0),
(627,'Perf - Active Temp Tables',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','SQLServer:General Statistics!!!Active Temp Tables!!!',6,'','',1,0,'Collect,Collect',7,145,0,'2FFF869E-8C59-4334-89EB-D8A840F00D50',0),
(628,'Perf - Connection Reset/sec',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','SQLServer:General Statistics!!!Connection Reset/sec!!!',6,'','',1,0,'Collect,Collect',7,145,0,'5DEEE52A-6732-476D-A341-6B9DEB4513DA',0),
(629,'Perf - Connection Reset/sec',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','SQLServer:General Statistics!!!Connection Reset/sec!!!',6,'','',1,0,'Collect,Collect',7,145,0,'F650E7D9-7A08-4B07-B328-9178785AE782',0),
(630,'Perf - Logical Connections',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','SQLServer:General Statistics!!!Logical Connections!!!',6,'','',1,0,'Collect,Collect',7,145,0,'6E469FD2-122D-49EA-AFD1-C46AC80C637A',0),
(631,'Perf - Logical Connections',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','SQLServer:General Statistics!!!Logical Connections!!!',6,'','',1,0,'Collect,Collect',7,145,0,'1658FF50-B082-41AD-A0E6-72586D9496F7',0),
(632,'Perf - Mars Deadlocks',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','SQLServer:General Statistics!!!Mars Deadlocks!!!',6,'','',1,0,'Collect,Collect',7,145,0,'8FED2A3F-329B-4BD5-9DE8-5C3CD4E69C70',0),
(633,'Perf - Mars Deadlocks',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','SQLServer:General Statistics!!!Mars Deadlocks!!!',6,'','',1,0,'Collect,Collect',7,145,0,'ACD9FECC-7FE9-4D0E-A8DD-D465310993E5',0),
(634,'Perf - Processes blocked',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','SQLServer:General Statistics!!!Processes blocked!!!',6,'','',1,0,'Collect,Collect',7,145,0,'1BB77070-C398-42B3-B37D-2D878B7E1A27',0),
(635,'Perf - Processes blocked',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','SQLServer:General Statistics!!!Processes blocked!!!',6,'','',1,0,'Collect,Collect',7,145,0,'08C0F95B-0E90-47F1-9930-625C90CE13BD',0),
(636,'Perf - Transactions',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','SQLServer:General Statistics!!!Transactions!!!',6,'','',1,0,'Collect,Collect',7,145,0,'A47D7D68-D718-4A9A-A117-4D21BD914CF2',0),
(637,'Perf - Transactions',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','SQLServer:General Statistics!!!Transactions!!!',6,'','',1,0,'Collect,Collect',7,145,0,'2A8E7699-B0A7-46FA-A6D6-83ADD15F0A9D',0),
(638,'Perf - User Connections',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','SQLServer:General Statistics!!!User Connections!!!',6,'','',1,0,'Collect,Collect',7,145,0,'AA2B30B8-43C0-4026-B9A2-5BDFF03A7693',0),
(639,'Perf - User Connections',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','SQLServer:General Statistics!!!User Connections!!!',6,'','',1,0,'Collect,Collect',7,145,0,'667C4DF8-FC2F-46CC-AB8B-84114E4959EF',0),
(646,'SVC-MSSQLServerOLAPService',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','MSSQLServerOLAPService',1,'1','',1,0,'',5,134,0,'98A29D56-5394-47F2-92DB-6DD758158CDF',0),
(647,'SVC-MsDtsServer100',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','MsDtsServer100',1,'1','',1,0,'',5,134,0,'FBA1EBF4-6F5C-4E55-A2D4-67556AC6A659',0),
(648,'SVC-MSSQLServerOLAPService',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','MSSQLServerOLAPService',1,'1','',1,0,'',5,134,0,'082E0D47-1D11-4D66-8514-FD0861D14736',0),
(649,'SVC-MsDtsServer100',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','MsDtsServer100',1,'1','',1,0,'',5,134,0,'00402F78-AD7D-450F-97C3-C1D3DA9F62CC',0),
(836,'SVC-mysqld',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','mysqld',1,'1','',1,0,'',5,134,0,'6BB3C0A1-3E53-4E8E-81FB-CB5FBB0C5219',1),
(837,'SVC-postgresql',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','postgresql',1,'1','',1,0,'',5,134,0,'F084CBEF-A751-46C3-AA53-4A672B55DDDC',2),
(888,'Perf - Mars Deadlocks',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','SQLServer:General Statistics!!!Mars Deadlocks!!!',6,'','',1,0,'Collect,Collect',7,145,0,'D17FC296-0322-4811-96E1-E045A4451BC5',0),
(895,'SVC-ReportServer',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','ReportServer',1,'1','',1,0,'',5,134,0,'FB1C01B2-7848-4ADC-A595-16CD8ADFD72B',0),
(898,'SVC-MSSQLSERVER',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','MSSQLSERVER',1,'1','',1,0,'',5,134,0,'6A212949-9113-4505-BA36-B4A1C12F27B0',0),
(910,'Perf - Active Temp Tables',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','SQLServer:General Statistics!!!Active Temp Tables!!!',6,'','',1,0,'Collect,Collect',7,145,0,'8A88339A-3227-41A5-AACC-78C1D3CFB1AC',0),
(912,'SVC-ReportServer',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','ReportServer',1,'1','',1,0,'',5,134,0,'5036204B-B9AE-4D1E-9C0C-6509F4C3E031',0),
(914,'SVC-MSSQLSERVER',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','MSSQLSERVER',1,'1','',1,0,'',5,134,0,'74618E34-E7FF-4EFD-A6DF-5FEFFB93F862',0),
(915,'Perf - Transactions',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','SQLServer:General Statistics!!!Transactions!!!',6,'','',1,0,'Collect,Collect',7,145,0,'EC13582D-D9D6-4F62-B1AB-25F63F7E7DBB',0),
(917,'SVC-SQLBrowser',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','SQLBrowser',1,'1','',1,0,'',5,134,0,'B459BF51-29EC-43D7-AE49-BD4CE39B7D41',0),
(923,'Perf - Processes blocked',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','SQLServer:General Statistics!!!Processes blocked!!!',6,'','',1,0,'Collect,Collect',7,145,0,'7F6D0DD2-B421-4623-8615-BBE57F527783',0),
(929,'SVC-MsDtsServer120',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','MsDtsServer120',1,'1','',1,0,'',5,134,0,'D8B6A378-B7AA-48C1-9DC8-EBE292318A08',0),
(930,'Perf - Connection Reset/sec',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','SQLServer:General Statistics!!!Connection Reset/sec!!!',6,'','',1,0,'Collect,Collect',7,145,0,'4276E75E-A914-404D-9F15-68F1A6C918A5',0),
(936,'SVC-SQLWriter',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','SQLWriter',1,'1','',1,0,'',5,134,0,'F702C75B-922C-4EFA-BF6B-166E45D88D7B',0),
(939,'SVC-MsDtsServer110',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','MsDtsServer110',1,'1','',1,0,'',5,134,0,'85AE0A32-9238-4119-8130-6A25634571CA',0),
(942,'Perf - Active Temp Tables',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','SQLServer:General Statistics!!!Active Temp Tables!!!',6,'','',1,0,'Collect,Collect',7,145,0,'BE742266-4477-43AC-9A5F-F4CE01293B26',0),
(943,'Perf - Mars Deadlocks',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','SQLServer:General Statistics!!!Mars Deadlocks!!!',6,'','',1,0,'Collect,Collect',7,145,0,'318046E6-076C-4315-AAC5-1FD1498CA486',0),
(948,'SVC-MSSQLServerOLAPService',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','MSSQLServerOLAPService',1,'1','',1,0,'',5,134,0,'2159D9F0-9039-4CDC-90DF-336630A44BD3',0),
(951,'SVC-SQLWriter',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','SQLWriter',1,'1','',1,0,'',5,134,0,'84764677-4F73-4E03-AA7C-67DF30B91F2F',0),
(956,'Perf - User Connections',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','SQLServer:General Statistics!!!User Connections!!!',6,'','',1,0,'Collect,Collect',7,145,0,'6C09CB6D-74B6-430F-A643-6C067C9709BB',0),
(959,'SVC-SQLBrowser',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','SQLBrowser',1,'1','',1,0,'',5,134,0,'A32B3C2E-F0A0-4EEF-A0C1-F1209F7081EE',0),
(960,'Perf - Connection Reset/sec',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','SQLServer:General Statistics!!!Connection Reset/sec!!!',6,'','',1,0,'Collect,Collect',7,145,0,'49B12277-5162-4D34-8C05-85517AA9A440',0),
(965,'Perf - Processes blocked',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','SQLServer:General Statistics!!!Processes blocked!!!',6,'','',1,0,'Collect,Collect',7,145,0,'F6B89CD3-C870-49BA-99FE-970613F39509',0),
(967,'SVC-MSSQLServerOLAPService',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','MSSQLServerOLAPService',1,'1','',1,0,'',5,134,0,'076E2688-0496-4AE2-99F3-589626D96372',0),
(968,'Perf - User Connections',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','SQLServer:General Statistics!!!User Connections!!!',6,'','',1,0,'Collect,Collect',7,145,0,'D6E51A22-7DBE-43D2-B379-A45F88C6B3C0',0),
(969,'Perf - Logical Connections',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','SQLServer:General Statistics!!!Logical Connections!!!',6,'','',1,0,'Collect,Collect',7,145,0,'0213BEC1-6C94-40B9-AE22-B0B584A60A69',0),
(971,'Perf - Transactions',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','SQLServer:General Statistics!!!Transactions!!!',6,'','',1,0,'Collect,Collect',7,145,0,'970B8BAA-FC1B-4C1A-9147-27067980CE85',0),
(973,'Perf - Logical Connections',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','SQLServer:General Statistics!!!Logical Connections!!!',6,'','',1,0,'Collect,Collect',7,145,0,'4577B28F-E6D5-423A-B357-14FB84B8B927',0),
(974,'SVC-ReportServer',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','ReportServer',1,'1','',1,0,'',0,175,0,'296FFF6F-B981-415E-8565-F652D632A1C2',0),
(975,'SVC-SQLWriter',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','SQLWriter',1,'1','',1,0,'',0,175,0,'C7EF4005-2EED-4651-A188-A6E5F2AD4419',0),
(976,'SVC-SQLBrowser',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','SQLBrowser',1,'1','',1,0,'',0,175,0,'E0E6187C-1264-4C19-89EA-0845D0157C6C',0),
(977,'SVC-MSSQLServerOLAPService',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','MSSQLServerOLAPService',1,'1','',1,0,'',0,175,0,'8BE897CA-9E6E-4E75-8527-2D9B4943A6E5',0),
(978,'SVC-MsDtsServer130',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','MsDtsServer130',1,'1','',1,0,'',0,175,0,'BA2552DF-9762-43ED-9465-92B828C3DD5E',0),
(979,'SVC-SQLServerAgent',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','SQLServerAgent',1,'1','',1,0,'',0,175,0,'06D17886-5CAD-4252-A4B6-9443E0A1275A',0),
(980,'SVC-MSSQLSERVER',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','MSSQLSERVER',1,'1','',1,0,'',0,175,0,'C44D3F15-89EA-4BB5-A660-0CA887D5C7F1',0),
(981,'Perf - Active Temp Tables',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','SQLServer:General Statistics!!!Active Temp Tables!!!',6,'','',1,0,'Collect,Collect',0,175,0,'837386F9-69DF-4FC8-8EC3-4FD631DDAFA1',0),
(982,'Perf - Connection Reset/sec',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','SQLServer:General Statistics!!!Connection Reset/sec!!!',6,'','',1,0,'Collect,Collect',0,175,0,'BD298264-C9B4-4D97-805A-FB2429F48E9E',0),
(983,'Perf - Logical Connections',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','SQLServer:General Statistics!!!Logical Connections!!!',6,'','',1,0,'Collect,Collect',0,175,0,'CB07B53E-B51D-4E54-9A4A-61AFE8D66998',0),
(984,'Perf - Mars Deadlocks',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','SQLServer:General Statistics!!!Mars Deadlocks!!!',6,'','',1,0,'Collect,Collect',0,175,0,'388E7FAE-3914-4356-B128-4CF066FE50C7',0),
(985,'Perf - Processes blocked',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','SQLServer:General Statistics!!!Processes blocked!!!',6,'','',1,0,'Collect,Collect',0,175,0,'B90DCD63-F280-47F8-BF55-6019EEECBFFD',0),
(986,'Perf - Transactions',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','SQLServer:General Statistics!!!Transactions!!!',6,'','',1,0,'Collect,Collect',0,175,0,'99499660-9AFB-4E0B-910B-2C6DFB0E076B',0),
(987,'Perf - User Connections',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','SQLServer:General Statistics!!!User Connections!!!',6,'','',1,0,'Collect,Collect',0,175,0,'06E6F6A6-36E1-4773-B0A4-1724A2DD166B',0);

/*Table structure for table `plugin_database_appliesto` */

DROP TABLE IF EXISTS `plugin_database_appliesto`;

CREATE TABLE `plugin_database_appliesto` (
  `MonitorGUID` char(36) NOT NULL,
  `Versions` varchar(100) NOT NULL DEFAULT '',
  `Roles` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`MonitorGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `plugin_database_appliesto` */

insert  into `plugin_database_appliesto`(`MonitorGUID`,`Versions`,`Roles`) values 
('00402F78-AD7D-450F-97C3-C1D3DA9F62CC','MS SQL 2008 Servers','MsDtsServer100'),
('0213BEC1-6C94-40B9-AE22-B0B584A60A69','MS SQL 2012 Servers',''),
('06D17886-5CAD-4252-A4B6-9443E0A1275A','MS SQL 2016 Servers','SQLServerAgent'),
('06E6F6A6-36E1-4773-B0A4-1724A2DD166B','MS SQL 2016 Servers',''),
('076E2688-0496-4AE2-99F3-589626D96372','MS SQL 2014 Servers','Analysis'),
('082E0D47-1D11-4D66-8514-FD0861D14736','MS SQL 2008 Servers','Analysis'),
('08C0F95B-0E90-47F1-9930-625C90CE13BD','MS SQL 2008 Servers',''),
('0BA37A74-321F-42E4-98D5-844240504CAD','MS SQL 2008 R2 Servers',''),
('1658FF50-B082-41AD-A0E6-72586D9496F7','MS SQL 2008 Servers',''),
('1BB77070-C398-42B3-B37D-2D878B7E1A27','MS SQL 2008 R2 Servers',''),
('20625837-41C6-43C0-9BAD-4A238A33B674','Windows MySQL Servers',''),
('20D9179C-7B0D-4E5A-8672-30647292DEB7','MS SQL 2008 R2 Servers',''),
('2159D9F0-9039-4CDC-90DF-336630A44BD3','MS SQL 2012 Servers','Analysis'),
('296FFF6F-B981-415E-8565-F652D632A1C2','MS SQL 2016 Servers','Reporting'),
('2A8E7699-B0A7-46FA-A6D6-83ADD15F0A9D','MS SQL 2008 Servers',''),
('2FFF869E-8C59-4334-89EB-D8A840F00D50','MS SQL 2008 Servers',''),
('318046E6-076C-4315-AAC5-1FD1498CA486','MS SQL 2012 Servers',''),
('388E7FAE-3914-4356-B128-4CF066FE50C7','MS SQL 2016 Servers',''),
('4276E75E-A914-404D-9F15-68F1A6C918A5','MS SQL 2014 Servers',''),
('4577B28F-E6D5-423A-B357-14FB84B8B927','MS SQL 2014 Servers',''),
('49B12277-5162-4D34-8C05-85517AA9A440','MS SQL 2012 Servers',''),
('4A0C8AFB-3B9B-4C6E-91EF-DE7E294E34D8','MS SQL 2005 Servers','Writer'),
('5036204B-B9AE-4D1E-9C0C-6509F4C3E031','MS SQL 2012 Servers','Reporting'),
('5DEEE52A-6732-476D-A341-6B9DEB4513DA','MS SQL 2008 R2 Servers',''),
('667C4DF8-FC2F-46CC-AB8B-84114E4959EF','MS SQL 2008 Servers',''),
('6A212949-9113-4505-BA36-B4A1C12F27B0','MS SQL 2014 Servers',''),
('6BB3C0A1-3E53-4E8E-81FB-CB5FBB0C5219','Linux MySQL Servers',''),
('6C09CB6D-74B6-430F-A643-6C067C9709BB','MS SQL 2012 Servers',''),
('6E469FD2-122D-49EA-AFD1-C46AC80C637A','MS SQL 2008 R2 Servers',''),
('74618E34-E7FF-4EFD-A6DF-5FEFFB93F862','MS SQL 2012 Servers',''),
('7F6D0DD2-B421-4623-8615-BBE57F527783','MS SQL 2014 Servers',''),
('837386F9-69DF-4FC8-8EC3-4FD631DDAFA1','MS SQL 2016 Servers',''),
('8437C087-0BE6-4E3E-922B-B0D4A4066007','MS SQL 2008 Servers',''),
('84764677-4F73-4E03-AA7C-67DF30B91F2F','MS SQL 2012 Servers','Writer'),
('85AE0A32-9238-4119-8130-6A25634571CA','MS SQL 2012 Servers','MsDtsServer110'),
('883D2BD0-814D-41E4-A983-D689D9C96C2F','MS SQL 2008 R2 Servers','Reporting'),
('8A88339A-3227-41A5-AACC-78C1D3CFB1AC','MS SQL 2012 Servers',''),
('8BE897CA-9E6E-4E75-8527-2D9B4943A6E5','MS SQL 2016 Servers','Analysis'),
('8FED2A3F-329B-4BD5-9DE8-5C3CD4E69C70','MS SQL 2008 R2 Servers',''),
('970B8BAA-FC1B-4C1A-9147-27067980CE85','MS SQL 2014 Servers',''),
('98A29D56-5394-47F2-92DB-6DD758158CDF','MS SQL 2008 R2 Servers','Analysis'),
('99499660-9AFB-4E0B-910B-2C6DFB0E076B','MS SQL 2016 Servers',''),
('A32B3C2E-F0A0-4EEF-A0C1-F1209F7081EE','MS SQL 2012 Servers','Browser'),
('A47D7D68-D718-4A9A-A117-4D21BD914CF2','MS SQL 2008 R2 Servers',''),
('A6A8EB40-36B2-4F85-B1BB-4A95D28BD6AD','MS SQL 2008 R2 Servers','Browser'),
('AA2B30B8-43C0-4026-B9A2-5BDFF03A7693','MS SQL 2008 R2 Servers',''),
('ACD9FECC-7FE9-4D0E-A8DD-D465310993E5','MS SQL 2008 Servers',''),
('B459BF51-29EC-43D7-AE49-BD4CE39B7D41','MS SQL 2014 Servers','Browser'),
('B90DCD63-F280-47F8-BF55-6019EEECBFFD','MS SQL 2016 Servers',''),
('BA2552DF-9762-43ED-9465-92B828C3DD5E','MS SQL 2016 Servers','MsDtsServer130'),
('BD298264-C9B4-4D97-805A-FB2429F48E9E','MS SQL 2016 Servers',''),
('BE742266-4477-43AC-9A5F-F4CE01293B26','MS SQL 2014 Servers',''),
('C44D3F15-89EA-4BB5-A660-0CA887D5C7F1','MS SQL 2016 Servers',''),
('C7EF4005-2EED-4651-A188-A6E5F2AD4419','MS SQL 2016 Servers','Writer'),
('CA25447F-9BBA-4AFA-9966-C7A05671D313','MS SQL 2008 Servers','Writer'),
('CB07B53E-B51D-4E54-9A4A-61AFE8D66998','MS SQL 2016 Servers',''),
('D17FC296-0322-4811-96E1-E045A4451BC5','MS SQL 2014 Servers',''),
('D6E51A22-7DBE-43D2-B379-A45F88C6B3C0','MS SQL 2014 Servers',''),
('D8B6A378-B7AA-48C1-9DC8-EBE292318A08','MS SQL 2014 Servers','MsDtsServer120'),
('E089262F-1DD7-491B-ABA9-4E807B9B1CAC','MS SQL 2008 Servers','Browser'),
('E0E6187C-1264-4C19-89EA-0845D0157C6C','MS SQL 2016 Servers','Browser'),
('E42E3D00-E5EE-4A34-BF8F-B1D9D0C06D84','MS SQL 2005 Servers',''),
('EC13582D-D9D6-4F62-B1AB-25F63F7E7DBB','MS SQL 2012 Servers',''),
('EF404D4F-E066-4647-96F0-18CB931F30DD','MS SQL 2005 Servers','Browser'),
('F084CBEF-A751-46C3-AA53-4A672B55DDDC','Linux PostgreSQL Servers',''),
('F650E7D9-7A08-4B07-B328-9178785AE782','MS SQL 2008 Servers',''),
('F6B89CD3-C870-49BA-99FE-970613F39509','MS SQL 2012 Servers',''),
('F702C75B-922C-4EFA-BF6B-166E45D88D7B','MS SQL 2014 Servers','Writer'),
('FB1C01B2-7848-4ADC-A595-16CD8ADFD72B','MS SQL 2014 Servers','Reporting'),
('FB41E837-E4E8-4334-BA74-45F892B33F37','MS SQL 2008 R2 Servers','Writer'),
('FBA1EBF4-6F5C-4E55-A2D4-67556AC6A659','MS SQL 2008 R2 Servers','MsDtsServer100');

/*Table structure for table `plugin_database_deprecatedgroupagents` */

DROP TABLE IF EXISTS `plugin_database_deprecatedgroupagents`;

CREATE TABLE `plugin_database_deprecatedgroupagents` (
  `AgentID` int(11) NOT NULL AUTO_INCREMENT,
  `GroupID` int(11) NOT NULL,
  `SearchID` int(11) NOT NULL,
  `Name` varchar(200) NOT NULL,
  `CheckAction` int(11) NOT NULL,
  `AlertAction` int(11) NOT NULL,
  `AlertMessage` text NOT NULL,
  `ContactID` int(11) NOT NULL,
  `interval` int(11) NOT NULL,
  `Where` varchar(255) NOT NULL,
  `What` varchar(255) NOT NULL,
  `DataOut` text NOT NULL,
  `Comparor` int(11) NOT NULL,
  `DataIn` varchar(8000) NOT NULL,
  `IDField` varchar(500) NOT NULL,
  `AlertStyle` int(11) NOT NULL DEFAULT '0',
  `ScriptID` int(11) NOT NULL,
  `DataCollector` varchar(100) NOT NULL,
  `Category` int(11) NOT NULL,
  `TicketCategory` int(11) NOT NULL,
  `ScriptTarget` int(11) DEFAULT '1',
  `GUID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`AgentID`),
  KEY `ContactID` (`ContactID`),
  KEY `Name` (`Name`),
  KEY `GroupID` (`GroupID`),
  KEY `SearchID` (`SearchID`)
) ENGINE=InnoDB AUTO_INCREMENT=794 DEFAULT CHARSET=utf8;

/*Data for the table `plugin_database_deprecatedgroupagents` */

insert  into `plugin_database_deprecatedgroupagents`(`AgentID`,`GroupID`,`SearchID`,`Name`,`CheckAction`,`AlertAction`,`AlertMessage`,`ContactID`,`interval`,`Where`,`What`,`DataOut`,`Comparor`,`DataIn`,`IDField`,`AlertStyle`,`ScriptID`,`DataCollector`,`Category`,`TicketCategory`,`ScriptTarget`,`GUID`) values 
(427,835,557,'SVC-MySQL55',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',1,60,'127.0.0.1','2','MySQL55',1,'1','',1,0,'',5,147,1,'90921819-458e-498b-948a-c6dfa28b8680'),
(432,835,558,'SVC-MySQL',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',1,60,'127.0.0.1','2','MySQL',1,'1','',1,0,'',5,134,1,'90851949-adf3-4b02-9102-212bfbdaee61'),
(531,834,568,'SVC-MSSQLSERVER',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',0,60,'127.0.0.1','2','MSSQLSERVER',1,'1','',1,0,'',5,134,1,'2edbe0b5-c416-480a-a792-1a52f8cff8da'),
(532,832,568,'SVC-MSSQLSERVER',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',0,60,'127.0.0.1','2','MSSQLSERVER',1,'1','',1,0,'',5,134,1,'d9366ecf-4de2-454c-a7a4-8c1ec430401e'),
(533,833,568,'SVC-MSSQLSERVER',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',0,60,'127.0.0.1','2','MSSQLSERVER',1,'1','',1,0,'',5,134,1,'b8744b34-d08f-4f9b-be1f-052ded6b661d'),
(542,832,569,'SVC-SQLBrowser',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',0,60,'127.0.0.1','2','SQLBrowser',1,'1','',1,0,'',5,134,1,'46a5a7bf-2a33-44c1-a314-defe7af7d015'),
(543,832,549,'SVC-SQLWriter',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',0,60,'127.0.0.1','2','SQLWriter',1,'1','',1,0,'',5,134,1,'5f179abd-20e7-4ac8-91ba-7faccbcfb347'),
(544,833,569,'SVC-SQLBrowser',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',0,60,'127.0.0.1','2','SQLBrowser',1,'1','',1,0,'',5,134,1,'32223b4d-0bb1-4243-b52a-fbfe2ecbbf5c'),
(545,833,549,'SVC-SQLWriter',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',0,60,'127.0.0.1','2','SQLWriter',1,'1','',1,0,'',5,134,1,'e08a294e-f209-4e80-ac5b-45961433e8e7'),
(546,834,569,'SVC-SQLBrowser',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',0,60,'127.0.0.1','2','SQLBrowser',1,'1','',1,0,'',5,134,1,'703a5877-440d-4798-8447-c845350e3b91'),
(547,834,549,'SVC-SQLWriter',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',0,60,'127.0.0.1','2','SQLWriter',1,'1','',1,0,'',5,134,1,'f24f4a2f-f118-4db4-964c-9cf6bb3a318a'),
(548,1016,463,'SVC-LabMySQL',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',1,300,'127.0.0.1','2','LabMySQL',1,'1','',1,0,'',5,113,1,'3df617de-6d16-4e9a-b411-bde97a80aca6'),
(625,834,432,'SVC-ReportServer',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',1,60,'127.0.0.1','2','ReportServer',1,'1','',1,0,'',5,134,1,'c7536267-4cf9-4623-9d8d-4eabae6b7800'),
(626,834,568,'Perf - Active Temp Tables',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.',0,60,'127.0.0.1','0','SQLServer:General Statistics!!!Active Temp Tables!!!',6,'','',1,0,'',7,145,1,'46598446-a7f0-43d5-8582-1131c08126ca'),
(627,833,568,'Perf - Active Temp Tables',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.',0,60,'127.0.0.1','0','SQLServer:General Statistics!!!Active Temp Tables!!!',6,'','',1,0,'',7,145,1,'6a53398c-ea47-4a87-b6a0-1f8fcc6b84e7'),
(628,834,568,'Perf - Connection Reset/sec',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.',0,60,'127.0.0.1','0','SQLServer:General Statistics!!!Connection Reset/sec!!!',6,'','',1,0,'',7,145,1,'940e02c4-7fef-4a9b-9e58-9fa27052c27f'),
(629,833,568,'Perf - Connection Reset/sec',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.',0,60,'127.0.0.1','0','SQLServer:General Statistics!!!Connection Reset/sec!!!',6,'','',1,0,'',7,145,1,'0d1445d3-96c5-453e-ab8f-f60fba410534'),
(630,834,568,'Perf - Logical Connections',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.',0,60,'127.0.0.1','0','SQLServer:General Statistics!!!Logical Connections!!!',6,'','',1,0,'',7,145,1,'30dbe6dc-ad38-4802-8856-4541f1fe7ee6'),
(631,833,568,'Perf - Logical Connections',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.',0,60,'127.0.0.1','0','SQLServer:General Statistics!!!Logical Connections!!!',6,'','',1,0,'',7,145,1,'6980d898-ecfe-4e02-912b-46de4d35dae4'),
(632,834,568,'Perf - Mars Deadlocks',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.',0,60,'127.0.0.1','0','SQLServer:General Statistics!!!Mars Deadlocks!!!',6,'','',1,0,'',7,145,1,'273a19ce-f895-4f37-8294-ef2eb880ff3b'),
(633,833,568,'Perf - Mars Deadlocks',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.',0,60,'127.0.0.1','0','SQLServer:General Statistics!!!Mars Deadlocks!!!',6,'','',1,0,'',7,145,1,'2e906f7b-41fb-4653-b00b-be7f9d19ac8a'),
(634,834,568,'Perf - Processes blocked',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.',0,60,'127.0.0.1','0','SQLServer:General Statistics!!!Processes blocked!!!',6,'','',1,0,'',7,145,1,'97805164-683b-4505-a7cc-913ca16c75d6'),
(635,833,568,'Perf - Processes blocked',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.',0,60,'127.0.0.1','0','SQLServer:General Statistics!!!Processes blocked!!!',6,'','',1,0,'',7,145,1,'4a131543-7ae8-4046-bbe2-03e679c64ed2'),
(636,834,568,'Perf - Transactions',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.',0,60,'127.0.0.1','0','SQLServer:General Statistics!!!Transactions!!!',6,'','',1,0,'',7,145,1,'ca189cea-ac4a-47d2-a646-5c19b90eb450'),
(637,833,568,'Perf - Transactions',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.',0,60,'127.0.0.1','0','SQLServer:General Statistics!!!Transactions!!!',6,'','',1,0,'',7,145,1,'b06eb0f0-d1b3-4b06-9d07-85fe4666f091'),
(638,834,568,'Perf - User Connections',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.',0,60,'127.0.0.1','0','SQLServer:General Statistics!!!User Connections!!!',6,'','',1,0,'',7,145,1,'12301224-b920-47e5-bd2f-aad81cbf7e93'),
(639,833,568,'Perf - User Connections',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.',0,60,'127.0.0.1','0','SQLServer:General Statistics!!!User Connections!!!',6,'','',1,0,'',7,145,1,'263ddeb5-5017-4d0e-a6a5-fe35e6df41bb'),
(646,834,429,'SVC-MSSQLServerOLAPService',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',1,60,'127.0.0.1','2','MSSQLServerOLAPService',1,'1','',1,0,'',5,134,1,'bb295f98-95fc-4d54-aa77-fa4f8494048b'),
(647,834,610,'SVC-MsDtsServer100',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',1,60,'127.0.0.1','2','MsDtsServer100',1,'1','',1,0,'',5,134,1,'d8812a8a-e6c7-4f6b-a8cc-2708f24798f2'),
(648,833,425,'SVC-MSSQLServerOLAPService',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',1,60,'127.0.0.1','2','MSSQLServerOLAPService',1,'1','',1,0,'',5,134,1,'421c2ee9-b45b-4025-b4d3-871e441553a2'),
(649,833,610,'SVC-MsDtsServer100',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',1,60,'127.0.0.1','2','MsDtsServer100',1,'1','',1,0,'',5,134,1,'6c75d5c9-5a2e-483b-a2f5-bfb08a44da3c'),
(739,1179,693,'SVC-mysqld',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','mysqld',1,'1','',1,0,'',5,134,1,'b1c75661-5ce1-4e10-a125-24c15baf0db1'),
(760,1180,693,'SVC-postgresql',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','postgresql',1,'1','',1,0,'',5,134,1,'ed8a74e2-3a52-4d77-b64c-3726a50c5351'),
(768,1207,568,'Perf - Active Temp Tables',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','SQLServer:General Statistics!!!Active Temp Tables!!!',6,'','',1,0,'',7,145,1,'254c64de-f389-41fc-b4b3-f8960b45c225'),
(769,1207,568,'Perf - Connection Reset/sec',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','SQLServer:General Statistics!!!Connection Reset/sec!!!',6,'','',1,0,'',7,145,1,'91206ce5-e10a-404a-9e33-9823db7692dd'),
(770,1207,568,'Perf - Logical Connections',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','SQLServer:General Statistics!!!Logical Connections!!!',6,'','',1,0,'',7,145,1,'cebdf502-3abe-49e5-b271-cdf56cf5eb96'),
(771,1207,568,'Perf - Mars Deadlocks',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','SQLServer:General Statistics!!!Mars Deadlocks!!!',6,'','',1,0,'',7,145,1,'5894286a-6976-4bfe-a580-eca897da4022'),
(772,1207,568,'Perf - Processes blocked',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','SQLServer:General Statistics!!!Processes blocked!!!',6,'','',1,0,'',7,145,1,'a9fb5607-6491-4421-9593-2c6687fabcb9'),
(773,1207,568,'Perf - Transactions',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','SQLServer:General Statistics!!!Transactions!!!',6,'','',1,0,'',7,145,1,'29cc7514-81d3-41be-9ffb-443f021193cd'),
(774,1207,568,'Perf - User Connections',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','SQLServer:General Statistics!!!User Connections!!!',6,'','',1,0,'',7,145,1,'88e432df-93e6-423e-8d00-34af1d30c914'),
(775,1207,755,'SVC-MsDtsServer110',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',1,60,'127.0.0.1','2','MsDtsServer110',1,'1','',1,0,'',5,134,1,'4e49d12c-1679-4cfd-94f8-7e68383a7d38'),
(776,1207,568,'SVC-MSSQLSERVER',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','MSSQLSERVER',1,'1','',1,0,'',5,134,1,'28d1495a-4163-4bb9-a63a-656981b15a47'),
(777,1207,743,'SVC-MSSQLServerOLAPService',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',1,60,'127.0.0.1','2','MSSQLServerOLAPService',1,'1','',1,0,'',5,134,1,'6c204117-0f06-4640-878b-6cc867b09861'),
(778,1207,746,'SVC-ReportServer',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',1,60,'127.0.0.1','2','ReportServer',1,'1','',1,0,'',5,134,1,'2885b11b-f555-457b-b57d-b1124b256f50'),
(779,1207,569,'SVC-SQLBrowser',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','SQLBrowser',1,'1','',1,0,'',5,134,1,'8f9a729a-df1b-4cff-a08a-c26f90bd9dc8'),
(780,1207,549,'SVC-SQLWriter',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','SQLWriter',1,'1','',1,0,'',5,134,1,'712c8465-9b02-45b2-bf86-0a20466c30ec'),
(781,1208,568,'Perf - Active Temp Tables',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','SQLServer:General Statistics!!!Active Temp Tables!!!',6,'','',1,0,'',7,145,1,'5325e31b-8f0c-4a4a-a3d5-a1b8bf9bde71'),
(782,1208,568,'Perf - Connection Reset/sec',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','SQLServer:General Statistics!!!Connection Reset/sec!!!',6,'','',1,0,'',7,145,1,'41a8af86-d8ae-441b-9358-ec277ae60b75'),
(783,1208,568,'Perf - Logical Connections',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','SQLServer:General Statistics!!!Logical Connections!!!',6,'','',1,0,'',7,145,1,'eb8ae519-04a4-4991-af6f-a751ee15582b'),
(784,1208,568,'Perf - Mars Deadlocks',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','SQLServer:General Statistics!!!Mars Deadlocks!!!',6,'','',1,0,'',7,145,1,'0600de26-a8fa-465b-bbc4-16523e25048d'),
(785,1208,568,'Perf - Processes blocked',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','SQLServer:General Statistics!!!Processes blocked!!!',6,'','',1,0,'',7,145,1,'368c2f79-caf7-496a-a3b7-346ac5f55c2b'),
(786,1208,568,'Perf - Transactions',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','SQLServer:General Statistics!!!Transactions!!!',6,'','',1,0,'',7,145,1,'e3e66626-141b-4bc3-9eb0-f3f9857ad639'),
(787,1208,568,'Perf - User Connections',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','SQLServer:General Statistics!!!User Connections!!!',6,'','',1,0,'',7,145,1,'cac34b22-4366-4d04-9efe-0171a976f690'),
(788,1208,756,'SVC-MsDtsServer120',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',1,60,'127.0.0.1','2','MsDtsServer120',1,'1','',1,0,'',5,134,1,'41338407-2bd5-4230-9d37-5c7c7a514cb8'),
(789,1208,568,'SVC-MSSQLSERVER',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','MSSQLSERVER',1,'1','',1,0,'',5,134,1,'13fc458c-fda4-4aa1-9464-e902e7b6e129'),
(790,1208,747,'SVC-MSSQLServerOLAPService',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',1,60,'127.0.0.1','2','MSSQLServerOLAPService',1,'1','',1,0,'',5,134,1,'c3b58b3f-0b47-48ef-a53e-6057808bc3d7'),
(791,1208,750,'SVC-ReportServer',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',1,60,'127.0.0.1','2','ReportServer',1,'1','',1,0,'',5,134,1,'0f4c47b7-7ca6-4866-89c6-785aeae79052'),
(792,1208,569,'SVC-SQLBrowser',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','SQLBrowser',1,'1','',1,0,'',5,134,1,'2d0e0f72-cd8e-48c1-865a-33b154717fe4'),
(793,1208,549,'SVC-SQLWriter',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','SQLWriter',1,'1','',1,0,'',5,134,1,'4735a72b-f2b0-4e1a-b22c-d07197d375db');

/*Table structure for table `plugin_database_deprecatedmonitors` */

DROP TABLE IF EXISTS `plugin_database_deprecatedmonitors`;

CREATE TABLE `plugin_database_deprecatedmonitors` (
  `GUID` char(36) NOT NULL,
  `MonitorName` varchar(255) NOT NULL,
  PRIMARY KEY (`GUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `plugin_database_deprecatedmonitors` */

insert  into `plugin_database_deprecatedmonitors`(`GUID`,`MonitorName`) values 
('0600de26-a8fa-465b-bbc4-16523e25048d','Service Plans.Windows Servers.Server Roles.Windows Database Servers.MS SQL 2014 Servers'),
('0d1445d3-96c5-453e-ab8f-f60fba410534','Service Plans.Windows Servers.Server Roles.Windows Database Servers.MS SQL 2008 Servers'),
('0f4c47b7-7ca6-4866-89c6-785aeae79052','Service Plans.Windows Servers.Server Roles.Windows Database Servers.MS SQL 2014 Servers'),
('12301224-b920-47e5-bd2f-aad81cbf7e93','Service Plans.Windows Servers.Server Roles.Windows Database Servers.MS SQL 2008 R2 Servers'),
('13fc458c-fda4-4aa1-9464-e902e7b6e129','Service Plans.Windows Servers.Server Roles.Windows Database Servers.MS SQL 2014 Servers'),
('254c64de-f389-41fc-b4b3-f8960b45c225','Service Plans.Windows Servers.Server Roles.Windows Database Servers.MS SQL 2012 Servers'),
('263ddeb5-5017-4d0e-a6a5-fe35e6df41bb','Service Plans.Windows Servers.Server Roles.Windows Database Servers.MS SQL 2008 Servers'),
('273a19ce-f895-4f37-8294-ef2eb880ff3b','Service Plans.Windows Servers.Server Roles.Windows Database Servers.MS SQL 2008 R2 Servers'),
('2885b11b-f555-457b-b57d-b1124b256f50','Service Plans.Windows Servers.Server Roles.Windows Database Servers.MS SQL 2012 Servers'),
('28d1495a-4163-4bb9-a63a-656981b15a47','Service Plans.Windows Servers.Server Roles.Windows Database Servers.MS SQL 2012 Servers'),
('29cc7514-81d3-41be-9ffb-443f021193cd','Service Plans.Windows Servers.Server Roles.Windows Database Servers.MS SQL 2012 Servers'),
('2d0e0f72-cd8e-48c1-865a-33b154717fe4','Service Plans.Windows Servers.Server Roles.Windows Database Servers.MS SQL 2014 Servers'),
('2e906f7b-41fb-4653-b00b-be7f9d19ac8a','Service Plans.Windows Servers.Server Roles.Windows Database Servers.MS SQL 2008 Servers'),
('2edbe0b5-c416-480a-a792-1a52f8cff8da','Service Plans.Windows Servers.Server Roles.Windows Database Servers.MS SQL 2008 R2 Servers'),
('30dbe6dc-ad38-4802-8856-4541f1fe7ee6','Service Plans.Windows Servers.Server Roles.Windows Database Servers.MS SQL 2008 R2 Servers'),
('32223b4d-0bb1-4243-b52a-fbfe2ecbbf5c','Service Plans.Windows Servers.Server Roles.Windows Database Servers.MS SQL 2008 Servers'),
('368c2f79-caf7-496a-a3b7-346ac5f55c2b','Service Plans.Windows Servers.Server Roles.Windows Database Servers.MS SQL 2014 Servers'),
('3df617de-6d16-4e9a-b411-bde97a80aca6','Service Plans.Windows Servers.Server Roles.MSP Specific Servers.LabTech Server'),
('41338407-2bd5-4230-9d37-5c7c7a514cb8','Service Plans.Windows Servers.Server Roles.Windows Database Servers.MS SQL 2014 Servers'),
('41a8af86-d8ae-441b-9358-ec277ae60b75','Service Plans.Windows Servers.Server Roles.Windows Database Servers.MS SQL 2014 Servers'),
('421c2ee9-b45b-4025-b4d3-871e441553a2','Service Plans.Windows Servers.Server Roles.Windows Database Servers.MS SQL 2008 Servers'),
('46598446-a7f0-43d5-8582-1131c08126ca','Service Plans.Windows Servers.Server Roles.Windows Database Servers.MS SQL 2008 R2 Servers'),
('46a5a7bf-2a33-44c1-a314-defe7af7d015','Service Plans.Windows Servers.Server Roles.Windows Database Servers.MS SQL 2005 Servers'),
('4735a72b-f2b0-4e1a-b22c-d07197d375db','Service Plans.Windows Servers.Server Roles.Windows Database Servers.MS SQL 2014 Servers'),
('4a131543-7ae8-4046-bbe2-03e679c64ed2','Service Plans.Windows Servers.Server Roles.Windows Database Servers.MS SQL 2008 Servers'),
('4e49d12c-1679-4cfd-94f8-7e68383a7d38','Service Plans.Windows Servers.Server Roles.Windows Database Servers.MS SQL 2012 Servers'),
('5325e31b-8f0c-4a4a-a3d5-a1b8bf9bde71','Service Plans.Windows Servers.Server Roles.Windows Database Servers.MS SQL 2014 Servers'),
('5894286a-6976-4bfe-a580-eca897da4022','Service Plans.Windows Servers.Server Roles.Windows Database Servers.MS SQL 2012 Servers'),
('5f179abd-20e7-4ac8-91ba-7faccbcfb347','Service Plans.Windows Servers.Server Roles.Windows Database Servers.MS SQL 2005 Servers'),
('6980d898-ecfe-4e02-912b-46de4d35dae4','Service Plans.Windows Servers.Server Roles.Windows Database Servers.MS SQL 2008 Servers'),
('6a53398c-ea47-4a87-b6a0-1f8fcc6b84e7','Service Plans.Windows Servers.Server Roles.Windows Database Servers.MS SQL 2008 Servers'),
('6c204117-0f06-4640-878b-6cc867b09861','Service Plans.Windows Servers.Server Roles.Windows Database Servers.MS SQL 2012 Servers'),
('6c75d5c9-5a2e-483b-a2f5-bfb08a44da3c','Service Plans.Windows Servers.Server Roles.Windows Database Servers.MS SQL 2008 Servers'),
('703a5877-440d-4798-8447-c845350e3b91','Service Plans.Windows Servers.Server Roles.Windows Database Servers.MS SQL 2008 R2 Servers'),
('712c8465-9b02-45b2-bf86-0a20466c30ec','Service Plans.Windows Servers.Server Roles.Windows Database Servers.MS SQL 2012 Servers'),
('88e432df-93e6-423e-8d00-34af1d30c914','Service Plans.Windows Servers.Server Roles.Windows Database Servers.MS SQL 2012 Servers'),
('8f9a729a-df1b-4cff-a08a-c26f90bd9dc8','Service Plans.Windows Servers.Server Roles.Windows Database Servers.MS SQL 2012 Servers'),
('90851949-adf3-4b02-9102-212bfbdaee61','Service Plans.Windows Servers.Server Roles.Windows Database Servers.Windows MYSQL Servers'),
('90921819-458e-498b-948a-c6dfa28b8680','Service Plans.Windows Servers.Server Roles.Windows Database Servers.Windows MYSQL Servers'),
('91206ce5-e10a-404a-9e33-9823db7692dd','Service Plans.Windows Servers.Server Roles.Windows Database Servers.MS SQL 2012 Servers'),
('940e02c4-7fef-4a9b-9e58-9fa27052c27f','Service Plans.Windows Servers.Server Roles.Windows Database Servers.MS SQL 2008 R2 Servers'),
('97805164-683b-4505-a7cc-913ca16c75d6','Service Plans.Windows Servers.Server Roles.Windows Database Servers.MS SQL 2008 R2 Servers'),
('a9fb5607-6491-4421-9593-2c6687fabcb9','Service Plans.Windows Servers.Server Roles.Windows Database Servers.MS SQL 2012 Servers'),
('b06eb0f0-d1b3-4b06-9d07-85fe4666f091','Service Plans.Windows Servers.Server Roles.Windows Database Servers.MS SQL 2008 Servers'),
('b1c75661-5ce1-4e10-a125-24c15baf0db1','Service Plans.Linux Machines.Server Roles.Linux Database Services.Linux MySQL Servers'),
('b8744b34-d08f-4f9b-be1f-052ded6b661d','Service Plans.Windows Servers.Server Roles.Windows Database Servers.MS SQL 2008 Servers'),
('bb295f98-95fc-4d54-aa77-fa4f8494048b','Service Plans.Windows Servers.Server Roles.Windows Database Servers.MS SQL 2008 R2 Servers'),
('c3b58b3f-0b47-48ef-a53e-6057808bc3d7','Service Plans.Windows Servers.Server Roles.Windows Database Servers.MS SQL 2014 Servers'),
('c7536267-4cf9-4623-9d8d-4eabae6b7800','Service Plans.Windows Servers.Server Roles.Windows Database Servers.MS SQL 2008 R2 Servers'),
('ca189cea-ac4a-47d2-a646-5c19b90eb450','Service Plans.Windows Servers.Server Roles.Windows Database Servers.MS SQL 2008 R2 Servers'),
('cac34b22-4366-4d04-9efe-0171a976f690','Service Plans.Windows Servers.Server Roles.Windows Database Servers.MS SQL 2014 Servers'),
('cebdf502-3abe-49e5-b271-cdf56cf5eb96','Service Plans.Windows Servers.Server Roles.Windows Database Servers.MS SQL 2012 Servers'),
('d8812a8a-e6c7-4f6b-a8cc-2708f24798f2','Service Plans.Windows Servers.Server Roles.Windows Database Servers.MS SQL 2008 R2 Servers'),
('d9366ecf-4de2-454c-a7a4-8c1ec430401e','Service Plans.Windows Servers.Server Roles.Windows Database Servers.MS SQL 2005 Servers'),
('e08a294e-f209-4e80-ac5b-45961433e8e7','Service Plans.Windows Servers.Server Roles.Windows Database Servers.MS SQL 2008 Servers'),
('e3e66626-141b-4bc3-9eb0-f3f9857ad639','Service Plans.Windows Servers.Server Roles.Windows Database Servers.MS SQL 2014 Servers'),
('eb8ae519-04a4-4991-af6f-a751ee15582b','Service Plans.Windows Servers.Server Roles.Windows Database Servers.MS SQL 2014 Servers'),
('ed8a74e2-3a52-4d77-b64c-3726a50c5351','Service Plans.Linux Machines.Server Roles.Linux Database Services.Linux PostgreSQL Servers'),
('f24f4a2f-f118-4db4-964c-9cf6bb3a318a','Service Plans.Windows Servers.Server Roles.Windows Database Servers.MS SQL 2008 R2 Servers');

/*Table structure for table `plugin_database_guidmap` */

DROP TABLE IF EXISTS `plugin_database_guidmap`;

CREATE TABLE `plugin_database_guidmap` (
  `OldGUID` char(36) NOT NULL,
  `NewGUID` char(36) NOT NULL,
  PRIMARY KEY (`OldGUID`,`NewGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `plugin_database_guidmap` */

insert  into `plugin_database_guidmap`(`OldGUID`,`NewGUID`) values 
('0600de26-a8fa-465b-bbc4-16523e25048d','D17FC296-0322-4811-96E1-E045A4451BC5'),
('0d1445d3-96c5-453e-ab8f-f60fba410534','F650E7D9-7A08-4B07-B328-9178785AE782'),
('0f4c47b7-7ca6-4866-89c6-785aeae79052','FB1C01B2-7848-4ADC-A595-16CD8ADFD72B'),
('12301224-b920-47e5-bd2f-aad81cbf7e93','AA2B30B8-43C0-4026-B9A2-5BDFF03A7693'),
('13fc458c-fda4-4aa1-9464-e902e7b6e129','6A212949-9113-4505-BA36-B4A1C12F27B0'),
('254c64de-f389-41fc-b4b3-f8960b45c225','8A88339A-3227-41A5-AACC-78C1D3CFB1AC'),
('263ddeb5-5017-4d0e-a6a5-fe35e6df41bb','667C4DF8-FC2F-46CC-AB8B-84114E4959EF'),
('273a19ce-f895-4f37-8294-ef2eb880ff3b','8FED2A3F-329B-4BD5-9DE8-5C3CD4E69C70'),
('2885b11b-f555-457b-b57d-b1124b256f50','5036204B-B9AE-4D1E-9C0C-6509F4C3E031'),
('28d1495a-4163-4bb9-a63a-656981b15a47','74618E34-E7FF-4EFD-A6DF-5FEFFB93F862'),
('29cc7514-81d3-41be-9ffb-443f021193cd','EC13582D-D9D6-4F62-B1AB-25F63F7E7DBB'),
('2d0e0f72-cd8e-48c1-865a-33b154717fe4','B459BF51-29EC-43D7-AE49-BD4CE39B7D41'),
('2e906f7b-41fb-4653-b00b-be7f9d19ac8a','ACD9FECC-7FE9-4D0E-A8DD-D465310993E5'),
('2edbe0b5-c416-480a-a792-1a52f8cff8da','20D9179C-7B0D-4E5A-8672-30647292DEB7'),
('30dbe6dc-ad38-4802-8856-4541f1fe7ee6','6E469FD2-122D-49EA-AFD1-C46AC80C637A'),
('32223b4d-0bb1-4243-b52a-fbfe2ecbbf5c','E089262F-1DD7-491B-ABA9-4E807B9B1CAC'),
('368c2f79-caf7-496a-a3b7-346ac5f55c2b','7F6D0DD2-B421-4623-8615-BBE57F527783'),
('41338407-2bd5-4230-9d37-5c7c7a514cb8','D8B6A378-B7AA-48C1-9DC8-EBE292318A08'),
('41a8af86-d8ae-441b-9358-ec277ae60b75','4276E75E-A914-404D-9F15-68F1A6C918A5'),
('421c2ee9-b45b-4025-b4d3-871e441553a2','082E0D47-1D11-4D66-8514-FD0861D14736'),
('46598446-a7f0-43d5-8582-1131c08126ca','0BA37A74-321F-42E4-98D5-844240504CAD'),
('46a5a7bf-2a33-44c1-a314-defe7af7d015','EF404D4F-E066-4647-96F0-18CB931F30DD'),
('4735a72b-f2b0-4e1a-b22c-d07197d375db','F702C75B-922C-4EFA-BF6B-166E45D88D7B'),
('4a131543-7ae8-4046-bbe2-03e679c64ed2','08C0F95B-0E90-47F1-9930-625C90CE13BD'),
('4e49d12c-1679-4cfd-94f8-7e68383a7d38','85AE0A32-9238-4119-8130-6A25634571CA'),
('5325e31b-8f0c-4a4a-a3d5-a1b8bf9bde71','BE742266-4477-43AC-9A5F-F4CE01293B26'),
('5894286a-6976-4bfe-a580-eca897da4022','318046E6-076C-4315-AAC5-1FD1498CA486'),
('5f179abd-20e7-4ac8-91ba-7faccbcfb347','4A0C8AFB-3B9B-4C6E-91EF-DE7E294E34D8'),
('6980d898-ecfe-4e02-912b-46de4d35dae4','1658FF50-B082-41AD-A0E6-72586D9496F7'),
('6a53398c-ea47-4a87-b6a0-1f8fcc6b84e7','2FFF869E-8C59-4334-89EB-D8A840F00D50'),
('6c204117-0f06-4640-878b-6cc867b09861','2159D9F0-9039-4CDC-90DF-336630A44BD3'),
('6c75d5c9-5a2e-483b-a2f5-bfb08a44da3c','00402F78-AD7D-450F-97C3-C1D3DA9F62CC'),
('703a5877-440d-4798-8447-c845350e3b91','A6A8EB40-36B2-4F85-B1BB-4A95D28BD6AD'),
('712c8465-9b02-45b2-bf86-0a20466c30ec','84764677-4F73-4E03-AA7C-67DF30B91F2F'),
('88e432df-93e6-423e-8d00-34af1d30c914','6C09CB6D-74B6-430F-A643-6C067C9709BB'),
('8f9a729a-df1b-4cff-a08a-c26f90bd9dc8','A32B3C2E-F0A0-4EEF-A0C1-F1209F7081EE'),
('90851949-adf3-4b02-9102-212bfbdaee61','20625837-41C6-43C0-9BAD-4A238A33B674'),
('91206ce5-e10a-404a-9e33-9823db7692dd','49B12277-5162-4D34-8C05-85517AA9A440'),
('940e02c4-7fef-4a9b-9e58-9fa27052c27f','5DEEE52A-6732-476D-A341-6B9DEB4513DA'),
('97805164-683b-4505-a7cc-913ca16c75d6','1BB77070-C398-42B3-B37D-2D878B7E1A27'),
('a9fb5607-6491-4421-9593-2c6687fabcb9','F6B89CD3-C870-49BA-99FE-970613F39509'),
('b06eb0f0-d1b3-4b06-9d07-85fe4666f091','2A8E7699-B0A7-46FA-A6D6-83ADD15F0A9D'),
('b1c75661-5ce1-4e10-a125-24c15baf0db1','6BB3C0A1-3E53-4E8E-81FB-CB5FBB0C5219'),
('b8744b34-d08f-4f9b-be1f-052ded6b661d','8437C087-0BE6-4E3E-922B-B0D4A4066007'),
('bb295f98-95fc-4d54-aa77-fa4f8494048b','98A29D56-5394-47F2-92DB-6DD758158CDF'),
('c3b58b3f-0b47-48ef-a53e-6057808bc3d7','076E2688-0496-4AE2-99F3-589626D96372'),
('c7536267-4cf9-4623-9d8d-4eabae6b7800','883D2BD0-814D-41E4-A983-D689D9C96C2F'),
('ca189cea-ac4a-47d2-a646-5c19b90eb450','A47D7D68-D718-4A9A-A117-4D21BD914CF2'),
('cac34b22-4366-4d04-9efe-0171a976f690','D6E51A22-7DBE-43D2-B379-A45F88C6B3C0'),
('cebdf502-3abe-49e5-b271-cdf56cf5eb96','0213BEC1-6C94-40B9-AE22-B0B584A60A69'),
('d8812a8a-e6c7-4f6b-a8cc-2708f24798f2','FBA1EBF4-6F5C-4E55-A2D4-67556AC6A659'),
('d9366ecf-4de2-454c-a7a4-8c1ec430401e','E42E3D00-E5EE-4A34-BF8F-B1D9D0C06D84'),
('e08a294e-f209-4e80-ac5b-45961433e8e7','CA25447F-9BBA-4AFA-9966-C7A05671D313'),
('e3e66626-141b-4bc3-9eb0-f3f9857ad639','970B8BAA-FC1B-4C1A-9147-27067980CE85'),
('eb8ae519-04a4-4991-af6f-a751ee15582b','4577B28F-E6D5-423A-B357-14FB84B8B927'),
('ed8a74e2-3a52-4d77-b64c-3726a50c5351','F084CBEF-A751-46C3-AA53-4A672B55DDDC'),
('f24f4a2f-f118-4db4-964c-9cf6bb3a318a','FB41E837-E4E8-4334-BA74-45F892B33F37');

/*Table structure for table `plugin_database_servertypes` */

DROP TABLE IF EXISTS `plugin_database_servertypes`;

CREATE TABLE `plugin_database_servertypes` (
  `ID` int(11) NOT NULL,
  `ServerType` varchar(255) NOT NULL,
  `Enabled` tinyint(1) NOT NULL DEFAULT '0',
  `ReportCategory` int(11) DEFAULT '7',
  `TicketCategory` int(11) DEFAULT '123',
  `AlertLevel` int(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `plugin_database_servertypes` */

insert  into `plugin_database_servertypes`(`ID`,`ServerType`,`Enabled`,`ReportCategory`,`TicketCategory`,`AlertLevel`) values 
(0,'MSSQL',1,7,123,-1),
(1,'MySQL',1,7,123,-1),
(2,'PostgreSQL',1,7,123,-1);

/*Table structure for table `plugin_database_settings` */

DROP TABLE IF EXISTS `plugin_database_settings`;

CREATE TABLE `plugin_database_settings` (
  `SettingName` varchar(255) NOT NULL,
  `Value` int(11) NOT NULL,
  PRIMARY KEY (`SettingName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `plugin_database_settings` */

insert  into `plugin_database_settings`(`SettingName`,`Value`) values 
('AlertLevel',-1),
('DbVersion',10),
('FirstSave',0),
('IsSaving',0),
('IsSyncing',0),
('LastInstanceScanTime',521190610),
('ReportCategory',7),
('TicketCategory',123),
('upgradedToMultiDB',1),
('UseEdfs',1);

/*Table structure for table `plugin_iis_appliedmonitors` */

DROP TABLE IF EXISTS `plugin_iis_appliedmonitors`;

CREATE TABLE `plugin_iis_appliedmonitors` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(200) NOT NULL,
  `CheckAction` int(11) NOT NULL,
  `AlertAction` int(11) NOT NULL,
  `AlertMessage` text NOT NULL,
  `ContactID` int(11) NOT NULL,
  `Interval` int(11) NOT NULL,
  `Where` varchar(255) NOT NULL,
  `What` varchar(255) NOT NULL,
  `DataOut` text NOT NULL,
  `Comparor` int(11) NOT NULL,
  `DataIn` varchar(200) NOT NULL,
  `IDField` varchar(500) NOT NULL,
  `AlertStyle` int(11) NOT NULL DEFAULT '0',
  `Changed` int(11) NOT NULL,
  `DataCollector` varchar(100) NOT NULL,
  `Category` int(11) NOT NULL,
  `TicketCategory` int(11) NOT NULL,
  `ScriptTarget` int(11) DEFAULT '1',
  `GUID` char(36) NOT NULL,
  `ServerType` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`),
  KEY `ContactID` (`ContactID`),
  KEY `Name` (`Name`),
  KEY `ServerType` (`ServerType`)
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=utf8;

/*Data for the table `plugin_iis_appliedmonitors` */

insert  into `plugin_iis_appliedmonitors`(`ID`,`Name`,`CheckAction`,`AlertAction`,`AlertMessage`,`ContactID`,`Interval`,`Where`,`What`,`DataOut`,`Comparor`,`DataIn`,`IDField`,`AlertStyle`,`Changed`,`DataCollector`,`Category`,`TicketCategory`,`ScriptTarget`,`GUID`,`ServerType`) values 
(2,'SVC-SPAdminV4',6,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','2','SPAdminV4',1,'1','',1,0,'',5,134,0,'6553A19D-EB6F-4454-89E6-AED817E4034A',2),
(3,'SVC-SPAdminV4',6,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','2','SPAdminV4',1,'1','',1,0,'',5,134,0,'bd421bba-b9c8-4b28-9734-96571ef041fa',2),
(4,'SVC-SPAdminV4',6,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','2','SPAdminV4',1,'1','',1,0,'',5,134,0,'296f3c64-6292-45c7-85a5-f7b4e0bc4138',2),
(6,'SVC-SPTimerV3',6,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','2','SPTimerV3',1,'1','',1,0,'',5,134,0,'982af6da-2f7a-4b7c-baff-0b8ba58acac8',2),
(7,'SVC-SPTimerV4',6,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','2','SPTimerV4',1,'1','',1,0,'',5,134,0,'3832DCAA-F860-4C25-B7E6-DFCF5C86BFD2',2),
(8,'SVC-SPTimerV4',6,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','2','SPTimerV4',1,'1','',1,0,'',5,134,0,'926231f4-0430-477c-9989-25171417d6d4',2),
(9,'SVC-SPTimerV4',6,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','2','SPTimerV4',1,'1','',1,0,'',5,134,0,'371ac607-d3c2-4837-bd85-49d3f7123631',2),
(11,'SVC-SPTrace',6,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','2','SPTrace',1,'1','',1,0,'',5,134,0,'e9a03a56-c13f-4b31-952b-0fb89b80d77d',2),
(12,'SVC-SPTraceV4',6,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','2','SPTraceV4',1,'1','',1,0,'',5,134,0,'9BD948C1-71B9-4539-80A2-1B638E48B911',2),
(13,'SVC-SPTraceV4',6,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','2','SPTraceV4',1,'1','',1,0,'',5,134,0,'05033f60-9023-4250-b079-8aec3ef03de0',2),
(14,'SVC-SPTraceV4',6,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','2','SPTraceV4',1,'1','',1,0,'',5,134,0,'22ad9a78-7a3b-42dc-9a13-8149d9b6fdbb',2),
(15,'SVC-SPWriter',6,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','2','SPWriter',1,'1','',1,0,'',5,134,0,'F9010B14-6045-4CC3-8D9C-A1C2CC49586B',2),
(16,'SVC-SPWriterV4',6,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','2','SPWriterV4',1,'1','',1,0,'',5,134,0,'9E672061-2729-4CFF-91BA-33E996590FEB',2),
(17,'SVC-Apache2',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','2','Apache2',1,'1','',1,0,'',5,134,0,'8B87A3CE-D48A-497E-BB9F-3CF6FBB51DF6',3),
(18,'SVC-Apache2.2',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','2','Apache2.2',1,'1','',1,0,'',5,134,0,'71F12E68-6C43-4317-A4AD-DF4D587361B7',3),
(20,'SVC-httpd',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','2','httpd',1,'1','',1,0,'',5,134,0,'D3406FBC-34CF-4110-9CEE-F2E925F11498',3),
(21,'Perf-Accepting TCP Connections',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','ISA Server Firewall Service!!!Accepting TCP Connections!!!',4,'10','',1,0,'Temp,Temp',7,121,0,'41176BFE-D558-40F8-887F-6BE1AF6709B3',4),
(22,'Perf-Backlogged Packets',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','ISA Server Firewall Packet Engine!!!Backlogged Packets!!!',4,'10','',1,0,'Temp,Temp',7,121,0,'443DA201-A61D-4414-B65E-DEB036DE24DF',4),
(23,'Perf-Current Cache Fetches Average Milliseconds',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','ISA Server Web Proxy!!!Current Cache Fetches Average Milliseconds/request!!!',4,'300','',1,0,'Temp,Temp',7,121,0,'ECB03F76-5E0C-44D0-8339-280DF1C6FC35',4),
(24,'Perf-Dropped Packets Sec',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','ISA Server Firewall Packet Engine!!!Dropped Packets/sec!!!',4,'100','',1,0,'Temp,Temp',7,121,0,'7694D58C-85C2-46AE-B1A3-0F5181F99DCC',4),
(25,'Perf-Worker Threads',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','ISA Server Firewall Service!!!Worker Threads!!!',4,'400','',1,0,'Temp,Temp',7,121,0,'61C99B34-D22E-4D15-AC31-62F395CA3382',4),
(26,'SVC-FWSRV',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','2','fwsrv',1,'1','',1,0,'',5,134,0,'08A517FF-C851-4A24-8D49-4A0C6BD5E707',4),
(27,'SVC-tomcat6',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','2','tomcat6',1,'1','',1,0,'',5,134,0,'3C9622A2-3E4A-4908-AD3C-E1086960973C',5),
(28,'SVC-web',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,120,'127.0.0.1','7','serveradmin status web',5,'RUNNING','',1,0,'',5,134,0,'D4734D4F-5303-4C18-A191-F1FA6A259E0C',6),
(126,'Perf-Total Files Cached',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','Internet Information Services Global!!!Total Files Cached!!!',6,'','',1,0,'Files,Files',7,123,0,'da2a3215-6b60-11e3-be9a-000c299cc007',1),
(127,'Perf-File Cache Hits %',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\n\n\n\nThis displays the ratio of cache hits to total cache requests. It should be about 80% for sites with static pages.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','Internet Information Services Global!!!File Cache Hits %!!!',6,'','',1,0,'HitPercents,HitPercents',7,123,0,'da2a32d5-6b60-11e3-be9a-000c299cc007',1),
(128,'Perf-Errors Sec',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\n\n\n\nThe number of errors per second, including connection errors, compile errors, and runtime errors. If this number is ever greater than 0, something is wrong with the test scripts, server configuration, or ASP scripts.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','Active Server Pages!!!Errors/Sec!!!',6,'','',1,0,'Errors,Errors',7,123,0,'da2a33b5-6b60-11e3-be9a-000c299cc007',1),
(129,'Perf-HTTP Requests',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','HTTP Service Request Queues!!!CurrentQueueSize!!!',6,'','',1,0,'Requests,Requests',7,123,0,'da2a349d-6b60-11e3-be9a-000c299cc007',1),
(130,'Perf-Total Bytes Sent',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.',0,60,'127.0.0.1','0','Web Service!!!Total Bytes Sent!!!_Total',17,'-9999','',1,0,'Bytes,Bytes',0,175,0,'1b9ff90a-6c37-11e3-be9a-000c299cc007',1),
(131,'Perf-Total Bytes Received',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.',0,60,'127.0.0.1','0','Web Service!!!Total Bytes Received!!!_Total',17,'-9999','',1,0,'Bytes,Bytes',0,175,0,'1b9ffb06-6c37-11e3-be9a-000c299cc007',1),
(132,'Perf-Total Bytes Transferred',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.',0,60,'127.0.0.1','0','Web Service!!!Total Bytes Transferred!!!_Total',17,'-9999','',1,0,'Bytes,Bytes',0,175,0,'1b9ffc12-6c37-11e3-be9a-000c299cc007',1),
(133,'Perf-Current Anonymous Users',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.',0,60,'127.0.0.1','0','Web Service!!!Current Anonymous Users!!!',17,'-9999','',1,0,'Users,Users',0,175,0,'1b9ffd19-6c37-11e3-be9a-000c299cc007',1),
(134,'Perf-Current NonAnonymous Users',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.',0,60,'127.0.0.1','0','Web Service!!!Current NonAnonymous Users!!!',17,'-9999','',1,0,'Users,Users',0,175,0,'1b9ffe17-6c37-11e3-be9a-000c299cc007',1),
(135,'Perf-Maximum NonAnonymous Users',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.',0,60,'127.0.0.1','0','Web Service!!!Maximum Anonymous Users!!!',17,'-9999','',1,0,'Users,Users',0,175,0,'1b9fff10-6c37-11e3-be9a-000c299cc007',1),
(136,'Perf-Current Connections',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.',0,60,'127.0.0.1','0','Web Service!!!Current Connections!!!',17,'-9999','',1,0,'Connections,Connections',0,175,0,'1ba0000b-6c37-11e3-be9a-000c299cc007',1),
(137,'Perf-Maximum Connections',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.',0,60,'127.0.0.1','0','Web Service!!!Maximum Connections!!!',17,'-9999','',1,0,'Connections,Connections',0,175,0,'1ba00107-6c37-11e3-be9a-000c299cc007',1),
(138,'Perf-Total Connection Attempts',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.',0,60,'127.0.0.1','0','Web Service!!!Total Connection Attempts (all instances)!!!',17,'-9999','',1,0,'Connections,Connections',0,175,0,'1ba00205-6c37-11e3-be9a-000c299cc007',1),
(139,'Perf-Logon Attempts/sec',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.',0,60,'127.0.0.1','0','Web Service!!!Logon Attempts/sec!!!',17,'-9999','',1,0,'Logins,Logins',0,175,0,'1ba00303-6c37-11e3-be9a-000c299cc007',1),
(140,'Perf-Total Not Found Errors',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.',0,60,'127.0.0.1','0','Web Service!!!Total Not Found Errors!!!',17,'100','',1,0,'Errors,Errors',0,175,0,'1ba0042e-6c37-11e3-be9a-000c299cc007',1),
(141,'Perf-Service Uptime',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.',0,60,'127.0.0.1','0','Web Service!!!Service Uptime!!!',17,'-9999','',1,0,'Uptime,Uptime',0,175,0,'1ba0052c-6c37-11e3-be9a-000c299cc007',1),
(142,'Perf-ASP Application Restarts',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.',0,60,'127.0.0.1','0','ASP.NET!!!Application Restarts!!!',17,'0','',1,0,'Restarts,Restarts',0,175,0,'1ba00625-6c37-11e3-be9a-000c299cc007',1),
(143,'Perf-ASP Applications Running',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.',0,60,'127.0.0.1','0','ASP.NET!!!Applications Running!!!',17,'-9999','',1,0,'Applications,Applications',0,175,0,'1ba00718-6c37-11e3-be9a-000c299cc007',1),
(144,'Perf-State Server Sessions Active',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.',0,60,'127.0.0.1','0','ASP.NET!!!State Server Sessions Active!!!',17,'-9999','',1,0,'Sessions,Sessions',0,175,0,'1ba00867-6c37-11e3-be9a-000c299cc007',1),
(145,'Perf-Worker Process Restarts',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.',0,60,'127.0.0.1','0','ASP.NET!!!Worker Process Restarts!!!',17,'-9999','',1,0,'Restarts,Restarts',0,175,0,'1ba00c25-6c37-11e3-be9a-000c299cc007',1),
(146,'Perf-ASP Worker Processes running',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.',0,60,'127.0.0.1','0','ASP.NET!!!Worker Processes Running!!!',17,'25','',1,0,'Restarts,Restarts',0,175,0,'1ba00d50-6c37-11e3-be9a-000c299cc007',1),
(147,'Perf-ASP Sessions Active',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.',0,60,'127.0.0.1','0','ASP.NET Applications!!!Sessions Active!!!',17,'-9999','',1,0,'Sessions,Sessions',0,175,0,'1ba00e51-6c37-11e3-be9a-000c299cc007',1),
(148,'Perf-ASP Sessions Abandoned',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.',0,60,'127.0.0.1','0','ASP.NET Applications!!!Sessions Abandoned!!!',17,'20','',1,0,'Sessions,Sessions',0,175,0,'1ba00f71-6c37-11e3-be9a-000c299cc007',1),
(149,'Perf-ASP Sessions Timed Out',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.',0,60,'127.0.0.1','0','ASP.NET Applications!!!Sessions Timed Out!!!',17,'-9999','',1,0,'Sessions,Sessions',0,175,0,'1ba0106c-6c37-11e3-be9a-000c299cc007',1),
(150,'Perf-ASP Sessions Total',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.',0,60,'127.0.0.1','0','ASP.NET Applications!!!Sessions Total!!!',17,'-9999','',1,0,'Sessions,Sessions',0,175,0,'1ba01168-6c37-11e3-be9a-000c299cc007',1),
(151,'IIS-Website Up/Down',6,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.',0,60,'','1235','',1,'0','0',1,0,'States,States',0,175,0,'F78E5D97-536F-446D-9952-8A2566BA3428',1),
(153,'SVC-W3SVC',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.',0,60,'127.0.0.1','2','W3SVC',1,'1','',1,0,'',5,138,0,'da2976a8-6b60-11e3-be9a-000c299cc007',1),
(154,'SVC-IISAdmin',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.',0,60,'127.0.0.1','2','IISADMIN',1,'1','',1,0,'',5,138,0,'da297768-6b60-11e3-be9a-000c299cc007',1);

/*Table structure for table `plugin_iis_deprecatedgroupagents` */

DROP TABLE IF EXISTS `plugin_iis_deprecatedgroupagents`;

CREATE TABLE `plugin_iis_deprecatedgroupagents` (
  `AgentID` int(11) NOT NULL AUTO_INCREMENT,
  `GroupID` int(11) NOT NULL,
  `SearchID` int(11) NOT NULL,
  `Name` varchar(200) NOT NULL,
  `CheckAction` int(11) NOT NULL,
  `AlertAction` int(11) NOT NULL,
  `AlertMessage` text NOT NULL,
  `ContactID` int(11) NOT NULL,
  `interval` int(11) NOT NULL,
  `Where` varchar(255) NOT NULL,
  `What` varchar(255) NOT NULL,
  `DataOut` text NOT NULL,
  `Comparor` int(11) NOT NULL,
  `DataIn` varchar(8000) NOT NULL,
  `IDField` varchar(500) NOT NULL,
  `AlertStyle` int(11) NOT NULL DEFAULT '0',
  `ScriptID` int(11) NOT NULL,
  `DataCollector` varchar(100) NOT NULL,
  `Category` int(11) NOT NULL,
  `TicketCategory` int(11) NOT NULL,
  `ScriptTarget` int(11) DEFAULT '1',
  `GUID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`AgentID`),
  KEY `ContactID` (`ContactID`),
  KEY `Name` (`Name`),
  KEY `GroupID` (`GroupID`),
  KEY `SearchID` (`SearchID`)
) ENGINE=InnoDB AUTO_INCREMENT=858 DEFAULT CHARSET=utf8;

/*Data for the table `plugin_iis_deprecatedgroupagents` */

insert  into `plugin_iis_deprecatedgroupagents`(`AgentID`,`GroupID`,`SearchID`,`Name`,`CheckAction`,`AlertAction`,`AlertMessage`,`ContactID`,`interval`,`Where`,`What`,`DataOut`,`Comparor`,`DataIn`,`IDField`,`AlertStyle`,`ScriptID`,`DataCollector`,`Category`,`TicketCategory`,`ScriptTarget`,`GUID`) values 
(360,950,424,'SVC-W3SVC',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',1,60,'127.0.0.1','2','W3SVC',1,'1','',1,0,'',5,138,1,'1a9a8fbd-4790-4f35-b187-6d3b1f550ae4'),
(361,950,492,'SVC-IISADMIN',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',1,60,'127.0.0.1','2','IISADMIN',1,'1','',1,0,'',5,138,1,'6d6a764e-a65e-4fd9-9be3-152fbcf363dd'),
(371,953,0,'SVC-SPWriterV4',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',1,60,'127.0.0.1','2','SPWriterV4',1,'1','',1,0,'',5,134,1,'54cf0c6a-6649-4e44-abe3-9369c1fde18e'),
(412,957,553,'SVC-Apache2',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',1,60,'127.0.0.1','2','Apache2',1,'1','',1,0,'',5,134,1,'ef02b722-f137-44ea-b4a5-2c6a940e5f1f'),
(413,957,550,'SVC-Apache2.2',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',1,60,'127.0.0.1','2','Apache2.2',1,'1','',1,0,'',5,134,1,'43364984-742e-4361-a60d-815edea3fb2e'),
(538,951,0,'SVC-SPTimerV3',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',1,60,'127.0.0.1','2','SPTimerV3',1,'1','',1,0,'',5,134,1,'5c064102-d2a1-4be2-bffe-977f6a8bc3d0'),
(539,951,0,'SVC-SPTrace',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',1,60,'127.0.0.1','2','SPTrace',1,'1','',1,0,'',5,134,1,'cefbc975-5dc2-407e-a9e2-ecd1cc38d40d'),
(540,951,0,'SVC-SPWriter',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',1,60,'127.0.0.1','2','SPWriter',1,'1','',1,0,'',5,134,1,'72fed961-f770-4030-b174-7e3276cb69f9'),
(613,950,0,'Perf - Total Files Cached',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.',0,60,'127.0.0.1','0','Internet Information Services Global!!!Total Files Cached!!!',6,'','',1,0,'',7,123,1,'df21e77c-f490-4f1c-8141-8e0c6bba7782'),
(614,950,0,'Perf - File Cache Hits %',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r\nThis displays the ratio of cache hits to total cache requests. It should be about 80% for sites with static pages.',0,60,'127.0.0.1','0','Internet Information Services Global!!!File Cache Hits %!!!',6,'','',1,0,'',7,123,1,'77505b9f-031b-4fcb-960b-1bade949f02c'),
(615,950,0,'Perf - Errors Sec',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r\nThe number of errors per second, including connection errors, compile errors, and runtime errors. If this number is ever greater than 0, something is wrong with the test scripts, server configuration, or ASP scripts.',0,60,'127.0.0.1','0','Active Server Pages!!!Errors/Sec!!!',6,'','',1,0,'',7,123,1,'5b086cfd-64ea-4e3c-bc97-78e0a8a8a64a'),
(616,950,0,'Perf - HTTP Requests',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.',0,60,'127.0.0.1','0','HTTP Service Request Queues!!!CurrentQueueSize!!!',6,'','',1,0,'',7,123,1,'4210a6f9-9148-49d6-83fe-8b9bbb863d7c'),
(619,958,0,'Perf - Backlogged Packets',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r\nBacklogged packets can impact dropped packets: \r\n\r\n1. An increase in dropped packets without a corresponding rise in backlogged packets increase may indicate an attack \r\n\r\n2. if they rise together or if a rise in backlogged packet precedes an immediate rise in dropped packets, ISA is processing too much traffic \r\n\r\n3. If this always happens after active connections plateaus, it',0,60,'127.0.0.1','0','ISA Server Firewall Packet Engine!!!Backlogged Packets!!!',4,'10','',1,0,'',7,121,1,'e6d1d340-1b8d-4b36-a332-2bf71184271c'),
(620,958,0,'Perf - Dropped Packets Sec',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.',0,60,'127.0.0.1','0','ISA Server Firewall Packet Engine!!!Dropped Packets/sec!!!',4,'100','',1,0,'',7,121,1,'c68762fd-c092-4f8a-bb4b-d22193859dca'),
(621,958,0,'Perf - Accepting TCP Connections',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.',0,60,'127.0.0.1','0','ISA Server Firewall Service!!!Accepting TCP Connections!!!',4,'10','',1,0,'',7,121,1,'c73f2c5e-05cc-4abb-9d39-c3bbe2ba463c'),
(622,958,0,'Perf - Worker Threads',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r\nAvailable worker threads should never remain near 0 for any length of time; if ISA keeps this at or near 0, it',0,60,'127.0.0.1','0','ISA Server Firewall Service!!!Worker Threads!!!',4,'400','',1,0,'',7,121,1,'6e5782b1-6d3f-48c4-9071-6e1f5cceb9e7'),
(623,958,0,'Perf - Current Cache Fetches Average Milliseconds/',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.',0,60,'127.0.0.1','0','ISA Server Web Proxy!!!Current Cache Fetches Average Milliseconds/request!!!',4,'300','',1,0,'',7,121,1,'3c77db1f-f338-4001-93fc-4a5f02c88262'),
(624,958,0,'SVC-FWSRV',6,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.',0,60,'127.0.0.1','2','fwsrv',1,'1','',1,0,'',5,134,1,'d9b1e479-2360-421e-ac4e-7d6aeca51b5e'),
(696,1176,0,'SVC-web',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|MacService=web|tzcompdisabled=1|priority=5',0,120,'127.0.0.1','7','/Applications/Server.app/Contents/ServerRoot/usr/sbin/serveradmin status web',5,'RUNNING','',1,0,'',5,134,1,'364ad997-2725-46ba-9a8f-601e4f78ee0e'),
(722,1184,693,'SVC-httpd',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','httpd',1,'1','',1,0,'',5,134,1,'7674be98-a6a6-423c-b64b-e04197c51a0f'),
(749,1204,0,'SVC-wiki',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|MacService=wiki|tzcompdisabled=1|priority=5',0,120,'127.0.0.1','7','/Applications/Server.app/Contents/ServerRoot/usr/sbin/serveradmin status wiki',5,'RUNNING','',1,0,'',5,134,1,'d3e83619-ea34-498c-bfed-22bfc0f9f977'),
(759,1185,693,'SVC-tomcat6',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','tomcat6',1,'1','',1,0,'',5,134,1,'ea1e1b21-7906-4eb6-981a-09994bdda0e0'),
(846,953,0,'SVC-SPAdminV4',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',1,60,'127.0.0.1','2','SPAdminV4',1,'1','',1,0,'',5,134,1,'30a17b3e-e04f-4427-b8ca-453c23b95f00'),
(847,953,0,'SVC-SPTimerV4',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',1,60,'127.0.0.1','2','SPTimerV4',1,'1','',1,0,'',5,134,1,'cdc7f51e-1d60-4f25-96c4-ee36f907f4ac'),
(848,953,0,'SVC-SPTraceV4',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',1,60,'127.0.0.1','2','SPTraceV4',1,'1','',1,0,'',5,134,1,'bdd24b0b-4ed4-4879-b904-0e9bc13c29b3'),
(852,954,0,'SVC-SPAdminV4',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',1,60,'127.0.0.1','2','SPAdminV4',1,'1','',1,0,'',5,134,1,'1e5d9585-531c-494e-8fa7-c3ca77ad5778'),
(853,954,0,'SVC-SPTimerV4',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',1,60,'127.0.0.1','2','SPTimerV4',1,'1','',1,0,'',5,134,1,'985d48c7-5824-4b3d-8a84-a7834da6abba'),
(854,954,0,'SVC-SPTraceV4',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',1,60,'127.0.0.1','2','SPTraceV4',1,'1','',1,0,'',5,134,1,'5286f8c1-d4d4-4036-87d1-3c0665c49efd'),
(855,1209,0,'SVC-SPAdminV4',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',1,60,'127.0.0.1','2','SPAdminV4',1,'1','',1,0,'',5,134,1,'402d53ce-304d-4c38-92a3-616e8c18a312'),
(856,1209,0,'SVC-SPTimerV4',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',1,60,'127.0.0.1','2','SPTimerV4',1,'1','',1,0,'',5,134,1,'0d7840cc-3e17-4dde-b1a7-4855d89be415'),
(857,1209,0,'SVC-SPTraceV4',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',1,60,'127.0.0.1','2','SPTraceV4',1,'1','',1,0,'',5,134,1,'120a37e3-8460-4a25-8b91-c29c8862087c');

/*Table structure for table `plugin_iis_deprecatedmonitors` */

DROP TABLE IF EXISTS `plugin_iis_deprecatedmonitors`;

CREATE TABLE `plugin_iis_deprecatedmonitors` (
  `GUID` char(36) NOT NULL,
  `MonitorName` varchar(255) NOT NULL,
  PRIMARY KEY (`GUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `plugin_iis_deprecatedmonitors` */

insert  into `plugin_iis_deprecatedmonitors`(`GUID`,`MonitorName`) values 
('0d7840cc-3e17-4dde-b1a7-4855d89be415','Service Plans.Windows Servers.Server Roles.Windows Web/Proxy Servers.SharePoint Server 2013 Servers'),
('120a37e3-8460-4a25-8b91-c29c8862087c','Service Plans.Windows Servers.Server Roles.Windows Web/Proxy Servers.SharePoint Server 2013 Servers'),
('1a9a8fbd-4790-4f35-b187-6d3b1f550ae4','Service Plans.Windows Servers.Server Roles.Windows Web/Proxy Servers.Windows IIS Web Servers - SVC-W3SVC'),
('1e5d9585-531c-494e-8fa7-c3ca77ad5778','Service Plans.Windows Servers.Server Roles.Windows Web/Proxy Servers.SharePoint Server 2010 Servers'),
('30a17b3e-e04f-4427-b8ca-453c23b95f00','Service Plans.Windows Servers.Server Roles.Windows Web/Proxy Servers.SharePoint Foundation 2010 Servers'),
('364ad997-2725-46ba-9a8f-601e4f78ee0e','Service Plans.MAC Servers.Server Roles.OS X Web Services.OS X Web Services - Web Server'),
('3c77db1f-f338-4001-93fc-4a5f02c88262','Service Plans.Windows Servers.Server Roles.Windows Web/Proxy Servers.ISA Servers'),
('402d53ce-304d-4c38-92a3-616e8c18a312','Service Plans.Windows Servers.Server Roles.Windows Web/Proxy Servers.SharePoint Server 2013 Servers'),
('4210a6f9-9148-49d6-83fe-8b9bbb863d7c','Service Plans.Windows Servers.Server Roles.Windows Web/Proxy Servers.Windows IIS Web Servers - Perf - HTTP Requests'),
('43364984-742e-4361-a60d-815edea3fb2e','Service Plans.Windows Servers.Server Roles.Windows Web/Proxy Servers.Windows Apache Web Servers'),
('4edfe364-a95c-4606-bba2-e86acc92c8ee','Service Plans.Windows Servers.Server Roles.Windows Web/Proxy Servers.SharePoint Server 2007 (MOSS) Servers'),
('5286f8c1-d4d4-4036-87d1-3c0665c49efd','Service Plans.Windows Servers.Server Roles.Windows Web/Proxy Servers.SharePoint Server 2010 Servers'),
('54cf0c6a-6649-4e44-abe3-9369c1fde18e','Service Plans.Windows Servers.Server Roles.Windows Web/Proxy Servers.SharePoint Foundation 2010 Servers'),
('5b086cfd-64ea-4e3c-bc97-78e0a8a8a64a','Service Plans.Windows Servers.Server Roles.Windows Web/Proxy Servers.Windows IIS Web Servers - Perf - Errors Sec'),
('5c064102-d2a1-4be2-bffe-977f6a8bc3d0','Service Plans.Windows Servers.Server Roles.Windows Web/Proxy Servers.SharePoint Services WSS v3 Servers'),
('6d6a764e-a65e-4fd9-9be3-152fbcf363dd','Service Plans.Windows Servers.Server Roles.Windows Web/Proxy Servers.Windows IIS Web Servers - SVC-IISADMIN'),
('6e5782b1-6d3f-48c4-9071-6e1f5cceb9e7','Service Plans.Windows Servers.Server Roles.Windows Web/Proxy Servers.ISA Servers'),
('72fed961-f770-4030-b174-7e3276cb69f9','Service Plans.Windows Servers.Server Roles.Windows Web/Proxy Servers.SharePoint Services WSS v3 Servers'),
('7674be98-a6a6-423c-b64b-e04197c51a0f','Service Plans.Linux Machines.Server Roles.Linux Web/Proxy Servers.Linux HTTP-Apache2 Servers'),
('77505b9f-031b-4fcb-960b-1bade949f02c','Service Plans.Windows Servers.Server Roles.Windows Web/Proxy Servers.Windows IIS Web Servers - Perf - File Cache Hits %'),
('8efc2002-6626-4d31-9701-f6c434d1727b','Service Plans.Windows Servers.Server Roles.Windows Web/Proxy Servers.SharePoint Server 2007 (MOSS) Servers'),
('985d48c7-5824-4b3d-8a84-a7834da6abba','Service Plans.Windows Servers.Server Roles.Windows Web/Proxy Servers.SharePoint Server 2010 Servers'),
('9da84685-6662-4f59-b217-5b81bcfc4b4d','Service Plans.Windows Servers.Server Roles.Windows Web/Proxy Servers.SharePoint Server 2007 (MOSS) Servers'),
('bdd24b0b-4ed4-4879-b904-0e9bc13c29b3','Service Plans.Windows Servers.Server Roles.Windows Web/Proxy Servers.SharePoint Foundation 2010 Servers'),
('c68762fd-c092-4f8a-bb4b-d22193859dca','Service Plans.Windows Servers.Server Roles.Windows Web/Proxy Servers.ISA Servers'),
('c73f2c5e-05cc-4abb-9d39-c3bbe2ba463c','Service Plans.Windows Servers.Server Roles.Windows Web/Proxy Servers.ISA Servers'),
('cdc7f51e-1d60-4f25-96c4-ee36f907f4ac','Service Plans.Windows Servers.Server Roles.Windows Web/Proxy Servers.SharePoint Foundation 2010 Servers'),
('cefbc975-5dc2-407e-a9e2-ecd1cc38d40d','Service Plans.Windows Servers.Server Roles.Windows Web/Proxy Servers.SharePoint Services WSS v3 Servers'),
('d3e83619-ea34-498c-bfed-22bfc0f9f977','Service Plans.MAC Servers.Server Roles.OS X Web Services.OS X Web Services - Wiki Server'),
('d9b1e479-2360-421e-ac4e-7d6aeca51b5e','Service Plans.Windows Servers.Server Roles.Windows Web/Proxy Servers.ISA Servers'),
('df21e77c-f490-4f1c-8141-8e0c6bba7782','Service Plans.Windows Servers.Server Roles.Windows Web/Proxy Servers.Windows IIS Web Servers - Perf - Total Files Cached'),
('e6d1d340-1b8d-4b36-a332-2bf71184271c','Service Plans.Windows Servers.Server Roles.Windows Web/Proxy Servers.ISA Servers'),
('ea1e1b21-7906-4eb6-981a-09994bdda0e0','Service Plans.Linux Machines.Server Roles.Linux Web/Proxy Servers.Linux HTTP-Tomcat6 Servers'),
('ef02b722-f137-44ea-b4a5-2c6a940e5f1f','Service Plans.Windows Servers.Server Roles.Windows Web/Proxy Servers.Windows Apache Web Servers');

/*Table structure for table `plugin_iis_settings` */

DROP TABLE IF EXISTS `plugin_iis_settings`;

CREATE TABLE `plugin_iis_settings` (
  `SettingName` varchar(255) NOT NULL,
  `Value` int(11) NOT NULL,
  PRIMARY KEY (`SettingName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `plugin_iis_settings` */

insert  into `plugin_iis_settings`(`SettingName`,`Value`) values 
('AlertLevel',-1),
('DbVersion',5),
('FirstSave',0),
('IsSaving',0),
('IsSyncing',0),
('ReportCategory',7),
('TicketCategory',123),
('UseEdfs',1);

/*Table structure for table `plugin_messaging_appliedmonitors` */

DROP TABLE IF EXISTS `plugin_messaging_appliedmonitors`;

CREATE TABLE `plugin_messaging_appliedmonitors` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(200) NOT NULL,
  `CheckAction` int(11) NOT NULL,
  `AlertAction` int(11) NOT NULL,
  `AlertMessage` text NOT NULL,
  `ContactID` int(11) NOT NULL,
  `Interval` int(11) NOT NULL,
  `Where` varchar(255) NOT NULL,
  `What` varchar(255) NOT NULL,
  `DataOut` text NOT NULL,
  `Comparor` int(11) NOT NULL,
  `DataIn` varchar(200) NOT NULL,
  `IDField` varchar(500) NOT NULL,
  `AlertStyle` int(11) NOT NULL DEFAULT '0',
  `Changed` int(11) NOT NULL,
  `DataCollector` varchar(100) NOT NULL,
  `Category` int(11) NOT NULL,
  `TicketCategory` int(11) NOT NULL,
  `ScriptTarget` int(11) DEFAULT '1',
  `GUID` char(36) NOT NULL,
  `ServerType` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ContactID` (`ContactID`),
  KEY `Name` (`Name`),
  KEY `ServerType` (`ServerType`)
) ENGINE=InnoDB AUTO_INCREMENT=879 DEFAULT CHARSET=utf8;

/*Data for the table `plugin_messaging_appliedmonitors` */

insert  into `plugin_messaging_appliedmonitors`(`ID`,`Name`,`CheckAction`,`AlertAction`,`AlertMessage`,`ContactID`,`Interval`,`Where`,`What`,`DataOut`,`Comparor`,`DataIn`,`IDField`,`AlertStyle`,`Changed`,`DataCollector`,`Category`,`TicketCategory`,`ScriptTarget`,`GUID`,`ServerType`) values 
(132,'SVC-MSExchangeAB',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','MSExchangeAB',1,'1','',1,0,'',5,142,0,'8b8be336-debf-11e4-9762-0050560a08e8',0),
(133,'SVC-MSExchangeADTopology',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','MSExchangeADTopology',1,'1','',1,0,'',5,142,0,'8b8be3c9-debf-11e4-9762-0050560a08e8',0),
(134,'SVC-MSExchangeAntispamUpdate',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','MSExchangeAntispamUpdate',1,'1','',1,0,'',5,142,0,'8b8be419-debf-11e4-9762-0050560a08e8',0),
(135,'SVC-MSExchangeEdgeSync',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','MSExchangeEdgeSync',1,'1','',1,0,'',5,142,0,'8b8be462-debf-11e4-9762-0050560a08e8',0),
(136,'SVC-MSExchangeFBA',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','MSExchangeFBA',1,'1','',1,0,'',5,142,0,'8b8be4f3-debf-11e4-9762-0050560a08e8',0),
(137,'SVC-MSExchangeFDS',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','2','MSExchangeFDS',1,'1','',1,0,'',5,142,0,'8b8be552-debf-11e4-9762-0050560a08e8',0),
(138,'SVC-MSExchangeIS',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','MSExchangeIS',1,'1','',1,0,'',5,142,0,'8b8be598-debf-11e4-9762-0050560a08e8',0),
(139,'SVC-MSExchangeMailboxAssistants',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','MSExchangeMailboxAssistants',1,'1','',1,0,'',5,142,0,'8b8be5f2-debf-11e4-9762-0050560a08e8',0),
(140,'SVC-MSExchangeMailboxReplication',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','MSExchangeMailboxReplication',1,'1','',1,0,'',5,142,0,'8b8be63a-debf-11e4-9762-0050560a08e8',0),
(141,'SVC-MSExchangeMailSubmission',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','MSExchangeMailSubmission',1,'1','',1,0,'',5,142,0,'8b8be681-debf-11e4-9762-0050560a08e8',0),
(142,'SVC-MSExchangeProtectedServiceHost',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','MSExchangeProtectedServiceHost',1,'1','',1,0,'',5,142,0,'8b8be6c4-debf-11e4-9762-0050560a08e8',0),
(143,'SVC-MSExchangeRepl',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','MSExchangeRepl',1,'1','',1,0,'',5,142,0,'8b8be707-debf-11e4-9762-0050560a08e8',0),
(144,'SVC-MSExchangeRPC',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','MSExchangeRPC',1,'1','',1,0,'',5,142,0,'8b8be763-debf-11e4-9762-0050560a08e8',0),
(145,'SVC-MSExchangeSA',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','MSExchangeSA',1,'1','',1,0,'',5,142,0,'8b8be7b8-debf-11e4-9762-0050560a08e8',0),
(146,'SVC-MSExchangeSearch',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','MSExchangeSearch',1,'1','',1,0,'',5,142,0,'8b8be7fe-debf-11e4-9762-0050560a08e8',0),
(147,'SVC-MSExchangeServiceHost',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','MSExchangeServiceHost',1,'1','',1,0,'',5,142,0,'8b8be852-debf-11e4-9762-0050560a08e8',0),
(148,'SVC-MSExchangeThrottling',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','MSExchangeThrottling',1,'1','',1,0,'',5,142,0,'8b8be895-debf-11e4-9762-0050560a08e8',0),
(149,'SVC-MSExchangeTransport',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','MSExchangeTransport',1,'1','',1,0,'',5,142,0,'8b8be8d8-debf-11e4-9762-0050560a08e8',0),
(150,'SVC-MSExchangeTransportLogSearch',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','MSExchangeTransportLogSearch',1,'1','',1,0,'',5,142,0,'8b8be91a-debf-11e4-9762-0050560a08e8',0),
(212,'SVC-BBAttachServer',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','BBAttachServer',1,'1','',1,0,'',5,134,0,'746f721f-debe-11e4-9762-0050560a08e8',1),
(213,'SVC-BlackBerry Controller',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','BlackBerry Controller',1,'1','',1,0,'',5,134,0,'746f72ac-debe-11e4-9762-0050560a08e8',1),
(214,'SVC-BlackBerry Dispatcher',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','BlackBerry Dispatcher',1,'1','',1,0,'',5,134,0,'746f72f8-debe-11e4-9762-0050560a08e8',1),
(215,'SVC-BlackBerry Router',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','BlackBerry Router',1,'1','',1,0,'',5,134,0,'746f7341-debe-11e4-9762-0050560a08e8',1),
(216,'SVC-BlackBerry Server Alert',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','BlackBerry Server Alert',1,'1','',1,0,'',5,134,0,'746f73ce-debe-11e4-9762-0050560a08e8',1),
(323,'EV - 15002 Exchange Backpressure',6,3,'%NAME%~~~%RESULT%|tzcompdisabled=1|priority=3',0,300,'127.0.0.1','6','*!!!0!!!MSExchangeTransport!!!15002!!!*',1,'1','',1,0,'',16,106,0,'e366d483-debe-11e4-9762-0050560a08e8',0),
(324,'EV - 15004 Exchange Backpressure',6,3,'%NAME%~~~%RESULT%|tzcompdisabled=1|priority=3',0,300,'127.0.0.1','6','*!!!0!!!MSExchangeTransport!!!15004!!!*',1,'1','',1,0,'',16,106,0,'e366d541-debe-11e4-9762-0050560a08e8',0),
(325,'EV - 15002 Exchange Backpressure',6,3,'%NAME%~~~%RESULT%|tzcompdisabled=1|priority=3',0,300,'127.0.0.1','6','*!!!0!!!MSExchangeTransport!!!15002!!!*',1,'1','',1,0,'',16,106,0,'8b8be966-debf-11e4-9762-0050560a08e8',0),
(326,'EV - 15006 Exchange Backpressure',6,3,'%NAME%~~~%RESULT%|tzcompdisabled=1|priority=3',0,300,'127.0.0.1','6','*!!!0!!!MSExchangeTransport!!!15006!!!*',1,'1','',1,0,'',16,106,0,'8b8be9a9-debf-11e4-9762-0050560a08e8',0),
(327,'EV - 2153 DAG Communication',6,3,'%NAME%~~~%RESULT%|tzcompdisabled=1|priority=3',0,300,'127.0.0.1','6','*!!!0!!!MSExchangeRepl!!!2153!!!*',1,'1','',1,0,'',16,106,0,'8b8bea14-debf-11e4-9762-0050560a08e8',0),
(332,'SVC-MSExchangeADAM',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','ADAM_MSExchange',1,'1','',1,0,'',5,142,0,'8b8bea5f-debf-11e4-9762-0050560a08e8',0),
(333,'SVC-MSExchangeEdgeCredential',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','MSExchangeEdgeCredential',1,'1','',1,0,'',5,142,0,'8b8beaa4-debf-11e4-9762-0050560a08e8',0),
(334,'SVC-MSExchangeIMAP4',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','MSExchangeIMAP4',1,'1','',1,0,'',5,142,0,'8b8beae8-debf-11e4-9762-0050560a08e8',0),
(335,'SVC-MSExchangePOP3',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','MSExchangePOP3',1,'1','',1,0,'',5,142,0,'8b8beb28-debf-11e4-9762-0050560a08e8',0),
(336,'SVC-MSSpeechService',6,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','MSSpeechService',1,'1','',1,0,'',5,142,0,'8b8beb69-debf-11e4-9762-0050560a08e8',0),
(337,'SVC-MSExchangeUM',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','MSExchangeUM',1,'1','',1,0,'',5,142,0,'8b8beba8-debf-11e4-9762-0050560a08e8',0),
(338,'SVC-MSExchangeADAM',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','ADAM_MSExchange',1,'1','',1,0,'',5,142,0,'e366d5c3-debe-11e4-9762-0050560a08e8',0),
(339,'SVC-MSExchangeIMAP4',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','MSExchangeIMAP4',1,'1','',1,0,'',5,142,0,'e366d641-debe-11e4-9762-0050560a08e8',0),
(340,'SVC-MSExchangePOP3',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','MSExchangePOP3',1,'1','',1,0,'',5,142,0,'e366d6cb-debe-11e4-9762-0050560a08e8',0),
(341,'SVC-MSSpeechService',6,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','MSSpeechService',1,'1','',1,0,'',5,142,0,'e366d750-debe-11e4-9762-0050560a08e8',0),
(342,'SVC-MSExchangeUM',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','MSExchangeUM',1,'1','',1,0,'',5,142,0,'e366d7cc-debe-11e4-9762-0050560a08e8',0),
(343,'SVC-MSExchangeADTopology',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','MSExchangeADTopology',1,'1','',1,0,'',5,142,0,'e366d843-debe-11e4-9762-0050560a08e8',0),
(344,'SVC-MSExchangeAntispamUpdate',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','MSExchangeAntispamUpdate',1,'1','',1,0,'',5,142,0,'e366d8bb-debe-11e4-9762-0050560a08e8',0),
(345,'SVC-MSExchangeEdgeSync',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','MSExchangeEdgeSync',1,'1','',1,0,'',5,142,0,'e366d92e-debe-11e4-9762-0050560a08e8',0),
(346,'SVC-MSExchangeFDS',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','MSExchangeFDS',1,'1','',1,0,'',5,142,0,'e366d998-debe-11e4-9762-0050560a08e8',0),
(347,'SVC-MSExchangeIS',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','MSExchangeIS',1,'1','',1,0,'',5,142,0,'e366da10-debe-11e4-9762-0050560a08e8',0),
(348,'SVC-MSExchangeMailboxAssistants',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','MSExchangeMailboxAssistants',1,'1','',1,0,'',5,142,0,'e366da95-debe-11e4-9762-0050560a08e8',0),
(349,'SVC-MSExchangeMailSubmission',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','MSExchangeMailSubmission',1,'1','',1,0,'',5,142,0,'e366db11-debe-11e4-9762-0050560a08e8',0),
(350,'SVC-MSExchangeRepl',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','MSExchangeRepl',1,'1','',1,0,'',5,142,0,'e366db85-debe-11e4-9762-0050560a08e8',0),
(351,'SVC-MSExchangeSA',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','MSExchangeSA',1,'1','',1,0,'',5,142,0,'e366dbf7-debe-11e4-9762-0050560a08e8',0),
(352,'SVC-MSExchangeSearch',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','MSExchangeSearch',1,'1','',1,0,'',5,142,0,'e366dc66-debe-11e4-9762-0050560a08e8',0),
(353,'SVC-MSExchangeServiceHost',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','MSExchangeServiceHost',1,'1','',1,0,'',5,142,0,'e366dce3-debe-11e4-9762-0050560a08e8',0),
(354,'SVC-MSExchangeTransport',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','MSExchangeTransport',1,'1','',1,0,'',5,142,0,'e366dd6a-debe-11e4-9762-0050560a08e8',0),
(355,'SVC-MSExchangeTransportLogSearch',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','MSExchangeTransportLogSearch',1,'1','',1,0,'',5,142,0,'e366dde1-debe-11e4-9762-0050560a08e8',0),
(356,'SVC-EdgeCredentialSvc',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','EdgeCredentialSvc',1,'1','',1,0,'',5,142,0,'e366de5f-debe-11e4-9762-0050560a08e8',0),
(414,'EV - 15004 Exchange Backpressure',6,3,'%NAME%~~~%RESULT%|tzcompdisabled=1|priority=3',0,300,'127.0.0.1','6','*!!!0!!!MSExchangeTransport!!!15004!!!*',1,'1','',1,0,'',16,106,0,'8b8bebec-debf-11e4-9762-0050560a08e8',0),
(415,'EV - 15006 Exchange Backpressure',6,3,'%NAME%~~~%RESULT%|tzcompdisabled=1|priority=3',0,300,'127.0.0.1','6','*!!!0!!!MSExchangeTransport!!!15006!!!*',1,'1','',1,0,'',16,106,0,'e366dee0-debe-11e4-9762-0050560a08e8',0),
(416,'EV - 2090 DAG Failover',6,3,'%NAME%~~~%RESULT%|tzcompdisabled=1|priority=3',0,300,'127.0.0.1','6','*!!!0!!!MSExchangeRepl!!!2090!!!*',1,'1','',1,0,'',16,106,0,'8b8bec2c-debf-11e4-9762-0050560a08e8',0),
(417,'EV -  4110 DAG Log Replay Suspended',6,3,'%NAME%~~~%RESULT%|tzcompdisabled=1|priority=5',0,600,'127.0.0.1','6','*!!!0!!!MSExchangeRepl!!!4110!!!*',1,'1','',1,0,'',16,106,0,'8b8bec6d-debf-11e4-9762-0050560a08e8',0),
(418,'EV - 10036 DAG Block Mode',6,3,'%NAME%~~~%RESULT%|tzcompdisabled=1|priority=5',0,600,'127.0.0.1','6','*!!!0!!!MSExchangeRepl!!!10036!!!*',1,'1','',1,0,'',16,106,0,'8b8becab-debf-11e4-9762-0050560a08e8',0),
(419,'EV -  4111 DAG Log Replay Resumed',6,3,'%NAME%~~~%RESULT%|tzcompdisabled=1|priority=5',0,600,'127.0.0.1','6','*!!!0!!!MSExchangeRepl!!!4111!!!*',1,'1','',1,0,'',16,106,0,'8b8becec-debf-11e4-9762-0050560a08e8',0),
(420,'EV - 1204 Cluster Offline',6,3,'%NAME%~~~%RESULT%|tzcompdisabled=1|priority=5',0,300,'127.0.0.1','6','*!!!0!!!FailoverClustering!!!1204!!!*',1,'1','',1,0,'',16,105,0,'8b8bed2a-debf-11e4-9762-0050560a08e8',0),
(421,'EV - 1561 Cluster Offline',6,3,'%NAME%~~~%RESULT%|tzcompdisabled=1|priority=3',0,300,'127.0.0.1','6','*!!!0!!!FailoverClustering!!!1561!!!*',1,'1','',1,0,'',16,105,0,'8b8bed6a-debf-11e4-9762-0050560a08e8',0),
(422,'EV - 1062 Cluster Online',6,3,'%NAME%~~~%RESULT%|tzcompdisabled=1|priority=5',0,300,'127.0.0.1','6','*!!!0!!!FailoverClustering!!!1062!!!*',1,'1','',1,0,'',16,105,0,'8b8bedab-debf-11e4-9762-0050560a08e8',0),
(423,'EV - 1125 Cluster Online',6,3,'%NAME%~~~%RESULT%|tzcompdisabled=1|priority=5',0,300,'127.0.0.1','6','*!!!0!!!FailoverClustering!!!1125!!!*',1,'1','',1,0,'',16,105,0,'8b8bedea-debf-11e4-9762-0050560a08e8',0),
(457,'Perf - LDAP Read Time',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,300,'127.0.0.1','0','MSExchange ADAccess Domain Controllers!!!LDAP Read Time!!!*',4,'100','',1,0,'Collect,Collect',7,122,0,'8b8bee2f-debf-11e4-9762-0050560a08e8',0),
(458,'Perf - LDAP Search Time',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,300,'127.0.0.1','0','MSExchange ADAccess Domain Controllers!!!LDAP Search Time!!!*',4,'100','',1,0,'Collect,Collect',7,122,0,'8b8bee98-debf-11e4-9762-0050560a08e8',0),
(459,'Perf - LDAP Searches Timed Out',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','MSExchange ADAccess Domain Controllers!!!LDAP Searches Timed Out per Minute!!!',4,'10','',1,0,'Collect,Collect',7,122,0,'8b8beedf-debf-11e4-9762-0050560a08e8',0),
(460,'Perf - Long Running LDAP Operations',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','MSExchange ADAccess Domain Controllers!!!Long Running LDAP Operations/min!!!*',4,'50','',1,0,'Collect,Collect',7,122,0,'8b8bef1f-debf-11e4-9762-0050560a08e8',0),
(461,'Perf - OWA Average Search Time',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','MSExchange OWA!!!Average Search Time!!!',4,'5000','',1,0,'Collect,Collect',7,122,0,'8b8bef5f-debf-11e4-9762-0050560a08e8',0),
(462,'Perf - RPC Average Latency',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','MSExchange RpcClientAccess!!!RPC Averaged Latency!!!',4,'250','',1,0,'Collect,Collect',7,122,0,'8b8befa5-debf-11e4-9762-0050560a08e8',0),
(463,'Perf - RPC Requests CAS',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','MSExchange RpcClientAccess!!!RPC Requests!!!',4,'40','',1,0,'Collect,Collect',7,122,0,'8b8befe6-debf-11e4-9762-0050560a08e8',0),
(464,'Perf - RPC Requests IS',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','MSExchangeIS!!!RPC Requests!!!',4,'70','',1,0,'Collect,Collect',7,122,0,'8b8bf025-debf-11e4-9762-0050560a08e8',0),
(465,'Perf - RPC Average Latency IS',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','MSExchangeIS!!!RPC Averaged Latency!!!',4,'25','',1,0,'Collect,Collect',7,122,0,'8b8bf066-debf-11e4-9762-0050560a08e8',0),
(466,'Perf - RPC Average Latency MBX',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','MSExchangeIS Mailbox!!!RPC Average Latency!!!',4,'25','',1,0,'Collect,Collect',7,122,0,'8b8bf0a6-debf-11e4-9762-0050560a08e8',0),
(467,'Perf - Messages Queued for Submission',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','MSExchangeIS Mailbox!!!Messages Queued For Submission!!!_Total',4,'50','',1,0,'Collect,Collect',7,122,0,'8b8bf0e5-debf-11e4-9762-0050560a08e8',0),
(468,'Perf - Messages Queued for Submission Public',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','MSExchangeIS Public!!!Messages Queued For Submission!!!_Total',4,'20','',1,0,'Collect,Collect',7,122,0,'8b8bf128-debf-11e4-9762-0050560a08e8',0),
(469,'Perf - Log Generation Checkpoint Depth',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','MSExchange Database ==> Instances!!!Log Generation Checkpoint Depth!!!',4,'500','',1,0,'Collect,Collect',7,122,0,'8b8bf16d-debf-11e4-9762-0050560a08e8',0),
(470,'Perf - Database Page Fault Stalls/sec',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','MSExchange Database!!!Database Page Fault Stalls/sec!!!Information Store',1,'0','',1,0,'Collect,Collect',7,122,0,'8b8bf1ab-debf-11e4-9762-0050560a08e8',0),
(471,'Perf - Version Buckets Allocated',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','MSExchange Database!!!Version Buckets Allocated!!!Information Store',4,'12000','',1,0,'Collect,Collect',7,122,0,'8b8bfe31-debf-11e4-9762-0050560a08e8',0),
(472,'Perf - Aggregate Delivery Queue Length',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','MSExchangeTransport Queues!!!Aggregate Delivery Queue Length (All Queues)!!!_total',4,'3000','',1,0,'Collect,Collect',7,122,0,'8b8bfe7e-debf-11e4-9762-0050560a08e8',0),
(473,'Perf - Active Remote Delivery Queue Length',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','MSExchangeTransport Queues!!!Active Remote Delivery Queue Length!!!_total',4,'250','',1,0,'Collect,Collect',7,122,0,'8b8bfec3-debf-11e4-9762-0050560a08e8',0),
(474,'Perf - Active Mailbox Delivery Queue',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','MSExchangeTransport Queues!!!Active Mailbox Delivery Queue Length!!!_total',4,'250','',1,0,'Collect,Collect',7,122,0,'8b8bff09-debf-11e4-9762-0050560a08e8',0),
(475,'Perf - Submission Queue Length',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','MSExchangeTransport Queues!!!Submission Queue Length!!!_total',4,'500','',1,0,'Collect,Collect',7,122,0,'8b8bff4b-debf-11e4-9762-0050560a08e8',0),
(476,'Perf - Active Non-SMTP Delivery Queue',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','MSExchangeTransport Queues!!!Active Non-Smtp Delivery Queue Length!!!_total',4,'250','',1,0,'Collect,Collect',7,122,0,'8b8bff90-debf-11e4-9762-0050560a08e8',0),
(477,'Perf - Retry Remote Delivery Queue Length',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','MSExchangeTransport Queues!!!Retry Remote Delivery Queue Length!!!_total',4,'100','',1,0,'Collect,Collect',7,122,0,'8b8c0037-debf-11e4-9762-0050560a08e8',0),
(478,'Perf - Unreachable Queue Length',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','MSExchangeTransport Queues!!!Unreachable Queue Length!!!_total',4,'100','',1,0,'Collect,Collect',7,122,0,'8b8c00de-debf-11e4-9762-0050560a08e8',0),
(479,'Perf - Largest Delivery Queue Length',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','MSExchangeTransport Queues!!!Largest Delivery Queue Length!!!_total',4,'200','',1,0,'Collect,Collect',7,122,0,'8b8c0166-debf-11e4-9762-0050560a08e8',0),
(480,'Perf - Poison Queue Length',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%. Explanation The Poison Queue Length performance counter measures the number of messages currently in the poison queue. Messages in the poison message queue are in a permanently suspended state.This alert indicates that the Poison Queue Length has been greater than 1 for five minutes. The poison message queue contains messages that are determined to be potentially harmful to the Microsoft Exchange Server 2007 server after a server failure. The messages may be genuinely harmful in their content and format. Alternatively, they may be the results of a poorly written agent that has caused the Exchange server to fail when it processed the supposedly bad messages.Messages remain in the poison message queue until they are manually resumed or removed by an administrator. The messages in the poison message queue are never automatically resumed or expired.  User Action To resolve this alert, resubmit or remove the messages from the poison message queue. You can resubmit the messages that are in the poison message queue by using the Exchange Queue Viewer or by running the Resume-Message cmdlet. You can remove messages from the poison message queue by using Queue Viewer or by running the Remove-Message cmdlet.  |tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','MSExchangeTransport Queues!!!Poison Queue Length!!!_total',1,'0','',1,0,'Collect,Collect',7,122,0,'8b8c0262-debf-11e4-9762-0050560a08e8',0),
(481,'Perf - OWA Average Response Time',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','MSExchange OWA!!!Average Response Time!!!',4,'200','',1,0,'Collect,Collect',7,122,0,'8b8c02e6-debf-11e4-9762-0050560a08e8',0),
(488,'Perf - LDAP Read Time',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,300,'127.0.0.1','0','MSExchange ADAccess Domain Controllers!!!LDAP Read Time!!!*',4,'100','',1,0,'Collect,Collect',7,122,0,'e366df6a-debe-11e4-9762-0050560a08e8',0),
(489,'Perf - LDAP Search Time',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,300,'127.0.0.1','0','MSExchange ADAccess Domain Controllers!!!LDAP Search Time!!!*',4,'100','',1,0,'Collect,Collect',7,122,0,'e366dff8-debe-11e4-9762-0050560a08e8',0),
(490,'Perf - LDAP Searches Timed Out',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','MSExchange ADAccess Domain Controllers!!!LDAP Searches Timed Out per Minute!!!',4,'10','',1,0,'Collect,Collect',7,122,0,'e366e07b-debe-11e4-9762-0050560a08e8',0),
(491,'Perf - Long Running LDAP Operations',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','MSExchange ADAccess Domain Controllers!!!Long Running LDAP Operations/min!!!*',4,'50','',1,0,'Collect,Collect',7,122,0,'e366e0f2-debe-11e4-9762-0050560a08e8',0),
(492,'Perf - OWA Average Search Time',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','MSExchange OWA!!!Average Search Time!!!',4,'5000','',1,0,'Collect,Collect',7,122,0,'e366e175-debe-11e4-9762-0050560a08e8',0),
(493,'Perf - RPC Average Latency',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','MSExchange RpcClientAccess!!!RPC Averaged Latency!!!',4,'250','',1,0,'Collect,Collect',7,122,0,'e366e1ec-debe-11e4-9762-0050560a08e8',0),
(494,'Perf - RPC Requests CAS',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','MSExchange RpcClientAccess!!!RPC Requests!!!',4,'40','',1,0,'Collect,Collect',7,122,0,'e366e260-debe-11e4-9762-0050560a08e8',0),
(495,'Perf - RPC Requests IS',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','MSExchangeIS!!!RPC Requests!!!',4,'70','',1,0,'Collect,Collect',7,122,0,'e366e2d2-debe-11e4-9762-0050560a08e8',0),
(496,'Perf - RPC Average Latency IS',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','MSExchangeIS!!!RPC Averaged Latency!!!',4,'25','',1,0,'Collect,Collect',7,122,0,'e366e345-debe-11e4-9762-0050560a08e8',0),
(497,'Perf - RPC Average Latency MBX',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','MSExchangeIS Mailbox!!!RPC Average Latency!!!',4,'25','',1,0,'Collect,Collect',7,122,0,'e366e409-debe-11e4-9762-0050560a08e8',0),
(498,'Perf - Messages Queued for Submission',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','MSExchangeIS Mailbox!!!Messages Queued For Submission!!!_Total',4,'50','',1,0,'Collect,Collect',7,122,0,'e366e487-debe-11e4-9762-0050560a08e8',0),
(499,'Perf - Messages Queued for Submission Public',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','MSExchangeIS Public!!!Messages Queued For Submission!!!_Total',4,'20','',1,0,'Collect,Collect',7,122,0,'e366e4f8-debe-11e4-9762-0050560a08e8',0),
(500,'Perf - Log Generation Checkpoint Depth',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','MSExchange Database ==> Instances!!!Log Generation Checkpoint Depth!!!',4,'500','',1,0,'Collect,Collect',7,122,0,'e366e561-debe-11e4-9762-0050560a08e8',0),
(501,'Perf - Database Page Fault Stalls/sec',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','MSExchange Database!!!Database Page Fault Stalls/sec!!!Information Store',1,'0','',1,0,'Collect,Collect',7,122,0,'e366e5ce-debe-11e4-9762-0050560a08e8',0),
(502,'Perf - Version Buckets Allocated',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','MSExchange Database!!!Version Buckets Allocated!!!Information Store',4,'12000','',1,0,'Collect,Collect',7,122,0,'e366e63c-debe-11e4-9762-0050560a08e8',0),
(503,'Perf - Aggregate Delivery Queue Length',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','MSExchangeTransport Queues!!!Aggregate Delivery Queue Length (All Queues)!!!_total',4,'3000','',1,0,'Collect,Collect',7,122,0,'e366e6c8-debe-11e4-9762-0050560a08e8',0),
(504,'Perf - Active Remote Delivery Queue Length',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','MSExchangeTransport Queues!!!Active Remote Delivery Queue Length!!!_total',4,'250','',1,0,'Collect,Collect',7,122,0,'e366e73e-debe-11e4-9762-0050560a08e8',0),
(505,'Perf - Active Mailbox Delivery Queue',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','MSExchangeTransport Queues!!!Active Mailbox Delivery Queue Length!!!_total',4,'250','',1,0,'Collect,Collect',7,122,0,'e366e7bd-debe-11e4-9762-0050560a08e8',0),
(506,'Perf - Submission Queue Length',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','MSExchangeTransport Queues!!!Submission Queue Length!!!_total',4,'500','',1,0,'Collect,Collect',7,122,0,'e366e831-debe-11e4-9762-0050560a08e8',0),
(507,'Perf - Active Non-SMTP Delivery Queue',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','MSExchangeTransport Queues!!!Active Non-Smtp Delivery Queue Length!!!_total',4,'250','',1,0,'Collect,Collect',7,122,0,'e366e8a3-debe-11e4-9762-0050560a08e8',0),
(508,'Perf - Retry Remote Delivery Queue Length',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','MSExchangeTransport Queues!!!Retry Remote Delivery Queue Length!!!_total',4,'100','',1,0,'Collect,Collect',7,122,0,'e366e917-debe-11e4-9762-0050560a08e8',0),
(509,'Perf - Unreachable Queue Length',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','MSExchangeTransport Queues!!!Unreachable Queue Length!!!_total',4,'100','',1,0,'Collect,Collect',7,122,0,'e366e98b-debe-11e4-9762-0050560a08e8',0),
(510,'Perf - Largest Delivery Queue Length',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','MSExchangeTransport Queues!!!Largest Delivery Queue Length!!!_total',4,'200','',1,0,'Collect,Collect',7,122,0,'e366fbea-debe-11e4-9762-0050560a08e8',0),
(511,'Perf - Poison Queue Length',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.Explanation The Poison Queue Length performance counter measures the number of messages currently in the poison queue. Messages in the poison message queue are in a permanently suspended state. This alert indicates that the Poison Queue Length has been greater than 1 for five minutes. The poison message queue contains messages that are determined to be potentially harmful to the Microsoft Exchange Server 2007 server after a server failure. The messages may be genuinely harmful in their content and format. Alternatively, they may be the results of a poorly written agent that has caused the Exchange server to fail when it processed the supposedly bad messages. Messages remain in the poison message queue until they are manually resumed or removed by an administrator. The messages in the poison message queue are never automatically resumed or expired. User Action To resolve this alert, resubmit or remove the messages from the poison message queue. You can resubmit the messages that are in the poison message queue by using the Exchange Queue Viewer or by running the Resume-Message cmdlet. You can remove messages from the poison message queue by using Queue Viewer or by running the Remove-Message cmdlet.  |tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','MSExchangeTransport Queues!!!Poison Queue Length!!!_total',1,'0','',1,0,'Collect,Collect',7,122,0,'e366fccf-debe-11e4-9762-0050560a08e8',0),
(512,'Perf - OWA Average Response Time',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','MSExchange OWA!!!Average Response Time!!!',4,'200','',1,0,'Collect,Collect',7,122,0,'e366fd87-debe-11e4-9762-0050560a08e8',0),
(513,'SVC-IMAP4Svc',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','IMAP4Svc',1,'1','',1,0,'',5,142,0,'adb1dd0b-debe-11e4-9762-0050560a08e8',0),
(514,'SVC-MSExchangeIS',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','MSExchangeIS',1,'1','',1,0,'',5,142,0,'adb1ddd7-debe-11e4-9762-0050560a08e8',0),
(515,'SVC-MSExchangeMGMT',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','MSExchangeMGMT',1,'1','',1,0,'',5,142,0,'adb1de8b-debe-11e4-9762-0050560a08e8',0),
(516,'SVC-MSExchangeMTA',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','MSExchangeMTA',1,'1','',1,0,'',5,142,0,'adb1df05-debe-11e4-9762-0050560a08e8',0),
(517,'SVC-POP3Svc',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','POP3Svc',1,'1','',1,0,'',5,142,0,'adb1df88-debe-11e4-9762-0050560a08e8',0),
(518,'SVC-RESvc',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','RESvc',1,'1','',1,0,'',5,142,0,'adb1dff7-debe-11e4-9762-0050560a08e8',0),
(519,'SVC-MSExchangeSA',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','MSExchangeSA',1,'1','',1,0,'',5,142,0,'adb1e06f-debe-11e4-9762-0050560a08e8',0),
(520,'Perf - Work Queue Length',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','MSExchangeMTA!!!Work Queue Length!!!',4,'10','',1,0,'Collect,Collect',7,122,0,'adb1e117-debe-11e4-9762-0050560a08e8',0),
(521,'Perf - RPC Requests',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','MSExchangeIS!!!RPC Requests!!!',4,'30','',1,0,'Collect,Collect',7,122,0,'adb1e192-debe-11e4-9762-0050560a08e8',0),
(522,'Perf - RPC Averaged Latency',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','MSExchangeIS!!!RPC Averaged Latency!!!',4,'50','',1,0,'Collect,Collect',7,122,0,'adb1e226-debe-11e4-9762-0050560a08e8',0),
(523,'Perf - Send Queue Size',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','MSExchangeIS Public!!!Send Queue Size!!!',4,'500','',1,0,'Collect,Collect',7,122,0,'adb1e29f-debe-11e4-9762-0050560a08e8',0),
(524,'Perf - Receive Queue Size',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','MSexchangeIS Public!!!Recieve Queue Size!!!',4,'500','',1,0,'Collect,Collect',7,122,0,'adb1e356-debe-11e4-9762-0050560a08e8',0),
(525,'Perf - Local Queue Length',5,1,'Local Queue Length|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','SMTP Server!!!Local Queue Length!!!',4,'1000','',1,0,'Collect,Collect',7,122,0,'adb1e3d1-debe-11e4-9762-0050560a08e8',0),
(526,'Perf - Remote Queue Length',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','SMTP Server!!!Remote Queue Length!!!',4,'1000','',1,0,'Collect,Collect',7,122,0,'adb1e45f-debe-11e4-9762-0050560a08e8',0),
(527,'Perf - Categorizer Queue Length',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','SMTP Server!!!Categorizer Queue Length!!!',4,'10','',1,0,'Collect,Collect',7,122,0,'adb1e4db-debe-11e4-9762-0050560a08e8',0),
(528,'Perf - Send Queue Size',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','MSExchange IS!!!Send Queue Size!!!',4,'500','',1,0,'Collect,Collect',7,122,0,'adb1e54c-debe-11e4-9762-0050560a08e8',0),
(530,'SVC-SMTPSVC',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','SMTPSVC',1,'1','',1,0,'',5,142,0,'adb1e5e8-debe-11e4-9762-0050560a08e8',0),
(645,'EV - Exchange DB Size',6,3,'%NAME%~~~%RESULT%|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','6','*!!!0!!!MSExchangeIS Mailbox Store!!!9690!!!*',1,'1','',1,0,'',16,106,0,'adb1e684-debe-11e4-9762-0050560a08e8',0),
(666,'Perf - Logical Connections',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,300,'127.0.0.1','0','MSSQL$BLACKBERRY:General Statistics!!!Logical Connections!!!',6,'','',1,0,'Collect,Collect',7,121,0,'746f7422-debe-11e4-9762-0050560a08e8',1),
(667,'Perf - User Connections',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,300,'127.0.0.1','0','MSSQL$BLACKBERRY:General Statistics!!!User Connections!!!',6,'','',1,0,'Collect,Collect',7,121,0,'746f746a-debe-11e4-9762-0050560a08e8',1),
(668,'Perf - Processes Blocked',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','MSSQL$BLACKBERRY:General Statistics!!!Processes blocked!!!',6,'','',1,0,'Collect,Collect',7,121,0,'746f74ae-debe-11e4-9762-0050560a08e8',1),
(669,'Perf - DTC Calls',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','MSSQL$BLACKBERRY:Exec Statistics!!!DTC calls!!!',6,'','',1,0,'Collect,Collect',7,121,0,'746f7513-debe-11e4-9762-0050560a08e8',1),
(701,'SVC-MSExchangeHM',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','MSExchangeHM',1,'1','',1,0,'',0,175,0,'36188f80-f4fd-11e4-b939-0800200c9a66',0),
(702,'Exchange 2013 - Managed Availability Health',6,3,'%RESULT%!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME%. You should investigate issue(s) further by going to the Exchange management tab on the affected agent in the Control Center. To further investigate health set alerting causes and understand remediation actions taken by Managed Availability visit TechNet for Exchange 2013 Documentation.\n\n%RESULT%',0,60,'','8468','',1,'0','0',1,0,'',0,175,0,'8886cd00-fa79-11e4-b939-0800200c9a66',0),
(704,'Exchange 2016 - Managed Availability Health',6,3,'%RESULT%!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME%. You should investigate issue(s) further by going to the Exchange management tab on the affected agent in the Control Center. To further investigate health set alerting causes and understand remediation actions taken by Managed Availability visit TechNet for Exchange 2016 Documentation.\n\n%RESULT%',0,60,'','8468','',1,'0','0',1,0,'',0,175,0,'0BB919F8-D07C-4699-9A56-A865468E513A',0),
(838,'SVC-dovecot',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','dovecot',1,'1','',1,0,'',5,134,0,'754f7880-debc-11e4-9762-0050560a08e8',2),
(839,'SVC-exim4',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','exim4',1,'1','',1,0,'',5,134,0,'682246ab-debd-11e4-9762-0050560a08e8',3),
(840,'SVC-postfix',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','postfix',1,'1','',1,0,'',5,134,0,'8b9b9589-debd-11e4-9762-0050560a08e8',4),
(865,'SVC-mail',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|MacService=mail|tzcompdisabled=1|priority=5',0,120,'127.0.0.1','7','serveradmin status mail',5,'RUNNING','',1,0,'',5,134,0,'f4ea144f-debd-11e4-9762-0050560a08e8',8),
(867,'SVC-addressbook',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|MacService=addressbook|tzcompdisabled=1|priority=5',0,120,'127.0.0.1','7','serveradmin status addressbook',5,'RUNNING','',1,0,'',5,134,0,'a614797b-debd-11e4-9762-0050560a08e8',5),
(868,'SVC-calendar',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|MacService=calendar|tzcompdisabled=1|priority=5',0,120,'127.0.0.1','7','serveradmin status calendar',5,'RUNNING','',1,0,'',5,134,0,'c609000e-debd-11e4-9762-0050560a08e8',6),
(872,'SVC-jabber',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|MacService=jabber|tzcompdisabled=1|priority=5',0,120,'127.0.0.1','7','serveradmin status jabber',5,'RUNNING','',1,0,'',5,134,0,'df8e38f9-debd-11e4-9762-0050560a08e8',7),
(878,'SVC-notification',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|MacService=notification|tzcompdisabled=1|priority=5',0,120,'127.0.0.1','7','serveradmin status notification',5,'RUNNING','',1,0,'',5,134,0,'3e2c929f-debe-11e4-9762-0050560a08e8',9);

/*Table structure for table `plugin_messaging_appliesto` */

DROP TABLE IF EXISTS `plugin_messaging_appliesto`;

CREATE TABLE `plugin_messaging_appliesto` (
  `MonitorGUID` char(36) NOT NULL,
  `Versions` varchar(100) NOT NULL DEFAULT '',
  `Roles` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`MonitorGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `plugin_messaging_appliesto` */

insert  into `plugin_messaging_appliesto`(`MonitorGUID`,`Versions`,`Roles`) values 
('0BB919F8-D07C-4699-9A56-A865468E513A','Exchange 2016 Servers',''),
('36188f80-f4fd-11e4-b939-0800200c9a66','Exchange 2013 Servers',''),
('3e2c929f-debe-11e4-9762-0050560a08e8','OS X Messaging - Mail - Notification',''),
('59F97147-29D0-4510-AAF9-B0B472C1FCD1','Exchange 2016 Servers',''),
('682246ab-debd-11e4-9762-0050560a08e8','Linux SMTP-Exim4 Servers',''),
('746f721f-debe-11e4-9762-0050560a08e8','Blackberry',''),
('746f72ac-debe-11e4-9762-0050560a08e8','Blackberry',''),
('746f72f8-debe-11e4-9762-0050560a08e8','Blackberry',''),
('746f7341-debe-11e4-9762-0050560a08e8','Blackberry',''),
('746f73ce-debe-11e4-9762-0050560a08e8','Blackberry',''),
('746f7422-debe-11e4-9762-0050560a08e8','Blackberry',''),
('746f746a-debe-11e4-9762-0050560a08e8','Blackberry',''),
('746f74ae-debe-11e4-9762-0050560a08e8','Blackberry',''),
('746f7513-debe-11e4-9762-0050560a08e8','Blackberry',''),
('754f7880-debc-11e4-9762-0050560a08e8','Linux Mail-Dovecot Servers',''),
('8886cd00-fa79-11e4-b939-0800200c9a66','Exchange 2013 Servers',''),
('8b8be336-debf-11e4-9762-0050560a08e8','Exchange 2010 Servers','CAS'),
('8b8be3c9-debf-11e4-9762-0050560a08e8','Exchange 2010 Servers','MBX, HUB, CAS, UM'),
('8b8be419-debf-11e4-9762-0050560a08e8','Exchange 2010 Servers','HUB, EDGE'),
('8b8be462-debf-11e4-9762-0050560a08e8','Exchange 2010 Servers','HUB'),
('8b8be4f3-debf-11e4-9762-0050560a08e8','Exchange 2010 Servers','CAS'),
('8b8be552-debf-11e4-9762-0050560a08e8','Exchange 2010 Servers','CAS, UM'),
('8b8be598-debf-11e4-9762-0050560a08e8','Exchange 2010 Servers',''),
('8b8be5f2-debf-11e4-9762-0050560a08e8','Exchange 2010 Servers','MBX'),
('8b8be63a-debf-11e4-9762-0050560a08e8','Exchange 2010 Servers','CAS'),
('8b8be681-debf-11e4-9762-0050560a08e8','Exchange 2010 Servers','MBX'),
('8b8be6c4-debf-11e4-9762-0050560a08e8','Exchange 2010 Servers','CAS, HUB'),
('8b8be707-debf-11e4-9762-0050560a08e8','Exchange 2010 Servers','MBX'),
('8b8be763-debf-11e4-9762-0050560a08e8','Exchange 2010 Servers','CAS, MBX'),
('8b8be7b8-debf-11e4-9762-0050560a08e8','Exchange 2010 Servers',''),
('8b8be7fe-debf-11e4-9762-0050560a08e8','Exchange 2010 Servers','MBX'),
('8b8be852-debf-11e4-9762-0050560a08e8','Exchange 2010 Servers','CAS, MBX'),
('8b8be895-debf-11e4-9762-0050560a08e8','Exchange 2010 Servers','MBX'),
('8b8be8d8-debf-11e4-9762-0050560a08e8','Exchange 2010 Servers','HUB, EDGE'),
('8b8be91a-debf-11e4-9762-0050560a08e8','Exchange 2010 Servers','HUB, EDGE, MBX'),
('8b8be966-debf-11e4-9762-0050560a08e8','Exchange 2010 Servers',''),
('8b8be9a9-debf-11e4-9762-0050560a08e8','Exchange 2010 Servers',''),
('8b8bea14-debf-11e4-9762-0050560a08e8','Exchange 2010 Servers',''),
('8b8bea5f-debf-11e4-9762-0050560a08e8','Exchange 2010 Servers','EDGE'),
('8b8beaa4-debf-11e4-9762-0050560a08e8','Exchange 2010 Servers','EDGE'),
('8b8beae8-debf-11e4-9762-0050560a08e8','Exchange 2010 Servers','IMAP4'),
('8b8beb28-debf-11e4-9762-0050560a08e8','Exchange 2010 Servers','POP3'),
('8b8beb69-debf-11e4-9762-0050560a08e8','Exchange 2010 Servers','Speech Service'),
('8b8beba8-debf-11e4-9762-0050560a08e8','Exchange 2010 Servers','UM'),
('8b8bebec-debf-11e4-9762-0050560a08e8','Exchange 2010 Servers',''),
('8b8bec2c-debf-11e4-9762-0050560a08e8','Exchange 2010 Servers',''),
('8b8bec6d-debf-11e4-9762-0050560a08e8','Exchange 2010 Servers',''),
('8b8becab-debf-11e4-9762-0050560a08e8','Exchange 2010 Servers',''),
('8b8becec-debf-11e4-9762-0050560a08e8','Exchange 2010 Servers',''),
('8b8bed2a-debf-11e4-9762-0050560a08e8','Exchange 2010 Servers',''),
('8b8bed6a-debf-11e4-9762-0050560a08e8','Exchange 2010 Servers',''),
('8b8bedab-debf-11e4-9762-0050560a08e8','Exchange 2010 Servers',''),
('8b8bedea-debf-11e4-9762-0050560a08e8','Exchange 2010 Servers',''),
('8b8bee2f-debf-11e4-9762-0050560a08e8','Exchange 2010 Servers',''),
('8b8bee98-debf-11e4-9762-0050560a08e8','Exchange 2010 Servers',''),
('8b8beedf-debf-11e4-9762-0050560a08e8','Exchange 2010 Servers',''),
('8b8bef1f-debf-11e4-9762-0050560a08e8','Exchange 2010 Servers',''),
('8b8bef5f-debf-11e4-9762-0050560a08e8','Exchange 2010 Servers','CAS'),
('8b8befa5-debf-11e4-9762-0050560a08e8','Exchange 2010 Servers','MBX'),
('8b8befe6-debf-11e4-9762-0050560a08e8','Exchange 2010 Servers','CAS'),
('8b8bf025-debf-11e4-9762-0050560a08e8','Exchange 2010 Servers','MBX'),
('8b8bf066-debf-11e4-9762-0050560a08e8','Exchange 2010 Servers','MBX'),
('8b8bf0a6-debf-11e4-9762-0050560a08e8','Exchange 2010 Servers','MBX'),
('8b8bf0e5-debf-11e4-9762-0050560a08e8','Exchange 2010 Servers','MBX'),
('8b8bf128-debf-11e4-9762-0050560a08e8','Exchange 2010 Servers','MBX'),
('8b8bf16d-debf-11e4-9762-0050560a08e8','Exchange 2010 Servers','MBX'),
('8b8bf1ab-debf-11e4-9762-0050560a08e8','Exchange 2010 Servers','MBX'),
('8b8bfe31-debf-11e4-9762-0050560a08e8','Exchange 2010 Servers','MBX'),
('8b8bfe7e-debf-11e4-9762-0050560a08e8','Exchange 2010 Servers','HUB'),
('8b8bfec3-debf-11e4-9762-0050560a08e8','Exchange 2010 Servers','HUB'),
('8b8bff09-debf-11e4-9762-0050560a08e8','Exchange 2010 Servers','HUB'),
('8b8bff4b-debf-11e4-9762-0050560a08e8','Exchange 2010 Servers','HUB'),
('8b8bff90-debf-11e4-9762-0050560a08e8','Exchange 2010 Servers','HUB'),
('8b8c0037-debf-11e4-9762-0050560a08e8','Exchange 2010 Servers','HUB'),
('8b8c00de-debf-11e4-9762-0050560a08e8','Exchange 2010 Servers','MBX'),
('8b8c0166-debf-11e4-9762-0050560a08e8','Exchange 2010 Servers','HUB'),
('8b8c0262-debf-11e4-9762-0050560a08e8','Exchange 2010 Servers','HUB'),
('8b8c02e6-debf-11e4-9762-0050560a08e8','Exchange 2010 Servers','CAS'),
('8b9b9589-debd-11e4-9762-0050560a08e8','Linux SMTP-Postfix Servers',''),
('a614797b-debd-11e4-9762-0050560a08e8','OS X Messaging - Addressbook',''),
('adb1dd0b-debe-11e4-9762-0050560a08e8','Exchange 2003 Servers','IMAP4'),
('adb1ddd7-debe-11e4-9762-0050560a08e8','Exchange 2003 Servers',''),
('adb1de8b-debe-11e4-9762-0050560a08e8','Exchange 2003 Servers',''),
('adb1df05-debe-11e4-9762-0050560a08e8','Exchange 2003 Servers',''),
('adb1df88-debe-11e4-9762-0050560a08e8','Exchange 2003 Servers','POP3'),
('adb1dff7-debe-11e4-9762-0050560a08e8','Exchange 2003 Servers',''),
('adb1e06f-debe-11e4-9762-0050560a08e8','Exchange 2003 Servers',''),
('adb1e117-debe-11e4-9762-0050560a08e8','Exchange 2003 Servers',''),
('adb1e192-debe-11e4-9762-0050560a08e8','Exchange 2003 Servers',''),
('adb1e226-debe-11e4-9762-0050560a08e8','Exchange 2003 Servers',''),
('adb1e29f-debe-11e4-9762-0050560a08e8','Exchange 2003 Servers',''),
('adb1e356-debe-11e4-9762-0050560a08e8','Exchange 2003 Servers',''),
('adb1e3d1-debe-11e4-9762-0050560a08e8','Exchange 2003 Servers',''),
('adb1e45f-debe-11e4-9762-0050560a08e8','Exchange 2003 Servers',''),
('adb1e4db-debe-11e4-9762-0050560a08e8','Exchange 2003 Servers',''),
('adb1e54c-debe-11e4-9762-0050560a08e8','Exchange 2003 Servers',''),
('adb1e5e8-debe-11e4-9762-0050560a08e8','Exchange 2003 Servers',''),
('adb1e684-debe-11e4-9762-0050560a08e8','Exchange 2003 Servers',''),
('c609000e-debd-11e4-9762-0050560a08e8','OS X Messaging - Calendar',''),
('df8e38f9-debd-11e4-9762-0050560a08e8','OS X Messaging - Chat',''),
('e366d483-debe-11e4-9762-0050560a08e8','Exchange 2007 Servers',''),
('e366d541-debe-11e4-9762-0050560a08e8','Exchange 2007 Servers',''),
('e366d5c3-debe-11e4-9762-0050560a08e8','Exchange 2007 Servers','EDGE'),
('e366d641-debe-11e4-9762-0050560a08e8','Exchange 2007 Servers','IMAP4'),
('e366d6cb-debe-11e4-9762-0050560a08e8','Exchange 2007 Servers','POP3'),
('e366d750-debe-11e4-9762-0050560a08e8','Exchange 2007 Servers','Speech Service'),
('e366d7cc-debe-11e4-9762-0050560a08e8','Exchange 2007 Servers','UM'),
('e366d843-debe-11e4-9762-0050560a08e8','Exchange 2007 Servers','MBX, HUB, CAS, UM'),
('e366d8bb-debe-11e4-9762-0050560a08e8','Exchange 2007 Servers','HUB, EDGE'),
('e366d92e-debe-11e4-9762-0050560a08e8','Exchange 2007 Servers','HUB'),
('e366d998-debe-11e4-9762-0050560a08e8','Exchange 2007 Servers','CAS, UM'),
('e366da10-debe-11e4-9762-0050560a08e8','Exchange 2007 Servers',''),
('e366da95-debe-11e4-9762-0050560a08e8','Exchange 2007 Servers','MBX'),
('e366db11-debe-11e4-9762-0050560a08e8','Exchange 2007 Servers','MBX'),
('e366db85-debe-11e4-9762-0050560a08e8','Exchange 2007 Servers','MBX'),
('e366dbf7-debe-11e4-9762-0050560a08e8','Exchange 2007 Servers',''),
('e366dc66-debe-11e4-9762-0050560a08e8','Exchange 2007 Servers','MBX'),
('e366dce3-debe-11e4-9762-0050560a08e8','Exchange 2007 Servers','CAS, MBX'),
('e366dd6a-debe-11e4-9762-0050560a08e8','Exchange 2007 Servers','HUB, EDGE'),
('e366dde1-debe-11e4-9762-0050560a08e8','Exchange 2007 Servers','HUB, EDGE, MBX'),
('e366de5f-debe-11e4-9762-0050560a08e8','Exchange 2007 Servers','EDGE'),
('e366dee0-debe-11e4-9762-0050560a08e8','Exchange 2007 Servers',''),
('e366df6a-debe-11e4-9762-0050560a08e8','Exchange 2007 Servers',''),
('e366dff8-debe-11e4-9762-0050560a08e8','Exchange 2007 Servers',''),
('e366e07b-debe-11e4-9762-0050560a08e8','Exchange 2007 Servers',''),
('e366e0f2-debe-11e4-9762-0050560a08e8','Exchange 2007 Servers',''),
('e366e175-debe-11e4-9762-0050560a08e8','Exchange 2007 Servers','CAS'),
('e366e1ec-debe-11e4-9762-0050560a08e8','Exchange 2007 Servers','MBX'),
('e366e260-debe-11e4-9762-0050560a08e8','Exchange 2007 Servers','CAS'),
('e366e2d2-debe-11e4-9762-0050560a08e8','Exchange 2007 Servers','MBX'),
('e366e345-debe-11e4-9762-0050560a08e8','Exchange 2007 Servers','MBX'),
('e366e409-debe-11e4-9762-0050560a08e8','Exchange 2007 Servers','MBX'),
('e366e487-debe-11e4-9762-0050560a08e8','Exchange 2007 Servers','MBX'),
('e366e4f8-debe-11e4-9762-0050560a08e8','Exchange 2007 Servers','MBX'),
('e366e561-debe-11e4-9762-0050560a08e8','Exchange 2007 Servers','MBX'),
('e366e5ce-debe-11e4-9762-0050560a08e8','Exchange 2007 Servers','MBX'),
('e366e63c-debe-11e4-9762-0050560a08e8','Exchange 2007 Servers','MBX'),
('e366e6c8-debe-11e4-9762-0050560a08e8','Exchange 2007 Servers','HUB'),
('e366e73e-debe-11e4-9762-0050560a08e8','Exchange 2007 Servers','HUB'),
('e366e7bd-debe-11e4-9762-0050560a08e8','Exchange 2007 Servers','HUB'),
('e366e831-debe-11e4-9762-0050560a08e8','Exchange 2007 Servers','HUB'),
('e366e8a3-debe-11e4-9762-0050560a08e8','Exchange 2007 Servers','HUB'),
('e366e917-debe-11e4-9762-0050560a08e8','Exchange 2007 Servers','HUB'),
('e366e98b-debe-11e4-9762-0050560a08e8','Exchange 2007 Servers','MBX'),
('e366fbea-debe-11e4-9762-0050560a08e8','Exchange 2007 Servers','HUB'),
('e366fccf-debe-11e4-9762-0050560a08e8','Exchange 2007 Servers','HUB'),
('e366fd87-debe-11e4-9762-0050560a08e8','Exchange 2007 Servers','CAS'),
('f4ea144f-debd-11e4-9762-0050560a08e8','OS X Messaging - Mail','');

/*Table structure for table `plugin_messaging_deprecatedgroupagents` */

DROP TABLE IF EXISTS `plugin_messaging_deprecatedgroupagents`;

CREATE TABLE `plugin_messaging_deprecatedgroupagents` (
  `AgentID` int(11) NOT NULL AUTO_INCREMENT,
  `GroupID` int(11) NOT NULL,
  `SearchID` int(11) NOT NULL,
  `Name` varchar(200) NOT NULL,
  `CheckAction` int(11) NOT NULL,
  `AlertAction` int(11) NOT NULL,
  `AlertMessage` text NOT NULL,
  `ContactID` int(11) NOT NULL,
  `interval` int(11) NOT NULL,
  `Where` varchar(255) NOT NULL,
  `What` varchar(255) NOT NULL,
  `DataOut` text NOT NULL,
  `Comparor` int(11) NOT NULL,
  `DataIn` varchar(8000) NOT NULL,
  `IDField` varchar(500) NOT NULL,
  `AlertStyle` int(11) NOT NULL DEFAULT '0',
  `ScriptID` int(11) NOT NULL,
  `DataCollector` varchar(100) NOT NULL,
  `Category` int(11) NOT NULL,
  `TicketCategory` int(11) NOT NULL,
  `ScriptTarget` int(11) DEFAULT '1',
  `GUID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`AgentID`),
  KEY `ContactID` (`ContactID`),
  KEY `Name` (`Name`),
  KEY `GroupID` (`GroupID`),
  KEY `SearchID` (`SearchID`)
) ENGINE=InnoDB AUTO_INCREMENT=863 DEFAULT CHARSET=utf8;

/*Data for the table `plugin_messaging_deprecatedgroupagents` */

insert  into `plugin_messaging_deprecatedgroupagents`(`AgentID`,`GroupID`,`SearchID`,`Name`,`CheckAction`,`AlertAction`,`AlertMessage`,`ContactID`,`interval`,`Where`,`What`,`DataOut`,`Comparor`,`DataIn`,`IDField`,`AlertStyle`,`ScriptID`,`DataCollector`,`Category`,`TicketCategory`,`ScriptTarget`,`GUID`) values 
(132,831,417,'SVC-MSExchangeAB',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',1,60,'127.0.0.1','2','MSExchangeAB',1,'1','',1,0,'',5,142,1,'d1456a8a-89fd-4896-bee2-9c65d98c047c'),
(133,831,513,'SVC-MSExchangeADTopology',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',1,60,'127.0.0.1','2','MSExchangeADTopology',1,'1','',1,0,'',5,142,1,'ce366674-acff-46c4-9809-249903ea0e41'),
(134,831,514,'SVC-MSExchangeAntispamUpdate',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',1,60,'127.0.0.1','2','MSExchangeAntispamUpdate',1,'1','',1,0,'',5,142,1,'ec1b2129-2c97-4455-8ecf-de3a668b9f82'),
(135,831,418,'SVC-MSExchangeEdgeSync',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',1,60,'127.0.0.1','2','MSExchangeEdgeSync',1,'1','',1,0,'',5,142,1,'da3f1609-1036-4a67-a5e7-2e4edf63d022'),
(136,831,417,'SVC-MSExchangeFBA',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',1,60,'127.0.0.1','2','MSExchangeFBA',1,'1','',1,0,'',5,142,1,'69f3f186-4364-4016-bc49-0e36652ecd92'),
(137,831,515,'SVC-MSExchangeFDS',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',1,60,'127.0.0.1','2','MSExchangeFDS',1,'1','',1,0,'',5,142,1,'9a9a79a5-fd03-4aec-87ec-2049d416f2c7'),
(138,831,416,'SVC-MSExchangeIS',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',1,60,'127.0.0.1','2','MSExchangeIS',1,'1','',1,0,'',5,142,1,'3629f40e-54b1-4718-8e3f-85fc49c394cb'),
(139,831,416,'SVC-MSExchangeMailboxAssistants',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',1,60,'127.0.0.1','2','MSExchangeMailboxAssistants',1,'1','',1,0,'',5,142,1,'60b6a425-6be5-4022-bc74-3378fa0d6f8c'),
(140,831,417,'SVC-MSExchangeMailboxReplication',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',1,60,'127.0.0.1','2','MSExchangeMailboxReplication',1,'1','',1,0,'',5,142,1,'176f19db-c6ac-4360-8417-88fc8bf30f68'),
(141,831,416,'SVC-MSExchangeMailSubmission',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',1,60,'127.0.0.1','2','MSExchangeMailSubmission',1,'1','',1,0,'',5,142,1,'6b413a8b-42a9-43be-9e78-c9ce84d9df16'),
(142,831,517,'SVC-MSExchangeProtectedServiceHost',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',1,60,'127.0.0.1','2','MSExchangeProtectedServiceHost',1,'1','',1,0,'',5,142,1,'fda24c28-7f28-47bf-817b-9a9cea7c0cbe'),
(143,831,416,'SVC-MSExchangeRepl',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',1,60,'127.0.0.1','2','MSExchangeRepl',1,'1','',1,0,'',5,142,1,'5e3e2fd6-8ec4-4b0d-88b2-6d04b05ed917'),
(144,831,518,'SVC-MSExchangeRPC',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',1,60,'127.0.0.1','2','MSExchangeRPC',1,'1','',1,0,'',5,142,1,'b297a7b9-899c-45a8-bd4c-f9b2f3e9b546'),
(145,831,416,'SVC-MSExchangeSA',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',1,60,'127.0.0.1','2','MSExchangeSA',1,'1','',1,0,'',5,142,1,'89542d8a-d9bf-466c-9ded-c3402900a107'),
(146,831,416,'SVC-MSExchangeSearch',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',1,60,'127.0.0.1','2','MSExchangeSearch',1,'1','',1,0,'',5,142,1,'54b5a318-03c6-4a4c-845b-0109537ea041'),
(147,831,516,'SVC-MSExchangeServiceHost',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',1,60,'127.0.0.1','2','MSExchangeServiceHost',1,'1','',1,0,'',5,142,1,'d9c1dd68-0729-4565-a088-56b08f72d35e'),
(148,831,416,'SVC-MSExchangeThrottling',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',1,60,'127.0.0.1','2','MSExchangeThrottling',1,'1','',1,0,'',5,142,1,'3e602c64-f014-4453-8775-137d38d58ddf'),
(149,831,514,'SVC-MSExchangeTransport',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',1,60,'127.0.0.1','2','MSExchangeTransport',1,'1','',1,0,'',5,142,1,'cdaaf0f1-dae0-415b-bb7a-04798d7956f2'),
(150,831,519,'SVC-MSExchangeTransportLogSearch',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',1,60,'127.0.0.1','2','MSExchangeTransportLogSearch',1,'1','',1,0,'',5,142,1,'81cfa129-f654-498e-9883-0da168f39c87'),
(212,846,403,'SVC-BBAttachServer',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',1,60,'127.0.0.1','2','BBAttachServer',1,'1','',1,0,'',5,134,1,'04c579b7-5b71-4080-858e-2c255a90038c'),
(213,846,403,'SVC-BlackBerry Controller',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',1,60,'127.0.0.1','2','BlackBerry Controller',1,'1','',1,0,'',5,134,1,'6210b2e9-1975-437d-8c21-fb00b87973b8'),
(214,846,403,'SVC-BlackBerry Dispatcher',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',1,60,'127.0.0.1','2','BlackBerry Dispatcher',1,'1','',1,0,'',5,134,1,'9c994cab-769a-407d-b9c5-b8e3cd65a319'),
(215,846,403,'SVC-BlackBerry Router',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',1,60,'127.0.0.1','2','BlackBerry Router',1,'1','',1,0,'',5,134,1,'2448605c-8bb1-4738-9745-687a271fdfc6'),
(216,846,403,'SVC-BlackBerry Server Alert',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',1,60,'127.0.0.1','2','BlackBerry Server Alert',1,'1','',1,0,'',5,134,1,'7f297ff6-f2a0-4ac9-acde-87886aaab786'),
(323,830,521,'EV - 15002 Exchange Backpressure',6,3,'%NAME%~~~%RESULT%',0,300,'127.0.0.1','6','*!!!0!!!MSExchangeTransport!!!15002!!!*',1,'1','',1,0,'',16,106,1,'c7f7596c-9ff2-4cba-a0c0-2ce598d25c07'),
(324,830,521,'EV - 15004 Exchange Backpressure',6,3,'%NAME%~~~%RESULT%',0,300,'127.0.0.1','6','*!!!0!!!MSExchangeTransport!!!15004!!!*',1,'1','',1,0,'',16,106,1,'3da00585-e151-4283-bbd2-1091f22d3dac'),
(325,831,516,'EV - 15002 Exchange Backpressure',6,3,'%NAME%~~~%RESULT%',0,300,'127.0.0.1','6','*!!!0!!!MSExchangeTransport!!!15002!!!*',1,'1','',1,0,'',16,106,1,'dba60be6-55e6-457e-a225-af5d1ec89747'),
(326,831,516,'EV - 15006 Exchange Backpressure',6,3,'%NAME%~~~%RESULT%',0,300,'127.0.0.1','6','*!!!0!!!MSExchangeTransport!!!15006!!!*',1,'1','',1,0,'',16,106,1,'d9f684d9-b5fb-4ff0-801b-ac2607654b0f'),
(327,831,516,'EV - 2153 DAG Communication',6,3,'%NAME%~~~%RESULT%',0,300,'127.0.0.1','6','*!!!0!!!MSExchangeRepl!!!2153!!!*',1,'1','',1,0,'',16,106,1,'d721d7b8-83a7-4f5f-8950-690fb78ba4db'),
(332,831,415,'SVC-MSExchangeADAM',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',0,60,'127.0.0.1','2','ADAM_MSExchange',1,'1','',1,0,'',5,142,1,'5c6ad31e-10e8-41a8-baaa-2141c4c75095'),
(333,831,415,'SVC-MSExchangeEdgeCred',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',0,60,'127.0.0.1','2','MSExchangeEdgeCredential',1,'1','',1,0,'',5,142,1,'8cd9cf03-b8de-4623-b8cd-2112408c5caa'),
(334,831,500,'SVC-MSExchangeIMAP4',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',0,60,'127.0.0.1','2','MSExchangeIMAP4',1,'1','',1,0,'',5,142,1,'7acf8cd1-4c18-4634-b648-85a4a406934d'),
(335,831,503,'SVC-MSExchangePOP3',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',0,60,'127.0.0.1','2','MSExchangePOP3',1,'1','',1,0,'',5,142,1,'ef8936ed-aaca-4979-b4db-09bc5ac98707'),
(336,831,578,'SVC-MSSpeechService',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',0,60,'127.0.0.1','2','MSSpeechService',1,'1','',1,0,'',5,142,1,'706bc5bb-ea09-44f4-a5d7-e05379f52001'),
(337,831,414,'SVC-MSExchangeUM',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',0,60,'127.0.0.1','2','MSExchangeUM',1,'1','',1,0,'',5,142,1,'6c438c49-a635-4fc7-8e49-fddcfa6dc296'),
(338,830,411,'SVC-MSExchangeADAM',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',0,60,'127.0.0.1','2','ADAM_MSExchange',1,'1','',1,0,'',5,142,1,'a00cf18c-d152-43fb-97f6-3dee15241937'),
(339,830,500,'SVC-MSExchangeIMAP4',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',0,60,'127.0.0.1','2','MSExchangeIMAP4',1,'1','',1,0,'',5,142,1,'2b5d0401-94ce-4243-87d3-b4f128f5614f'),
(340,830,503,'SVC-MSExchangePOP3',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',0,60,'127.0.0.1','2','MSExchangePOP3',1,'1','',1,0,'',5,142,1,'0800de8a-0711-4cb8-8fcc-298d8f29a4ba'),
(341,830,578,'SVC-MSSpeechService',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',0,60,'127.0.0.1','2','MSSpeechService',1,'1','',1,0,'',5,142,1,'6c1e6fb9-b14e-4cd8-9d0e-0a45a2e2fdc4'),
(342,830,413,'SVC-MSExchangeUM',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',0,60,'127.0.0.1','2','MSExchangeUM',1,'1','',1,0,'',5,142,1,'094f1252-a9cd-4e08-9a36-4ea8e9d92c1c'),
(343,830,528,'SVC-MSExchangeADTopology',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',1,60,'127.0.0.1','2','MSExchangeADTopology',1,'1','',1,0,'',5,142,1,'9f269651-14af-4182-8d25-dc7eab9e3335'),
(344,830,525,'SVC-MSExchangeAntispamUpdate',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',1,60,'127.0.0.1','2','MSExchangeAntispamUpdate',1,'1','',1,0,'',5,142,1,'c8162012-ccd1-473a-abd0-b59a6b300e88'),
(345,830,410,'SVC-MSExchangeEdgeSync',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',1,60,'127.0.0.1','2','MSExchangeEdgeSync',1,'1','',1,0,'',5,142,1,'998c3976-6c1e-4e22-b819-bcc4562c6b93'),
(346,830,524,'SVC-MSExchangeFDS',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',1,60,'127.0.0.1','2','MSExchangeFDS',1,'1','',1,0,'',5,142,1,'196d49bd-94f7-4969-b338-3d57f79f240b'),
(347,830,412,'SVC-MSExchangeIS',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',1,60,'127.0.0.1','2','MSExchangeIS',1,'1','',1,0,'',5,142,1,'319aa388-4f46-490b-8898-61e8cef402c3'),
(348,830,412,'SVC-MSExchangeMailboxAssistants',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',1,60,'127.0.0.1','2','MSExchangeMailboxAssistants',1,'1','',1,0,'',5,142,1,'bf376390-c8c3-439f-be60-59e92fc09beb'),
(349,830,412,'SVC-MSExchangeMailSubmission',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',1,60,'127.0.0.1','2','MSExchangeMailSubmission',1,'1','',1,0,'',5,142,1,'cb121463-231c-4fbc-9255-894fd30c3bd6'),
(350,830,412,'SVC-MSExchangeRepl',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',1,60,'127.0.0.1','2','MSExchangeRepl',1,'1','',1,0,'',5,142,1,'d228f414-b8e9-420e-911c-b20ff1d2b9e6'),
(351,830,412,'SVC-MSExchangeSA',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',1,60,'127.0.0.1','2','MSExchangeSA',1,'1','',1,0,'',5,142,1,'b4164eb8-f567-4799-923b-08f163cde42b'),
(352,830,412,'SVC-MSExchangeSearch',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',1,60,'127.0.0.1','2','MSExchangeSearch',1,'1','',1,0,'',5,142,1,'c9cd95f6-e076-4d8e-85a5-e7f8a3723f12'),
(353,830,523,'SVC-MSExchangeServiceHost',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',1,60,'127.0.0.1','2','MSExchangeServiceHost',1,'1','',1,0,'',5,142,1,'74ba1345-d0f7-46d3-9394-e7cb56f32b82'),
(354,830,525,'SVC-MSExchangeTransport',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',1,60,'127.0.0.1','2','MSExchangeTransport',1,'1','',1,0,'',5,142,1,'ceaeb0c5-57f0-45ca-a381-d37ec1843793'),
(355,830,526,'SVC-MSExchangeTransportLogSearch',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',1,60,'127.0.0.1','2','MSExchangeTransportLogSearch',1,'1','',1,0,'',5,142,1,'3759724d-5e9c-4fe7-907d-63f734aa8b3c'),
(356,830,411,'SVC-EdgeCredentialSvc',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',0,60,'127.0.0.1','2','EdgeCredentialSvc',1,'1','',1,0,'',5,142,1,'6b701169-4883-4168-98e9-161c767a5cb3'),
(414,831,516,'EV - 15004 Exchange Backpressure',6,3,'%NAME%~~~%RESULT%',0,300,'127.0.0.1','6','*!!!0!!!MSExchangeTransport!!!15004!!!*',1,'1','',1,0,'',16,106,1,'9ba4fbb7-70e1-442e-8c8b-5529992982c2'),
(415,830,521,'EV - 15006 Exchange Backpressure',6,3,'%NAME%~~~%RESULT%',0,300,'127.0.0.1','6','*!!!0!!!MSExchangeTransport!!!15006!!!*',1,'1','',1,0,'',16,106,1,'ebdd4a98-0872-45c6-a5c8-0d6d323187c9'),
(416,831,516,'EV - 2090 DAG Failover',6,3,'%NAME%~~~%RESULT%',0,300,'127.0.0.1','6','*!!!0!!!MSExchangeRepl!!!2090!!!*',1,'1','',1,0,'',16,106,1,'099496fa-df14-4af3-b870-1fe36e633e55'),
(417,831,516,'EV -  4110 DAG Log Replay Suspended',6,3,'%NAME%~~~%RESULT%',0,600,'127.0.0.1','6','*!!!0!!!MSExchangeRepl!!!4110!!!*',1,'1','',1,0,'',16,106,1,'1e171f0f-6216-489e-a835-d7bcefc8836a'),
(418,831,516,'EV - 10036 DAG Block Mode',6,3,'%NAME%~~~%RESULT%',0,600,'127.0.0.1','6','*!!!0!!!MSExchangeRepl!!!10036!!!*',1,'1','',1,0,'',16,106,1,'95e7dbac-fdb1-4015-ace8-7d99a12049cf'),
(419,831,516,'EV -  4111 DAG Log Replay Resumed',6,3,'%NAME%~~~%RESULT%',0,600,'127.0.0.1','6','*!!!0!!!MSExchangeRepl!!!4111!!!*',1,'1','',1,0,'',16,106,1,'013c41b9-0785-4003-ae7d-115a0d61d32d'),
(420,831,516,'EV - 1204 Cluster Offline',6,3,'%NAME%~~~%RESULT%',0,300,'127.0.0.1','6','*!!!0!!!FailoverClustering!!!1204!!!*',1,'1','',1,0,'',16,105,1,'700f6161-f41f-41ab-88c3-68a25134e95a'),
(421,831,516,'EV - 1561 Cluster Offline',6,3,'%NAME%~~~%RESULT%',0,300,'127.0.0.1','6','*!!!0!!!FailoverClustering!!!1561!!!*',1,'1','',1,0,'',16,105,1,'4a3beeee-f3f0-4ce8-9b14-35011a80512b'),
(422,831,516,'EV - 1062 Cluster Online',6,3,'%NAME%~~~%RESULT%',0,300,'127.0.0.1','6','*!!!0!!!FailoverClustering!!!1062!!!*',1,'1','',1,0,'',16,105,1,'4b55442d-842d-4f6a-8a8b-513888decc04'),
(423,831,516,'EV - 1125 Cluster Online',6,3,'%NAME%~~~%RESULT%',0,300,'127.0.0.1','6','*!!!0!!!FailoverClustering!!!1125!!!*',1,'1','',1,0,'',16,105,1,'bce83073-232e-4382-bd67-8a5f0f786b74'),
(457,831,516,'Perf - LDAP Read Time',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r',0,300,'127.0.0.1','0','MSExchange ADAccess Domain Controllers!!!LDAP Read Time!!!*',4,'100','',1,0,'',7,122,1,'764eb6b4-1210-442e-a925-d6137f68d5c5'),
(458,831,516,'Perf - LDAP Search Time',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r',0,300,'127.0.0.1','0','MSExchange ADAccess Domain Controllers!!!LDAP Search Time!!!*',4,'100','',1,0,'',7,122,1,'a26d8d2f-a145-4663-8ffa-ca1536fa4b0b'),
(459,831,516,'Perf - LDAP Searches Timed Out',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r',0,60,'127.0.0.1','0','MSExchange ADAccess Domain Controllers!!!LDAP Searches Timed Out per Minute!!!',4,'10','',1,0,'',7,122,1,'8f050dd1-ef66-4172-80a5-260c97d783d3'),
(460,831,516,'Perf - Long Running LDAP Operations',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r',0,60,'127.0.0.1','0','MSExchange ADAccess Domain Controllers!!!Long Running LDAP Operations/min!!!*',4,'50','',1,0,'',7,122,1,'2930bc89-90cb-4afa-8477-06f8c4c11512'),
(461,831,417,'Perf - OWA Average Search Time',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r',0,60,'127.0.0.1','0','MSExchange OWA!!!Average Search Time!!!',4,'5000','',1,0,'',7,122,1,'40eda971-d58c-422d-8334-2451673b8414'),
(462,831,416,'Perf - RPC Average Latency',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r',0,60,'127.0.0.1','0','MSExchange RpcClientAccess!!!RPC Averaged Latency!!!',4,'250','',1,0,'',7,122,1,'598c6a5c-4953-40fc-8bec-d72a6b19af55'),
(463,831,417,'Perf - RPC Requests CAS',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r',0,60,'127.0.0.1','0','MSExchange RpcClientAccess!!!RPC Requests!!!',4,'40','',1,0,'',7,122,1,'00fd60fc-716b-4755-90ae-809867f6e457'),
(464,831,416,'Perf - RPC Requests IS',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r',0,60,'127.0.0.1','0','MSExchangeIS!!!RPC Requests!!!',4,'70','',1,0,'',7,122,1,'d4c7c68b-c7ea-44c4-b0ef-b2cc58f77696'),
(465,831,416,'Perf - RPC Average Latency IS',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r',0,60,'127.0.0.1','0','MSExchangeIS!!!RPC Averaged Latency!!!',4,'25','',1,0,'',7,122,1,'e90cd0c9-a3a3-4e2d-84d5-44485eab1b44'),
(466,831,416,'Perf - RPC Average Latency MBX',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r',0,60,'127.0.0.1','0','MSExchangeIS Mailbox!!!RPC Average Latency!!!',4,'25','',1,0,'',7,122,1,'1595da09-ac7d-4d80-aa42-fdf40b63e264'),
(467,831,416,'Perf - Messages Queued for Submission',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r',0,60,'127.0.0.1','0','MSExchangeIS Mailbox!!!Messages Queued For Submission!!!_Total',4,'50','',1,0,'',7,122,1,'c27bc492-0f93-4899-a597-7c866b836094'),
(468,831,416,'Perf - Messages Queued for Submission Public',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r',0,60,'127.0.0.1','0','MSExchangeIS Public!!!Messages Queued For Submission!!!_Total',4,'20','',1,0,'',7,122,1,'2a01c924-7089-4679-87c2-766d27f80485'),
(469,831,416,'Perf - Log Generation Checkpoint Depth',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r',0,60,'127.0.0.1','0','MSExchange Database ==> Instances!!!Log Generation Checkpoint Depth!!!',4,'500','',1,0,'',7,122,1,'51cdc531-4aac-49c4-ac63-b21a0982a390'),
(470,831,416,'Perf - Database Page Fault Stalls/sec',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r',0,60,'127.0.0.1','0','MSExchange Database!!!Database Page Fault Stalls/sec!!!Information Store',1,'0','',1,0,'',7,122,1,'4ceaed78-e628-41ed-8cc4-cc7e74251d81'),
(471,831,416,'Perf - Version Buckets Allocated',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r',0,60,'127.0.0.1','0','MSExchange Database!!!Version Buckets Allocated!!!Information Store',4,'12000','',1,0,'',7,122,1,'e1a84314-369f-4d8d-bd22-a65d887cfa85'),
(472,831,418,'Perf - Aggregate Delivery Queue Length',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r',0,60,'127.0.0.1','0','MSExchangeTransport Queues!!!Aggregate Delivery Queue Length (All Queues)!!!_total',4,'3000','',1,0,'',7,122,1,'2f0b2d76-53a3-4927-b2b8-2382ff1e43f1'),
(473,831,418,'Perf - Active Remote Delivery Queue Length',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r',0,60,'127.0.0.1','0','MSExchangeTransport Queues!!!Active Remote Delivery Queue Length!!!_total',4,'250','',1,0,'',7,122,1,'14326577-026a-428b-9803-ec2ad9f83ffe'),
(474,831,418,'Perf - Active Mailbox Delivery Queue',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r',0,60,'127.0.0.1','0','MSExchangeTransport Queues!!!Active Mailbox Delivery Queue Length!!!_total',4,'250','',1,0,'',7,122,1,'84ee65e6-e2b4-41af-9063-caa299b727e6'),
(475,831,418,'Perf - Submission Queue Length',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r',0,60,'127.0.0.1','0','MSExchangeTransport Queues!!!Submission Queue Length!!!_total',4,'500','',1,0,'',7,122,1,'f2f49dfc-3a37-493d-ba0b-80e480a0ada9'),
(476,831,418,'Perf - Active Non-SMTP Delivery Queue',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r',0,60,'127.0.0.1','0','MSExchangeTransport Queues!!!Active Non-Smtp Delivery Queue Length!!!_total',4,'250','',1,0,'',7,122,1,'5caa9488-231f-4fe4-a001-3ed6ffe8d697'),
(477,831,418,'Perf - Retry Remote Delivery Queue Length',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r',0,60,'127.0.0.1','0','MSExchangeTransport Queues!!!Retry Remote Delivery Queue Length!!!_total',4,'100','',1,0,'',7,122,1,'b34c6364-83c7-413a-a8da-4173be4113c7'),
(478,831,418,'Perf - Unreachable Queue Length',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r',0,60,'127.0.0.1','0','MSExchangeTransport Queues!!!Unreachable Queue Length!!!_total',4,'100','',1,0,'',7,122,1,'2f04016f-de78-458a-8350-dab109014815'),
(479,831,418,'Perf - Largest Delivery Queue Length',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r',0,60,'127.0.0.1','0','MSExchangeTransport Queues!!!Largest Delivery Queue Length!!!_total',4,'200','',1,0,'',7,122,1,'0ac9bf57-2235-4c3c-84b0-615f1b027cf3'),
(480,831,418,'Perf - Poison Queue Length',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%. \r\nExplanation \r\nThe Poison Queue Length performance counter measures the number of messages currently in the poison queue. Messages in the poison message queue are in a permanently suspended state.\r\n\r\nThis alert indicates that the Poison Queue Length has been greater than 1 for five minutes. \r\n\r\nThe poison message queue contains messages that are determined to be potentially harmful to the Microsoft Exchange Server 2007 server after a server failure. The messages may be genuinely harmful in their content and format. Alternatively, they may be the results of a poorly written agent that has caused the Exchange server to fail when it processed the supposedly bad messages.\r\n\r\nMessages remain in the poison message queue until they are manually resumed or removed by an administrator. The messages in the poison message queue are never automatically resumed or expired.\r\n\r\n  User Action \r\nTo resolve this alert, resubmit or remove the messages from the poison message queue. You can resubmit the messages that are in the poison message queue by using the Exchange Queue Viewer or by running the Resume-Message cmdlet. You can remove messages from the poison message queue by using Queue Viewer or by running the Remove-Message cmdlet.  \r\n\r\n\r\n\r',0,60,'127.0.0.1','0','MSExchangeTransport Queues!!!Poison Queue Length!!!_total',1,'0','',1,0,'',7,122,1,'218c5775-4d3f-4713-9e1e-a62ca4c982fd'),
(488,830,521,'Perf - LDAP Read Time',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r',0,300,'127.0.0.1','0','MSExchange ADAccess Domain Controllers!!!LDAP Read Time!!!*',4,'100','',1,0,'',7,122,1,'27f329fe-7228-4094-aa61-7f702fb93220'),
(489,830,521,'Perf - LDAP Search Time',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r',0,300,'127.0.0.1','0','MSExchange ADAccess Domain Controllers!!!LDAP Search Time!!!*',4,'100','',1,0,'',7,122,1,'7e378fc3-70d7-45d8-9f03-93236416572b'),
(490,830,521,'Perf - LDAP Searches Timed Out',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r',0,60,'127.0.0.1','0','MSExchange ADAccess Domain Controllers!!!LDAP Searches Timed Out per Minute!!!',4,'10','',1,0,'',7,122,1,'045a00d6-df08-470d-81a0-d3991e6d4a20'),
(491,830,521,'Perf - Long Running LDAP Operations',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r',0,60,'127.0.0.1','0','MSExchange ADAccess Domain Controllers!!!Long Running LDAP Operations/min!!!*',4,'50','',1,0,'',7,122,1,'0b522235-4cc9-442d-baf9-79e06ff15d33'),
(492,830,409,'Perf - OWA Average Search Time',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r',0,60,'127.0.0.1','0','MSExchange OWA!!!Average Search Time!!!',4,'5000','',1,0,'',7,122,1,'51c5e77c-e55c-4958-a668-db26a4e3448b'),
(493,830,412,'Perf - RPC Average Latency',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r',0,60,'127.0.0.1','0','MSExchange RpcClientAccess!!!RPC Averaged Latency!!!',4,'250','',1,0,'',7,122,1,'f3173bf8-d75c-4355-871b-4dea9cc74caa'),
(494,830,409,'Perf - RPC Requests CAS',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r',0,60,'127.0.0.1','0','MSExchange RpcClientAccess!!!RPC Requests!!!',4,'40','',1,0,'',7,122,1,'0ab733b0-7c1f-40dc-909f-8d07f91cf28d'),
(495,830,412,'Perf - RPC Requests IS',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r',0,60,'127.0.0.1','0','MSExchangeIS!!!RPC Requests!!!',4,'70','',1,0,'',7,122,1,'832c0aad-69d1-4703-8f40-cd45a4bc8c72'),
(496,830,412,'Perf - RPC Average Latency IS',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r',0,60,'127.0.0.1','0','MSExchangeIS!!!RPC Averaged Latency!!!',4,'25','',1,0,'',7,122,1,'e40496f3-96bf-4466-8f77-dffe0dbeb2bf'),
(497,830,412,'Perf - RPC Average Latency MBX',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r',0,60,'127.0.0.1','0','MSExchangeIS Mailbox!!!RPC Average Latency!!!',4,'25','',1,0,'',7,122,1,'fc14d3af-94c4-46ee-b9e2-3f8e92d9b592'),
(498,830,412,'Perf - Messages Queued for Submission',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r',0,60,'127.0.0.1','0','MSExchangeIS Mailbox!!!Messages Queued For Submission!!!_Total',4,'50','',1,0,'',7,122,1,'e22d8917-1d05-44eb-b805-f761ed66b043'),
(499,830,412,'Perf - Messages Queued fro Submission Public',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r',0,60,'127.0.0.1','0','MSExchangeIS Public!!!Messages Queued For Submission!!!_Total',4,'20','',1,0,'',7,122,1,'6150135a-27fe-453f-8b91-a433a0d75090'),
(500,830,412,'Perf - Log Generation Checkpoint Depth',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r',0,60,'127.0.0.1','0','MSExchange Database ==> Instances!!!Log Generation Checkpoint Depth!!!',4,'500','',1,0,'',7,122,1,'8ffe0ee7-3235-414f-be31-e92f5affe426'),
(501,830,412,'Perf - Database Page Fault Stalls/sec',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r',0,60,'127.0.0.1','0','MSExchange Database!!!Database Page Fault Stalls/sec!!!Information Store',1,'0','',1,0,'',7,122,1,'eed3e79c-866d-4faf-af1c-579172723f14'),
(502,830,412,'Perf - Version Buckets Allocated',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r',0,60,'127.0.0.1','0','MSExchange Database!!!Version Buckets Allocated!!!Information Store',4,'12000','',1,0,'',7,122,1,'ca911e4e-3cee-410a-910d-cc37c22609ef'),
(503,830,410,'Perf - Aggregate Delivery Queue Length',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r',0,60,'127.0.0.1','0','MSExchangeTransport Queues!!!Aggregate Delivery Queue Length (All Queues)!!!_total',4,'3000','',1,0,'',7,122,1,'952dd5e7-acaf-48c5-90a0-8e52a803c352'),
(504,830,410,'Perf - Active Remote Delivery Queue Length',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r',0,60,'127.0.0.1','0','MSExchangeTransport Queues!!!Active Remote Delivery Queue Length!!!_total',4,'250','',1,0,'',7,122,1,'848332f1-dcc4-4b41-b49e-af7ac214841d'),
(505,830,410,'Perf - Active Mailbox Delivery Queue',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.',0,60,'127.0.0.1','0','MSExchangeTransport Queues!!!Active Mailbox Delivery Queue Length!!!_total',4,'250','',1,0,'',7,122,1,'cb978c49-773d-42ce-9b2e-7cb53160b924'),
(506,830,410,'Perf - Submission Queue length',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r',0,60,'127.0.0.1','0','MSExchangeTransport Queues!!!Submission Queue Length!!!_total',4,'500','',1,0,'',7,122,1,'2942dbfb-cf44-4509-a777-c79a2d525dd4'),
(507,830,410,'Perf - Active Non-SMTP Delivery Queue',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r',0,60,'127.0.0.1','0','MSExchangeTransport Queues!!!Active Non-Smtp Delivery Queue Length!!!_total',4,'250','',1,0,'',7,122,1,'f76e217a-c097-49fd-8bff-afc0891296d3'),
(508,830,410,'Perf - Retry Remote Delivery Queue Length',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r',0,60,'127.0.0.1','0','MSExchangeTransport Queues!!!Retry Remote Delivery Queue Length!!!_total',4,'100','',1,0,'',7,122,1,'7aae0e2f-6585-4b92-92fe-065500b41c25'),
(509,830,412,'Perf - Unreachable Queue Length',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r',0,60,'127.0.0.1','0','MSExchangeTransport Queues!!!Unreachable Queue Length!!!_total',4,'100','',1,0,'',7,122,1,'487b8915-ad2b-40f0-932b-bf14767fc34f'),
(510,830,410,'Perf - Largest Delivery Queue Length',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r',0,60,'127.0.0.1','0','MSExchangeTransport Queues!!!Largest Delivery Queue Length!!!_total',4,'200','',1,0,'',7,122,1,'1ca0f159-1f75-40aa-a928-5c4aef6c5ec1'),
(511,830,410,'Perf - Poison Queue Length',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\rExplanation \r\nThe Poison Queue Length performance counter measures the number of messages currently in the poison queue. Messages in the poison message queue are in a permanently suspended state.\r\n\r\nThis alert indicates that the Poison Queue Length has been greater than 1 for five minutes. \r\n\r\nThe poison message queue contains messages that are determined to be potentially harmful to the Microsoft Exchange Server 2007 server after a server failure. The messages may be genuinely harmful in their content and format. Alternatively, they may be the results of a poorly written agent that has caused the Exchange server to fail when it processed the supposedly bad messages.\r\n\r\nMessages remain in the poison message queue until they are manually resumed or removed by an administrator. The messages in the poison message queue are never automatically resumed or expired.\r\n\r\n  User Action \r\nTo resolve this alert, resubmit or remove the messages from the poison message queue. You can resubmit the messages that are in the poison message queue by using the Exchange Queue Viewer or by running the Resume-Message cmdlet. You can remove messages from the poison message queue by using Queue Viewer or by running the Remove-Message cmdlet.  \r\n\r\n',0,60,'127.0.0.1','0','MSExchangeTransport Queues!!!Poison Queue Length!!!_total',1,'0','',1,0,'',7,122,1,'514df943-24d5-49fc-a180-4a0ea7ca5ab1'),
(512,830,409,'Perf - OWA Average Response Time',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\r\n\r',0,60,'127.0.0.1','0','MSExchange OWA!!!Average Response Time!!!',4,'200','',1,0,'',7,122,1,'0dd2e341-e4ab-4bde-b586-80dc2aa58bb9'),
(513,829,500,'SVC-IMAP4Svc',6,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',0,60,'127.0.0.1','2','IMAP4Svc',1,'1','',1,0,'',5,142,1,'b3a7d859-81b9-49a9-bb6d-9201a5330fdb'),
(514,829,0,'SVC-MSExchangeIS',6,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',0,60,'127.0.0.1','2','MSExchangeIS',1,'1','',1,0,'',5,142,1,'b0a9d195-4e2e-4f23-ba8a-7753ae3a6c08'),
(515,829,0,'SVC-MSExchangeMGMT',6,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',0,60,'127.0.0.1','2','MSExchangeMGMT',1,'1','',1,0,'',5,142,1,'45539c7c-cdab-4db0-986d-a1abee982128'),
(516,829,0,'SVC-MSExchangeMTA',6,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',0,60,'127.0.0.1','2','MSExchangeMTA',1,'1','',1,0,'',5,142,1,'1001e81b-8331-4e6a-89cc-c24d7a146d80'),
(517,829,503,'SVC-POP3Svc',6,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',0,60,'127.0.0.1','2','POP3Svc',1,'1','',1,0,'',5,142,1,'9913f17f-7357-4e6d-8ad6-36b67b7e4cad'),
(518,829,0,'SVC-RESvc',6,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',0,60,'127.0.0.1','2','RESvc',1,'1','',1,0,'',5,142,1,'06e9ec1f-2c28-4f7b-93c2-c8e09d020710'),
(519,829,0,'SVC-MSExchangeSA',6,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',0,60,'127.0.0.1','2','MSExchangeSA',1,'1','',1,0,'',5,142,1,'f394a08f-7762-40aa-8d21-40a5e22de97c'),
(520,829,0,'Perf - Work Queue Length',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.',0,60,'127.0.0.1','0','MSExchangeMTA!!!Work Queue Length!!!',4,'10','',1,0,'',7,122,1,'eb554660-8fef-4fd4-ab8c-e48b744af1a6'),
(521,829,0,'Perf - RPC Requests',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.',0,60,'127.0.0.1','0','MSExchangeIS!!!RPC Requests!!!',4,'30','',1,0,'',7,122,1,'efb6edfe-eacb-461a-95e8-3f72beb42cdf'),
(522,829,0,'Perf - RPC Averaged Latency',5,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.',0,60,'127.0.0.1','0','MSExchangeIS!!!RPC Averaged Latency!!!',4,'50','',1,0,'',7,122,1,'59aea649-8a90-4a76-9c37-ae68e17a6ce6'),
(523,829,0,'Perf - Send Queue Size',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.',0,60,'127.0.0.1','0','MSExchangeIS Public!!!Send Queue Size!!!',4,'500','',1,0,'',7,122,1,'37d6008b-2e15-45ee-a5c0-f8200a4094da'),
(524,829,0,'Perf - Receive Queue Size',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.',0,60,'127.0.0.1','0','MSexchangeIS Public!!!Recieve Queue Size!!!',4,'500','',1,0,'',7,122,1,'b33e5e83-1158-4752-b8b6-28ce38491a6c'),
(525,829,0,'Perf - Local Queue Length',5,3,'Local Queue Length',0,60,'127.0.0.1','0','SMTP Server!!!Local Queue Length!!!',4,'1000','',1,0,'',7,122,1,'07754258-a6fb-48ad-a02e-2ed88719920b'),
(526,829,0,'Perf - Remote Queue Length',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.',0,60,'127.0.0.1','0','SMTP Server!!!Remote Queue Length!!!',4,'1000','',1,0,'',7,122,1,'2c737642-d075-47ee-b27b-de994ba245ba'),
(527,829,0,'Perf - Categorizer Queue Length',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.',0,60,'127.0.0.1','0','SMTP Server!!!Categorizer Queue Length!!!',4,'10','',1,0,'',7,122,1,'a5d977f7-95d4-4a1c-bc04-184a79e6fcc0'),
(528,829,0,'Perf - Send Queue Size',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.',0,60,'127.0.0.1','0','MSExchange IS!!!Send Queue Size!!!',4,'500','',1,0,'',7,122,1,'077e4c34-08de-4f4f-b309-4be2798d044a'),
(530,829,0,'SVC-SMTPSVC',6,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.',0,60,'127.0.0.1','2','SMTPSVC',1,'1','',1,0,'',5,142,1,'43dbd965-0496-4814-92dd-1f604afb4842'),
(645,829,0,'EV - Exchange DB Size',6,3,'%NAME%~~~%RESULT%',0,60,'127.0.0.1','6','*!!!0!!!MSExchangeIS Mailbox Store!!!9690!!!*',1,'1','',1,0,'',16,106,1,'4415e703-174c-4343-84d6-4e8d5efefdd1'),
(666,846,0,'Perf - Logical Connections',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.',0,300,'127.0.0.1','0','MSSQL$BLACKBERRY:General Statistics!!!Logical Connections!!!',6,'','',1,0,'',7,121,1,'d9d0b673-1244-4c94-90c3-2a9909547980'),
(667,846,0,'Perf - User Connections',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.',0,300,'127.0.0.1','0','MSSQL$BLACKBERRY:General Statistics!!!User Connections!!!',6,'','',1,0,'',7,121,1,'9e25795f-7023-4e12-b0a8-abaad97d84c5'),
(668,846,0,'Perf - Processes Blocked',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.',0,60,'127.0.0.1','0','MSSQL$BLACKBERRY:General Statistics!!!Processes blocked!!!',6,'','',1,0,'',7,121,1,'2e36bf7b-76f0-46c2-8156-4ae5153496da'),
(669,846,0,'Perf - DTC Calls',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.',0,60,'127.0.0.1','0','MSSQL$BLACKBERRY:Exec Statistics!!!DTC calls!!!',6,'','',1,0,'',7,121,1,'cd1a6340-25c0-4933-9b22-9d4bacc77f6b'),
(685,1168,693,'SVC-exim4',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','exim4',1,'1','',1,0,'',5,134,1,'08b70188-9627-40f3-aaed-6ed88d7c5be5'),
(686,1169,0,'SVC-notification',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|MacService=notification|tzcompdisabled=1|priority=5',0,120,'127.0.0.1','7','serveradmin status notification',5,'RUNNING','',1,0,'',5,134,1,'0a5f447b-6983-4879-8411-e5fc890429c6'),
(694,1173,0,'SVC-jabber',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|MacService=jabber|tzcompdisabled=1|priority=5',0,120,'127.0.0.1','7','/Applications/Server.app/Contents/ServerRoot/usr/sbin/serveradmin status jabber',5,'RUNNING','',1,0,'',5,134,1,'31370b6c-7b02-4db3-aeed-ad7e5e45efc0'),
(704,1190,0,'SVC-calendar',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|MacService=calendar|tzcompdisabled=1|priority=5',0,120,'127.0.0.1','7','/Applications/Server.app/Contents/ServerRoot/usr/sbin/serveradmin status calendar',5,'RUNNING','',1,0,'',5,134,1,'4808a99b-403d-452c-b2ee-5cb9877b4abc'),
(714,1172,0,'SVC-addressbook',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|MacService=addressbook|tzcompdisabled=1|priority=5',0,120,'127.0.0.1','7','/Applications/Server.app/Contents/ServerRoot/usr/sbin/serveradmin status addressbook',5,'RUNNING','',1,0,'',5,134,1,'5e299dbd-19ce-45b6-a05c-1b8adef0caa5'),
(726,1182,693,'SVC-dovecot',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','dovecot',1,'1','',1,0,'',5,134,1,'87893384-d0d3-401e-ba02-4f17f717d236'),
(732,1181,693,'SVC-postfix',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','postfix',1,'1','',1,0,'',5,134,1,'94d16ddf-4a98-4e4a-ad3f-6b9c1dc90f9d'),
(754,1203,0,'SVC-mail',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.|MacService=mail|tzcompdisabled=1|priority=5',0,120,'127.0.0.1','7','/Applications/Server.app/Contents/ServerRoot/usr/sbin/serveradmin status mail',5,'RUNNING','',1,0,'',5,134,1,'e63493c9-aa54-4d0e-b011-cb2cc1d06111'),
(794,1206,734,'EV -  4110 DAG Log Replay Suspended',6,3,'%NAME%~~~%RESULT%\n|tzcompdisabled=1|priority=5!!!%NAME%~~~%RESULT%\n|tzcompdisabled=1|priority=5',0,600,'127.0.0.1','6','*!!!0!!!MSExchangeRepl!!!4110!!!*',1,'1','',1,0,'',16,106,1,'42f6f7c7-e26e-4c5d-b045-9cf7a57aafe2'),
(795,1206,734,'EV -  4111 DAG Log Replay Resumed',6,3,'%NAME%~~~%RESULT%\n|tzcompdisabled=1|priority=5!!!%NAME%~~~%RESULT%\n|tzcompdisabled=1|priority=5',0,600,'127.0.0.1','6','*!!!0!!!MSExchangeRepl!!!4111!!!*',1,'1','',1,0,'',16,106,1,'7ea342d5-123e-4e2a-8584-a8275fa70ed4'),
(796,1206,734,'EV - 10036 DAG Block Mode',6,3,'%NAME%~~~%RESULT%\n|tzcompdisabled=1|priority=5!!!%NAME%~~~%RESULT%\n|tzcompdisabled=1|priority=5',0,600,'127.0.0.1','6','*!!!0!!!MSExchangeRepl!!!10036!!!*',1,'1','',1,0,'',16,106,1,'0de0d492-800f-494a-b691-77fc3ab9ce9a'),
(797,1206,734,'EV - 1062 Cluster Online',6,3,'%NAME%~~~%RESULT%\n|tzcompdisabled=1|priority=5',0,300,'127.0.0.1','6','*!!!0!!!FailoverClustering!!!1062!!!*',1,'1','',1,0,'',16,105,1,'4a8dd2b9-ae6b-473d-9dc8-33bc45b197cd'),
(798,1206,734,'EV - 1125 Cluster Online',6,3,'%NAME%~~~%RESULT%\n|tzcompdisabled=1|priority=5',0,300,'127.0.0.1','6','*!!!0!!!FailoverClustering!!!1125!!!*',1,'1','',1,0,'',16,105,1,'21ee1e84-1703-4605-bbf5-f49d2d5b61cb'),
(799,1206,734,'EV - 1204 Cluster Offline',6,3,'%NAME%~~~%RESULT%\n|tzcompdisabled=1|priority=5',0,300,'127.0.0.1','6','*!!!0!!!FailoverClustering!!!1204!!!*',1,'1','',1,0,'',16,105,1,'11933ba8-ead4-470a-8cf8-f5b472f5e534'),
(800,1206,734,'EV - 15002 Exchange Backpressure',6,3,'%NAME%~~~%RESULT%\n|tzcompdisabled=1|priority=3',0,300,'127.0.0.1','6','*!!!0!!!MSExchangeTransport!!!15002!!!*',1,'1','',1,0,'',16,106,1,'2f9e76bf-117c-4e18-8813-08655ae4b016'),
(801,1206,734,'EV - 15004 Exchange Backpressure',6,3,'%NAME%~~~%RESULT%\n|tzcompdisabled=1|priority=3',0,300,'127.0.0.1','6','*!!!0!!!MSExchangeTransport!!!15004!!!*',1,'1','',1,0,'',16,106,1,'1518a815-b74a-40a3-932b-e4c98d6af70c'),
(802,1206,734,'EV - 15006 Exchange Backpressure',6,3,'%NAME%~~~%RESULT%\n|tzcompdisabled=1|priority=3',0,300,'127.0.0.1','6','*!!!0!!!MSExchangeTransport!!!15006!!!*',1,'1','',1,0,'',16,106,1,'0d31b48c-3f56-476f-826a-7d8107c8387f'),
(803,1206,734,'EV - 1561 Cluster Offline',6,3,'%NAME%~~~%RESULT%\n|tzcompdisabled=1|priority=3',0,300,'127.0.0.1','6','*!!!0!!!FailoverClustering!!!1561!!!*',1,'1','',1,0,'',16,105,1,'20477012-0635-44a8-96a1-66c1261ff656'),
(804,1206,734,'EV - 2090 DAG Failover',6,3,'%NAME%~~~%RESULT%\n|tzcompdisabled=1|priority=3',0,300,'127.0.0.1','6','*!!!0!!!MSExchangeRepl!!!2090!!!*',1,'1','',1,0,'',16,106,1,'2e4fc145-aa06-43aa-ae2e-379c7ae749ec'),
(805,1206,734,'EV - 2153 DAG Communication',6,3,'%NAME%~~~%RESULT%\n|tzcompdisabled=1|priority=3',0,300,'127.0.0.1','6','*!!!0!!!MSExchangeRepl!!!2153!!!*',1,'1','',1,0,'',16,106,1,'309d7c85-4e22-4ed6-bab0-d60c529317be'),
(806,1206,737,'Perf - Active Mailbox Delivery Queue',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\n\n\n|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','MSExchangeTransport Queues!!!Active Mailbox Delivery Queue Length!!!_total',4,'250','',1,0,'',7,122,1,'28c3095c-3d6c-4725-bef2-a1950f694149'),
(807,1206,737,'Perf - Active Non-SMTP Delivery Queue',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\n\n\n|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','MSExchangeTransport Queues!!!Active Non-Smtp Delivery Queue Length!!!_total',4,'250','',1,0,'',7,122,1,'6cfa52a7-8536-43e1-9e7c-7e8f064eb63a'),
(808,1206,737,'Perf - Active Remote Delivery Queue Length',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\n\n\n|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','MSExchangeTransport Queues!!!External Active Remote Delivery Queue Length!!!_total',4,'250','',1,0,'',7,122,1,'395db1fb-9586-4686-b9fc-6a4ae29198a1'),
(809,1206,737,'Perf - Aggregate Delivery Queue Length',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\n\n\n|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','MSExchangeTransport Queues!!!External Aggregate Delivery Queue Length (All External Queues)!!!_total',4,'3000','',1,0,'',7,122,1,'953b7a0c-c71f-4d8b-8f9b-ae43c5a34685'),
(810,1206,739,'Perf - Database Page Fault Stalls/sec',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\n\n\n|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','MSExchange Database!!!Database Page Fault Stalls/sec!!!Information Store',1,'0','',1,0,'',7,122,1,'0945f4e8-163e-4ff3-88b8-ff72365becbc'),
(811,1206,737,'Perf - Largest Delivery Queue Length',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\n\n\n|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','MSExchangeTransport Queues!!!External Largest Delivery Queue Length!!!_total',4,'200','',1,0,'',7,122,1,'1b54aac6-015e-48f4-9a0e-8049a7e47ede'),
(812,1206,734,'Perf - LDAP Read Time',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\n\n\n|tzcompdisabled=1|priority=3',0,300,'127.0.0.1','0','MSExchange ADAccess Domain Controllers!!!LDAP Read Time!!!*',4,'100','',1,0,'',7,122,1,'8af6305d-6bb1-4333-b715-01505d2ef834'),
(813,1206,734,'Perf - LDAP Search Time',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\n\n\n|tzcompdisabled=1|priority=3',0,300,'127.0.0.1','0','MSExchange ADAccess Domain Controllers!!!LDAP Search Time!!!*',4,'100','',1,0,'',7,122,1,'26a41143-27f3-401e-90d0-52e0f27814da'),
(814,1206,734,'Perf - LDAP Searches Timed Out',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\n\n\n|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','MSExchange ADAccess Domain Controllers!!!LDAP Searches Timed Out per Minute!!!',4,'10','',1,0,'',7,122,1,'52751e47-019a-45dc-9ba2-dfe3aacc5364'),
(815,1206,739,'Perf - Log Generation Checkpoint Depth',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\n\n\n|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','MSExchange Database ==> Instances!!!Log Generation Checkpoint Depth!!!',4,'500','',1,0,'',7,122,1,'9663806b-3c13-43a7-89ea-590b680a65fa'),
(816,1206,734,'Perf - Long Running LDAP Operations',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\n\n\n|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','MSExchange ADAccess Domain Controllers!!!Long Running LDAP Operations/min!!!*',4,'50','',1,0,'',7,122,1,'93b4d6c8-34e6-45f4-aa27-1657ead71842'),
(817,1206,739,'Perf - Messages Queued for Submission',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\n\n\n|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','MSExchangeIS Mailbox!!!Messages Queued For Submission!!!_Total',4,'50','',1,0,'',7,122,1,'010306cf-c9c2-4f4e-9fd6-07884cc178a7'),
(818,1206,739,'Perf - Messages Queued for Submission Public',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\n\n\n|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','MSExchangeIS Public!!!Messages Queued For Submission!!!_Total',4,'20','',1,0,'',7,122,1,'0d3cf3f2-b6d3-4132-8b75-ac68ffcfe6a6'),
(820,1206,737,'Perf - OWA Average Search Time',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\n\n\n|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','MSExchange OWA!!!Average Search Time!!!',4,'5000','',1,0,'',7,122,1,'6311ac0c-435d-4d92-a691-878e5a155211'),
(821,1206,737,'Perf - Poison Queue Length',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%. \nExplanation \nThe Poison Queue Length performance counter measures the number of messages currently in the poison queue. Messages in the poison message queue are in a permanently suspended state.\n\nThis alert indicates that the Poison Queue Length has been greater than 1 for five minutes. \n\nThe poison message queue contains messages that are determined to be potentially harmful to the Microsoft Exchange Server 2007 server after a server failure. The messages may be genuinely harmful in their content and format. Alternatively, they may be the results of a poorly written agent that has caused the Exchange server to fail when it processed the supposedly bad messages.\n\nMessages remain in the poison message queue until they are manually resumed or removed by an administrator. The messages in the poison message queue are never automatically resumed or expired.\n\n  User Action \nTo resolve this alert, resubmit or remove the messages from the poison message queue. You can resubmit the messages that are in the poison message queue by using the Exchange Queue Viewer or by running the Resume-Message cmdlet. You can remove messages from the poison message queue by using Queue Viewer or by running the Remove-Message cmdlet.  \n\n\n|tzcompdisabled=1|priority=3\n\n',0,60,'127.0.0.1','0','MSExchangeTransport Queues!!!Poison Queue Length!!!_total',1,'0','',1,0,'',7,122,1,'6a1e0cf2-9c47-4109-be57-689302b582d3'),
(822,1206,737,'Perf - Retry Remote Delivery Queue Length',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\n\n\n|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','MSExchangeTransport Queues!!!Retry Remote Delivery Queue Length!!!_total',4,'100','',1,0,'',7,122,1,'5e58cdc0-2e3e-42f6-bd86-66a34f248233'),
(823,1206,737,'Perf - Submission Queue Length',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\n\n\n|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','MSExchangeTransport Queues!!!Submission Queue Length!!!_total',4,'500','',1,0,'',7,122,1,'24de9931-8073-4f49-a7af-752a58e774b5'),
(824,1206,737,'Perf - Unreachable Queue Length',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\n\n\n|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','MSExchangeTransport Queues!!!Unreachable Queue Length!!!_total',4,'100','',1,0,'',7,122,1,'4845f827-7451-4a88-96ba-65f0fcc475f0'),
(825,1206,739,'Perf - Version Buckets Allocated',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\n\n\n|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','MSExchange Database!!!Version Buckets Allocated!!!Information Store',4,'12000','',1,0,'',7,122,1,'3e7c77b8-e405-4971-be68-3d9ecb952df7'),
(826,1206,738,'SVC-MSExchangeADAM',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.\n|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','ADAM_MSExchange',1,'1','',1,0,'',5,142,1,'e8e47aaf-404e-49fc-b8ae-3292f5c2e785'),
(827,1206,736,'SVC-MSExchangeADTopology',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.\n|tzcompdisabled=1|priority=5!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.\n|tzcompdisabled=1|priority=5',1,60,'127.0.0.1','2','MSExchangeADTopology',1,'1','',1,0,'',5,142,1,'0bd37f2f-44b4-4310-950c-906509d8670c'),
(828,1206,735,'SVC-MSExchangeAntispamUpdate',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.\n|tzcompdisabled=1|priority=5',1,60,'127.0.0.1','2','MSExchangeAntispamUpdate',1,'1','',1,0,'',5,142,1,'316b5380-f470-480c-b8cb-08e52ed486e9'),
(830,1206,738,'SVC-MSExchangeEdgeCred',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.\n|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','MSExchangeEdgeCredential',1,'1','',1,0,'',5,142,1,'2af43898-6cde-44f4-ba1b-56b4d185c229'),
(831,1206,737,'SVC-MSExchangeEdgeSync',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.\n|tzcompdisabled=1|priority=5!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.\n|tzcompdisabled=1|priority=5',1,60,'127.0.0.1','2','MSExchangeEdgeSync',1,'1','',1,0,'',5,142,1,'644c0458-a09d-4553-b54b-f0f0fd2b4e24'),
(833,1206,500,'SVC-MSExchangeIMAP4',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.\n|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','MSExchangeIMAP4',1,'1','',1,0,'',5,142,1,'bd0af647-0b16-432d-bbb9-34ff006ffc12'),
(834,1206,739,'SVC-MSExchangeIS',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.\n|tzcompdisabled=1|priority=5',1,60,'127.0.0.1','2','MSExchangeIS',1,'1','',1,0,'',5,142,1,'79c4a19a-5e29-490f-8dfc-1e73d0f158a4'),
(835,1206,739,'SVC-MSExchangeMailboxAssistants',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.\n|tzcompdisabled=1|priority=5',1,60,'127.0.0.1','2','MSExchangeMailboxAssistants',1,'1','',1,0,'',5,142,1,'3a84f4fc-cf71-4f37-87c1-ca034f96e9d3'),
(836,1206,737,'SVC-MSExchangeMailboxReplication',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.\n|tzcompdisabled=1|priority=5',1,60,'127.0.0.1','2','MSExchangeMailboxReplication',1,'1','',1,0,'',5,142,1,'85f264ce-306a-417e-b2a0-44b69f7c75da'),
(837,1206,503,'SVC-MSExchangePOP3',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.\n|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','MSExchangePOP3',1,'1','',1,0,'',5,142,1,'45365393-743d-4198-ac68-742c8af0276d'),
(838,1206,739,'SVC-MSExchangeRepl',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.\n|tzcompdisabled=1|priority=5',1,60,'127.0.0.1','2','MSExchangeRepl',1,'1','',1,0,'',5,142,1,'1a3541e2-6b78-42a3-a1e1-26f65180bde7'),
(839,1206,734,'SVC-MSExchangeServiceHost',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.\n|tzcompdisabled=1|priority=5',1,60,'127.0.0.1','2','MSExchangeServiceHost',1,'1','',1,0,'',5,142,1,'52d4bcca-9ce6-43f3-913e-170c6a765dc1'),
(841,1206,739,'SVC-MSExchangeThrottling',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.\n|tzcompdisabled=1|priority=5',1,60,'127.0.0.1','2','MSExchangeThrottling',1,'1','',1,0,'',5,142,1,'1688f7ae-0d53-4fa2-b87a-c56c4f6e670c'),
(842,1206,735,'SVC-MSExchangeTransport',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.\n|tzcompdisabled=1|priority=5',1,60,'127.0.0.1','2','MSExchangeTransport',1,'1','',1,0,'',5,142,1,'6d305383-3d78-45ee-bc8c-cddff0d87190'),
(843,1206,734,'SVC-MSExchangeTransportLogSearch',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.\n|tzcompdisabled=1|priority=5!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.\n|tzcompdisabled=1|priority=5',1,60,'127.0.0.1','2','MSExchangeTransportLogSearch',1,'1','',1,0,'',5,142,1,'44562415-cecd-4c90-b230-04108e4c35cf'),
(844,1206,737,'SVC-MSExchangeUM',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.\n|tzcompdisabled=1|priority=5!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.\n|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','MSExchangeUM',1,'1','',1,0,'',5,142,1,'21b91b6d-361c-41bd-b91d-cf8c0835ee2c'),
(845,1206,578,'SVC-MSSpeechService',6,15,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.\n|tzcompdisabled=1|priority=5',0,60,'127.0.0.1','2','MSSpeechService',1,'1','',1,0,'',5,142,1,'38a3db2e-724f-47d7-8924-d63440c598a3'),
(861,831,417,'Perf - OWA Average Response Time',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\n\n\n|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','MSExchange OWA!!!Average Response Time!!!',4,'200','',1,0,'',7,122,1,'71bab4cf-a766-4063-bc0a-2631548118dc'),
(862,1206,737,'Perf - OWA Average Response Time',5,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.\n\n\n|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','0','MSExchange OWA!!!Average Response Time!!!',4,'200','',1,0,'',7,122,1,'8f843ab8-0b80-4274-a9ff-75e3456fbaaf');

/*Table structure for table `plugin_messaging_deprecatedmonitors` */

DROP TABLE IF EXISTS `plugin_messaging_deprecatedmonitors`;

CREATE TABLE `plugin_messaging_deprecatedmonitors` (
  `GUID` char(36) NOT NULL,
  `MonitorName` varchar(255) NOT NULL,
  PRIMARY KEY (`GUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `plugin_messaging_deprecatedmonitors` */

insert  into `plugin_messaging_deprecatedmonitors`(`GUID`,`MonitorName`) values 
('00fd60fc-716b-4755-90ae-809867f6e457','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2010 Servers'),
('010306cf-c9c2-4f4e-9fd6-07884cc178a7','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('013c41b9-0785-4003-ae7d-115a0d61d32d','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2010 Servers'),
('0207959f-dcb9-4343-a913-ec61891b1be1','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('02fd0895-c9df-45e0-859f-50bb29c92916','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers - SVC-MSExchangeADAM'),
('03ccab4c-1a76-4b0f-a037-6bdf5c629108','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('045a00d6-df08-470d-81a0-d3991e6d4a20','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2007 Servers'),
('04c579b7-5b71-4080-858e-2c255a90038c','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Blackberry Servers'),
('062091d1-f691-4a9c-9653-aef08a47efb0','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers - Perf - Log Generation Checkpoint Depth'),
('068a1cd3-086b-4968-b127-fb9f9e5089cf','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers - SVC-MSExchangeMailboxReplication'),
('0694f7fa-1fc3-4425-9653-dad5ad1a9089','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers - Perf - LDAP Search Time'),
('06e9ec1f-2c28-4f7b-93c2-c8e09d020710','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2003 Servers'),
('07754258-a6fb-48ad-a02e-2ed88719920b','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2003 Servers'),
('077e4c34-08de-4f4f-b309-4be2798d044a','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2003 Servers'),
('0800de8a-0711-4cb8-8fcc-298d8f29a4ba','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2007 Servers'),
('08b70188-9627-40f3-aaed-6ed88d7c5be5','Service Plans.Linux Machines.Server Roles.Linux Messaging Services.Linux SMTP-Exim4 Servers'),
('0945f4e8-163e-4ff3-88b8-ff72365becbc','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('094f1252-a9cd-4e08-9a36-4ea8e9d92c1c','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2007 Servers'),
('099496fa-df14-4af3-b870-1fe36e633e55','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2010 Servers'),
('09dedba9-41b8-4910-8fc2-9db4ca912b32','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers - SVC-MSExchangeIMAP4'),
('0a5f447b-6983-4879-8411-e5fc890429c6','Service Plans.MAC Servers.Server Roles.OS X Messaging Services.OS X Messaging - Mail - Notification'),
('0ab733b0-7c1f-40dc-909f-8d07f91cf28d','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2007 Servers'),
('0ac9bf57-2235-4c3c-84b0-615f1b027cf3','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2010 Servers'),
('0b522235-4cc9-442d-baf9-79e06ff15d33','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2007 Servers'),
('0bd37f2f-44b4-4310-950c-906509d8670c','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('0d31b48c-3f56-476f-826a-7d8107c8387f','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('0d3cf3f2-b6d3-4132-8b75-ac68ffcfe6a6','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('0dd2e341-e4ab-4bde-b586-80dc2aa58bb9','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2007 Servers'),
('0de0d492-800f-494a-b691-77fc3ab9ce9a','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('1001e81b-8331-4e6a-89cc-c24d7a146d80','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2003 Servers'),
('116dea72-e3af-42c3-a86f-cbf4d7afc008','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('11933ba8-ead4-470a-8cf8-f5b472f5e534','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('14326577-026a-428b-9803-ec2ad9f83ffe','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2010 Servers'),
('1518a815-b74a-40a3-932b-e4c98d6af70c','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('1595da09-ac7d-4d80-aa42-fdf40b63e264','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2010 Servers'),
('15fc8749-63bf-452a-b864-fabc4a896a09','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('16052b2a-4add-47f2-8003-9498072dba4d','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('1688f7ae-0d53-4fa2-b87a-c56c4f6e670c','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('1713963b-adc0-4f54-844c-72ee82c852cd','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('171d03b8-518c-4cfe-8ed9-cf9fd1a9826a','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers - EV - 1204 Cluster Offline'),
('176f19db-c6ac-4360-8417-88fc8bf30f68','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2010 Servers'),
('17a5de4c-bfa3-406c-90a8-a31e61b6866b','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers - SVC-MSExchangeAntispamUpdate'),
('17decb13-1606-465d-bec3-ac37a535b245','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('196d49bd-94f7-4969-b338-3d57f79f240b','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2007 Servers'),
('199e9516-a13b-42b9-840e-df80458e0529','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('1a3541e2-6b78-42a3-a1e1-26f65180bde7','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('1b54aac6-015e-48f4-9a0e-8049a7e47ede','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('1baba9ea-7325-40fc-9a7e-6159a8dad8a1','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers - Perf - Active Remote Delivery Queue Length'),
('1c1e06cc-aa6f-45f8-8080-eccd29fa8d9a','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers - SVC-MSExchangeFBA'),
('1ca0f159-1f75-40aa-a928-5c4aef6c5ec1','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2007 Servers'),
('1e16768b-b742-4e8a-ab65-7588f0f378ed','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers - EV - 1062 Cluster Online'),
('1e171f0f-6216-489e-a835-d7bcefc8836a','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2010 Servers'),
('1ed4d557-1aed-4162-8654-3f3405973b18','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers - EV - 2153 DAG Communication'),
('1ffa5c34-279c-426e-8c04-3ae2f423e26d','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('20477012-0635-44a8-96a1-66c1261ff656','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('218c5775-4d3f-4713-9e1e-a62ca4c982fd','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2010 Servers'),
('21938f3a-dd45-4aa3-b262-3487ef85ec4f','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers - EV - 1125 Cluster Online'),
('21b91b6d-361c-41bd-b91d-cf8c0835ee2c','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('21ee1e84-1703-4605-bbf5-f49d2d5b61cb','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('23127f45-fa8b-4ddc-b83a-a13fbfaef47f','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('2448605c-8bb1-4738-9745-687a271fdfc6','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Blackberry Servers'),
('24de9931-8073-4f49-a7af-752a58e774b5','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('256bea0f-a30b-4e52-a73b-eeaa34cacf1e','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('259f2ab5-c6a7-497b-a323-ad1603cafa50','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers - Perf - Version Buckets Allocated'),
('26a41143-27f3-401e-90d0-52e0f27814da','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('27f329fe-7228-4094-aa61-7f702fb93220','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2007 Servers'),
('287656c5-0047-4456-8b85-cb8a6faf220c','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('28a7fa00-e6d7-4fe4-92b0-b6505a55ffa9','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers - Perf - Poison Queue Length'),
('28c3095c-3d6c-4725-bef2-a1950f694149','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('2930bc89-90cb-4afa-8477-06f8c4c11512','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2010 Servers'),
('2942dbfb-cf44-4509-a777-c79a2d525dd4','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2007 Servers'),
('2a01c924-7089-4679-87c2-766d27f80485','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2010 Servers'),
('2af43898-6cde-44f4-ba1b-56b4d185c229','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('2b5d0401-94ce-4243-87d3-b4f128f5614f','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2007 Servers'),
('2b6d2fd3-0568-4dcc-a65a-379810ca0a4a','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers - EV - 10036 DAG Block Mode'),
('2c737642-d075-47ee-b27b-de994ba245ba','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2003 Servers'),
('2e36bf7b-76f0-46c2-8156-4ae5153496da','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Blackberry Servers'),
('2e4fc145-aa06-43aa-ae2e-379c7ae749ec','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('2ee7c32c-4cff-4e66-aa9b-2275d0275680','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('2f04016f-de78-458a-8350-dab109014815','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2010 Servers'),
('2f0b2d76-53a3-4927-b2b8-2382ff1e43f1','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2010 Servers'),
('2f9e76bf-117c-4e18-8813-08655ae4b016','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('309d7c85-4e22-4ed6-bab0-d60c529317be','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('31370b6c-7b02-4db3-aeed-ad7e5e45efc0','Service Plans.MAC Servers.Server Roles.OS X Messaging Services.OS X Messaging - Chat'),
('316b5380-f470-480c-b8cb-08e52ed486e9','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('319aa388-4f46-490b-8898-61e8cef402c3','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2007 Servers'),
('321d83a9-2688-42bd-962e-47c14e584eff','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers - Perf - Active Non-SMTP Delivery Queue'),
('327b929d-6eff-425f-a565-c192320c1095','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('33387db6-41ed-416b-a1bc-b8710e7aadde','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers - SVC-MSExchangeFDS'),
('33e496e0-9af4-4cc3-93b5-8b197f68f59f','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('3629f40e-54b1-4718-8e3f-85fc49c394cb','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2010 Servers'),
('36512127-cb08-49ac-a68e-a54ddf393b87','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers - SVC-MSExchangeThrottling'),
('3759724d-5e9c-4fe7-907d-63f734aa8b3c','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2007 Servers'),
('3798393b-75ed-4638-8457-0ae2d56c8781','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('37d6008b-2e15-45ee-a5c0-f8200a4094da','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2003 Servers'),
('38a3db2e-724f-47d7-8924-d63440c598a3','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('395db1fb-9586-4686-b9fc-6a4ae29198a1','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('3a84f4fc-cf71-4f37-87c1-ca034f96e9d3','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('3b42a75b-eb12-4b19-9d5d-8b2ae823d460','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('3c1269e2-b586-4422-9f14-d1600a506212','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers - EV - 1561 Cluster Offline'),
('3da00585-e151-4283-bbd2-1091f22d3dac','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2007 Servers'),
('3e602c64-f014-4453-8775-137d38d58ddf','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2010 Servers'),
('3e7c77b8-e405-4971-be68-3d9ecb952df7','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('40a8109c-e12c-4d86-a8e5-0bad0a8256fe','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('40df7865-9407-4f29-9a70-0c017c6aa7ad','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers - SVC-MSExchangeTransportLogSearch'),
('40eda971-d58c-422d-8334-2451673b8414','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2010 Servers'),
('42ddddfa-f395-4813-8826-40e920d5bf39','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers - SVC-MSExchangeProtectedServiceHost'),
('42f6f7c7-e26e-4c5d-b045-9cf7a57aafe2','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('433d4ae5-b154-4e1f-a08f-55b78071ef5a','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers - Perf - LDAP Read Time'),
('43dbd965-0496-4814-92dd-1f604afb4842','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2003 Servers'),
('4415e703-174c-4343-84d6-4e8d5efefdd1','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2003 Servers'),
('44562415-cecd-4c90-b230-04108e4c35cf','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('445bc23f-a2b3-48dd-865b-9ba95608b05e','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers - SVC-MSExchangeADTopology'),
('44c6e7fa-a9d2-4397-b0d4-a222e5868cd7','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('45365393-743d-4198-ac68-742c8af0276d','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('45539c7c-cdab-4db0-986d-a1abee982128','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2003 Servers'),
('47379ccb-bbdd-436e-9af6-62ab62f6943b','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers - SVC-MSExchangeSubmission'),
('4808a99b-403d-452c-b2ee-5cb9877b4abc','Service Plans.MAC Servers.Server Roles.OS X Messaging Services.OS X Messaging - Calendar'),
('4845f827-7451-4a88-96ba-65f0fcc475f0','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('487b8915-ad2b-40f0-932b-bf14767fc34f','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2007 Servers'),
('4a3beeee-f3f0-4ce8-9b14-35011a80512b','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2010 Servers'),
('4a8dd2b9-ae6b-473d-9dc8-33bc45b197cd','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('4b55442d-842d-4f6a-8a8b-513888decc04','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2010 Servers'),
('4ceaed78-e628-41ed-8cc4-cc7e74251d81','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2010 Servers'),
('4d25c591-a7c8-4073-aa8e-06c50e3a5218','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('514df943-24d5-49fc-a180-4a0ea7ca5ab1','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2007 Servers'),
('51c5e77c-e55c-4958-a668-db26a4e3448b','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2007 Servers'),
('51cdc531-4aac-49c4-ac63-b21a0982a390','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2010 Servers'),
('52751e47-019a-45dc-9ba2-dfe3aacc5364','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('52d4bcca-9ce6-43f3-913e-170c6a765dc1','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('54b5a318-03c6-4a4c-845b-0109537ea041','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2010 Servers'),
('58346a38-03b4-4b5a-99c0-94fa5071c228','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('59654161-ed5b-4a2b-bb6d-53c9abd97d02','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers - SVC-MSExchangeSearch'),
('598c6a5c-4953-40fc-8bec-d72a6b19af55','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2010 Servers'),
('59aea649-8a90-4a76-9c37-ae68e17a6ce6','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2003 Servers'),
('5c37de01-e3f2-4baa-8b62-b06dda8dd7aa','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('5c6ad31e-10e8-41a8-baaa-2141c4c75095','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2010 Servers'),
('5caa9488-231f-4fe4-a001-3ed6ffe8d697','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2010 Servers'),
('5d31585b-f83a-44c5-be6b-726197e78993','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('5e299dbd-19ce-45b6-a05c-1b8adef0caa5','Service Plans.MAC Servers.Server Roles.OS X Messaging Services.OS X Messaging - AddressBook'),
('5e3e2fd6-8ec4-4b0d-88b2-6d04b05ed917','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2010 Servers'),
('5e58cdc0-2e3e-42f6-bd86-66a34f248233','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('60b6a425-6be5-4022-bc74-3378fa0d6f8c','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2010 Servers'),
('6150135a-27fe-453f-8b91-a433a0d75090','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2007 Servers'),
('6210b2e9-1975-437d-8c21-fb00b87973b8','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Blackberry Servers'),
('6311ac0c-435d-4d92-a691-878e5a155211','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('644c0458-a09d-4553-b54b-f0f0fd2b4e24','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('65cb08ff-d39c-4346-949e-c8d1dca1c612','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('66a73c5a-698f-442a-b340-fafbb5ff36fd','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers - EV -  4110 DAG Log Replay Suspended'),
('69f3f186-4364-4016-bc49-0e36652ecd92','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2010 Servers'),
('6a1e0cf2-9c47-4109-be57-689302b582d3','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('6b413a8b-42a9-43be-9e78-c9ce84d9df16','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2010 Servers'),
('6b701169-4883-4168-98e9-161c767a5cb3','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2007 Servers'),
('6c1e6fb9-b14e-4cd8-9d0e-0a45a2e2fdc4','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2007 Servers'),
('6c438c49-a635-4fc7-8e49-fddcfa6dc296','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2010 Servers'),
('6cfa52a7-8536-43e1-9e7c-7e8f064eb63a','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('6d305383-3d78-45ee-bc8c-cddff0d87190','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('700f6161-f41f-41ab-88c3-68a25134e95a','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2010 Servers'),
('706bc5bb-ea09-44f4-a5d7-e05379f52001','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2010 Servers'),
('710f536b-ab36-4810-881c-7d8dc5542fda','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers - EV - 15006 Exchange Backpressure'),
('71bab4cf-a766-4063-bc0a-2631548118dc','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2010 Servers'),
('74ba1345-d0f7-46d3-9394-e7cb56f32b82','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2007 Servers'),
('75098b98-dbb9-44cd-978c-a7a4abf78819','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('764eb6b4-1210-442e-a925-d6137f68d5c5','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2010 Servers'),
('7937e7e9-081e-4b93-88ea-bfadc9a49c2f','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers - SVC-MSSpeechService'),
('79a9aaaf-3b84-40f6-a799-b0570b8d4b5a','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('79c4a19a-5e29-490f-8dfc-1e73d0f158a4','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('7a55956e-d69a-4ed0-900e-51272b28ef68','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('7aae0e2f-6585-4b92-92fe-065500b41c25','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2007 Servers'),
('7acf8cd1-4c18-4634-b648-85a4a406934d','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2010 Servers'),
('7ce49aa1-e480-481f-91ab-3a6f634d0c09','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('7d30c46d-c6fc-4294-bd86-59299cea8fb7','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('7e378fc3-70d7-45d8-9f03-93236416572b','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2007 Servers'),
('7ea342d5-123e-4e2a-8584-a8275fa70ed4','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('7f297ff6-f2a0-4ac9-acde-87886aaab786','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Blackberry Servers'),
('80429673-d43b-4be2-a6aa-f21a3a5232bf','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers - SVC-MSExchangeUM'),
('81cfa129-f654-498e-9883-0da168f39c87','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2010 Servers'),
('832c0aad-69d1-4703-8f40-cd45a4bc8c72','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2007 Servers'),
('83ab94fc-1927-444c-ba10-ed80a4bd01d5','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('8429ea62-33ae-4da4-bb68-02b1e9b5aaad','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers - SVC-MSExchangeServiceHost'),
('848332f1-dcc4-4b41-b49e-af7ac214841d','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2007 Servers'),
('84d04954-00a0-470a-8479-f605da6505f6','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('84ee65e6-e2b4-41af-9063-caa299b727e6','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2010 Servers'),
('85f264ce-306a-417e-b2a0-44b69f7c75da','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('86583ec4-da51-407f-b05a-23776e4fb1e7','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers - Perf - Database Page Fault Stalls/sec'),
('87893384-d0d3-401e-ba02-4f17f717d236','Service Plans.Linux Machines.Server Roles.Linux Messaging Services.Linux Mail-Dovecot Servers'),
('89542d8a-d9bf-466c-9ded-c3402900a107','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2010 Servers'),
('8af6305d-6bb1-4333-b715-01505d2ef834','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('8cd9cf03-b8de-4623-b8cd-2112408c5caa','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2010 Servers'),
('8e6a710c-bada-463b-a135-121cfb2bf863','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('8ead94bc-6156-4c4f-8407-dca8bc53a9ea','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers - EV - 15004 Exchange Backpressure'),
('8f050dd1-ef66-4172-80a5-260c97d783d3','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2010 Servers'),
('8f843ab8-0b80-4274-a9ff-75e3456fbaaf','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('8ffe0ee7-3235-414f-be31-e92f5affe426','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2007 Servers'),
('912cf5e7-c3ab-4473-a94b-ec58a1052b04','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers - SVC-MSExchangeIS'),
('91ba9249-647a-4500-bf2c-be2a4111db6f','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers - EV - 2090 DAG Failover'),
('93b4d6c8-34e6-45f4-aa27-1657ead71842','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('949434df-bb05-4215-938e-a3eaabd00b89','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('94d16ddf-4a98-4e4a-ad3f-6b9c1dc90f9d','Service Plans.Linux Machines.Server Roles.Linux Messaging Services.Linux SMTP-Postfix Servers'),
('952dd5e7-acaf-48c5-90a0-8e52a803c352','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2007 Servers'),
('953b7a0c-c71f-4d8b-8f9b-ae43c5a34685','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('95e7dbac-fdb1-4015-ace8-7d99a12049cf','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2010 Servers'),
('9663806b-3c13-43a7-89ea-590b680a65fa','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('981f67dd-186c-421c-b4bc-b1da4e9dd2ee','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers - SVC-MSExchangeEdgeSync'),
('984eb6cc-3df2-4707-83cf-b8aec816a519','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('99035b1d-aefc-464d-ab51-5609f071d42a','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('9913f17f-7357-4e6d-8ad6-36b67b7e4cad','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2003 Servers'),
('99427da1-1951-4b4f-89b6-034833dc0b72','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('998c3976-6c1e-4e22-b819-bcc4562c6b93','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2007 Servers'),
('9a9a79a5-fd03-4aec-87ec-2049d416f2c7','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2010 Servers'),
('9ba4fbb7-70e1-442e-8c8b-5529992982c2','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2010 Servers'),
('9c994cab-769a-407d-b9c5-b8e3cd65a319','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Blackberry Servers'),
('9e25795f-7023-4e12-b0a8-abaad97d84c5','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Blackberry Servers'),
('9e9a1553-c129-452d-8d55-771da609cb46','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('9ec87f74-3e6d-455d-a4e0-f35ba4f854c5','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('9f269651-14af-4182-8d25-dc7eab9e3335','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2007 Servers'),
('a00cf18c-d152-43fb-97f6-3dee15241937','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2007 Servers'),
('a0355ff7-d4e9-420f-9c3d-70951b960723','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers - SVC-MSExchangeFrontEndTransport'),
('a21c9817-4aef-4f2f-8399-e381824df0ba','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers - SVC-MSExchangeTransport'),
('a2525628-23db-49ab-943d-61ff5bdd72ab','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers - SVC-MSExchangeDelivery'),
('a2637018-fce3-40f0-b5ca-7beb6f6944af','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('a26d8d2f-a145-4663-8ffa-ca1536fa4b0b','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2010 Servers'),
('a46478c5-2260-4db5-bc6a-ad29a67751da','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('a5d977f7-95d4-4a1c-bc04-184a79e6fcc0','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2003 Servers'),
('a7608e97-d3c2-443b-a565-afc5b8b1db22','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('aa4a9837-394b-4920-bfa5-ca0ed726dd37','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers - SVC-MSExchangeAB'),
('aaff17ed-7633-4e48-a059-3ac7d39a6592','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers - EV - 15002 Exchange Backpressure'),
('ac6b53e2-c1f2-4dc7-86f4-636d830ee52e','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('adddad8e-10a4-45c3-81e7-95d30b29cc95','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers - Perf - LDAP Searches Timed Out'),
('aeb25a8b-6057-4f1a-bb6c-5b5c58030629','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers - Perf - Messages Queued for Submission'),
('b0a9d195-4e2e-4f23-ba8a-7753ae3a6c08','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2003 Servers'),
('b297a7b9-899c-45a8-bd4c-f9b2f3e9b546','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2010 Servers'),
('b33e5e83-1158-4752-b8b6-28ce38491a6c','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2003 Servers'),
('b34c6364-83c7-413a-a8da-4173be4113c7','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2010 Servers'),
('b3a7d859-81b9-49a9-bb6d-9201a5330fdb','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2003 Servers'),
('b4164eb8-f567-4799-923b-08f163cde42b','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2007 Servers'),
('b5242c5b-0b5b-4386-966d-607d6d7f69d5','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers - SVC-MSExchangeSA'),
('b5acef89-709d-4e59-b18c-b50d3f824789','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers - Perf - Active Mailbox Delivery Queue'),
('b63f2b12-491c-453f-9303-fd05fa4fb5b1','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('b8de7081-b97c-4379-8a99-b323b14939f8','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers - Perf - OWA Average Search Time'),
('b9fb2bef-b7ec-4a26-b577-95f9e25bb055','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers - Perf - Aggregate Delivery Queue Length'),
('bc9d83df-200d-4f5d-b65b-e5581d98d980','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('bce83073-232e-4382-bd67-8a5f0f786b74','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2010 Servers'),
('bd0af647-0b16-432d-bbb9-34ff006ffc12','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('bdbd61fd-b242-4409-8915-9a19dc178655','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers - Perf - OWA Average Response Time'),
('bf376390-c8c3-439f-be60-59e92fc09beb','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2007 Servers'),
('bf4c6441-6ec2-4cab-8b24-1146c0424425','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('c24c3f89-68e4-4830-9627-29682207c217','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('c27bc492-0f93-4899-a597-7c866b836094','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2010 Servers'),
('c63a081e-5bcc-4d35-8941-d17c3da5bc22','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers - Perf - Messages Queued for Submission Public'),
('c7f7596c-9ff2-4cba-a0c0-2ce598d25c07','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2007 Servers'),
('c8162012-ccd1-473a-abd0-b59a6b300e88','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2007 Servers'),
('c8294f12-3b1b-47b6-a33d-f0d533129960','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('c9cd95f6-e076-4d8e-85a5-e7f8a3723f12','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2007 Servers'),
('ca911e4e-3cee-410a-910d-cc37c22609ef','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2007 Servers'),
('cb121463-231c-4fbc-9255-894fd30c3bd6','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2007 Servers'),
('cb978c49-773d-42ce-9b2e-7cb53160b924','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2007 Servers'),
('cbacbd67-7244-4f35-9944-a52c141f17c3','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('cc4381c2-b9cd-44e3-bb7d-ee686bff18c7','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers - SVC-MSExchangeRepl'),
('cd1a6340-25c0-4933-9b22-9d4bacc77f6b','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Blackberry Servers'),
('cd1c8328-8149-41e8-a213-85d46c9cc2f3','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('cdaaf0f1-dae0-415b-bb7a-04798d7956f2','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2010 Servers'),
('ce366674-acff-46c4-9809-249903ea0e41','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2010 Servers'),
('ceaeb0c5-57f0-45ca-a381-d37ec1843793','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2007 Servers'),
('d1456a8a-89fd-4896-bee2-9c65d98c047c','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2010 Servers'),
('d228f414-b8e9-420e-911c-b20ff1d2b9e6','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2007 Servers'),
('d476633d-1da3-4ee5-9a3d-280f9848fd6a','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('d4c7c68b-c7ea-44c4-b0ef-b2cc58f77696','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2010 Servers'),
('d70c30a7-6c3a-49a1-9963-cc85debc8504','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('d721d7b8-83a7-4f5f-8950-690fb78ba4db','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2010 Servers'),
('d73105f6-ba19-47b4-be9b-78ec1114d619','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('d9c1dd68-0729-4565-a088-56b08f72d35e','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2010 Servers'),
('d9d0b673-1244-4c94-90c3-2a9909547980','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Blackberry Servers'),
('d9f684d9-b5fb-4ff0-801b-ac2607654b0f','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2010 Servers'),
('da3f1609-1036-4a67-a5e7-2e4edf63d022','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2010 Servers'),
('da9aca76-292e-4fc4-b3a5-b546b4c2e095','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('dba60be6-55e6-457e-a225-af5d1ec89747','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2010 Servers'),
('dd8a2b84-6a86-4387-ad5f-9699714dbe09','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('e1a84314-369f-4d8d-bd22-a65d887cfa85','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2010 Servers'),
('e1b9d5cf-5d5f-4630-9d56-413a22b4f473','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers - Perf - Unreachable Queue Length'),
('e1ddd7a1-4459-414c-8c49-58e88012353e','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers - Perf - Retry Remote Delivery Queue Length'),
('e22d8917-1d05-44eb-b805-f761ed66b043','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2007 Servers'),
('e3f98927-1b56-470c-8010-222678092656','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers - EV -  4111 DAG Log Replay Resumed'),
('e3fcb183-2039-40bb-a041-d3f64a35bcd2','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers - Perf - Submission Queue Length'),
('e40496f3-96bf-4466-8f77-dffe0dbeb2bf','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2007 Servers'),
('e63493c9-aa54-4d0e-b011-cb2cc1d06111','Service Plans.MAC Servers.Server Roles.OS X Messaging Services.OS X Messaging - Mail'),
('e8e47aaf-404e-49fc-b8ae-3292f5c2e785','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('e90cd0c9-a3a3-4e2d-84d5-44485eab1b44','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2010 Servers'),
('eb554660-8fef-4fd4-ab8c-e48b744af1a6','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2003 Servers'),
('ebdd4a98-0872-45c6-a5c8-0d6d323187c9','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2007 Servers'),
('ec1b2129-2c97-4455-8ecf-de3a668b9f82','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2010 Servers'),
('ee1b3ec5-8d52-410f-a9c1-6efd432d5e4f','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers - SVC-MSExchangePOP3'),
('eed3e79c-866d-4faf-af1c-579172723f14','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2007 Servers'),
('ef8936ed-aaca-4979-b4db-09bc5ac98707','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2010 Servers'),
('efb6edfe-eacb-461a-95e8-3f72beb42cdf','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2003 Servers'),
('f1978acf-3887-4955-9419-1eaaeb525b13','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('f2d90750-859c-47f2-8708-489a9c149b04','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers - SVC-MSExchangeEdgeCred'),
('f2f49dfc-3a37-493d-ba0b-80e480a0ada9','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2010 Servers'),
('f3173bf8-d75c-4355-871b-4dea9cc74caa','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2007 Servers'),
('f355ff4d-2603-4585-8752-1e585ca7305b','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('f38db7a8-d51c-42bb-92ea-bfebe5f32598','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers - Perf - Largest Delivery Queue Length'),
('f394a08f-7762-40aa-8d21-40a5e22de97c','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2003 Servers'),
('f53d8c90-16f6-4c15-93c9-365f2d7ef5e8','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('f76e217a-c097-49fd-8bff-afc0891296d3','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2007 Servers'),
('f94f8d7e-3698-4440-8382-1f8ec3d3c77c','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers - SVC-MSExchangeMailboxAssistants'),
('f9ce452e-86e2-48b5-b144-f8dc79a7b740','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers - Perf - Long Running LDAP Operations'),
('f9d061f0-ae96-46d6-86d6-77d4ffff6506','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2013 Servers'),
('fc14d3af-94c4-46ee-b9e2-3f8e92d9b592','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2007 Servers'),
('fda24c28-7f28-47bf-817b-9a9cea7c0cbe','Service Plans.Windows Servers.Server Roles.Windows Messaging Servers.Exchange 2010 Servers');

/*Table structure for table `plugin_messaging_guidmap` */

DROP TABLE IF EXISTS `plugin_messaging_guidmap`;

CREATE TABLE `plugin_messaging_guidmap` (
  `OldGUID` char(36) NOT NULL,
  `NewGUID` char(36) NOT NULL,
  PRIMARY KEY (`OldGUID`,`NewGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `plugin_messaging_guidmap` */

insert  into `plugin_messaging_guidmap`(`OldGUID`,`NewGUID`) values 
('00fd60fc-716b-4755-90ae-809867f6e457','8b8befe6-debf-11e4-9762-0050560a08e8'),
('013c41b9-0785-4003-ae7d-115a0d61d32d','8b8becec-debf-11e4-9762-0050560a08e8'),
('045a00d6-df08-470d-81a0-d3991e6d4a20','e366e07b-debe-11e4-9762-0050560a08e8'),
('04c579b7-5b71-4080-858e-2c255a90038c','746f721f-debe-11e4-9762-0050560a08e8'),
('06e9ec1f-2c28-4f7b-93c2-c8e09d020710','adb1dff7-debe-11e4-9762-0050560a08e8'),
('07754258-a6fb-48ad-a02e-2ed88719920b','adb1e3d1-debe-11e4-9762-0050560a08e8'),
('077e4c34-08de-4f4f-b309-4be2798d044a','adb1e54c-debe-11e4-9762-0050560a08e8'),
('0800de8a-0711-4cb8-8fcc-298d8f29a4ba','e366d6cb-debe-11e4-9762-0050560a08e8'),
('08b70188-9627-40f3-aaed-6ed88d7c5be5','682246ab-debd-11e4-9762-0050560a08e8'),
('094f1252-a9cd-4e08-9a36-4ea8e9d92c1c','e366d7cc-debe-11e4-9762-0050560a08e8'),
('099496fa-df14-4af3-b870-1fe36e633e55','8b8bec2c-debf-11e4-9762-0050560a08e8'),
('0a5f447b-6983-4879-8411-e5fc890429c6','3e2c929f-debe-11e4-9762-0050560a08e8'),
('0ab733b0-7c1f-40dc-909f-8d07f91cf28d','e366e260-debe-11e4-9762-0050560a08e8'),
('0ac9bf57-2235-4c3c-84b0-615f1b027cf3','8b8c0166-debf-11e4-9762-0050560a08e8'),
('0b522235-4cc9-442d-baf9-79e06ff15d33','e366e0f2-debe-11e4-9762-0050560a08e8'),
('0dd2e341-e4ab-4bde-b586-80dc2aa58bb9','e366fd87-debe-11e4-9762-0050560a08e8'),
('1001e81b-8331-4e6a-89cc-c24d7a146d80','adb1df05-debe-11e4-9762-0050560a08e8'),
('14326577-026a-428b-9803-ec2ad9f83ffe','8b8bfec3-debf-11e4-9762-0050560a08e8'),
('1595da09-ac7d-4d80-aa42-fdf40b63e264','8b8bf0a6-debf-11e4-9762-0050560a08e8'),
('176f19db-c6ac-4360-8417-88fc8bf30f68','8b8be63a-debf-11e4-9762-0050560a08e8'),
('196d49bd-94f7-4969-b338-3d57f79f240b','e366d998-debe-11e4-9762-0050560a08e8'),
('1ca0f159-1f75-40aa-a928-5c4aef6c5ec1','e366fbea-debe-11e4-9762-0050560a08e8'),
('1e171f0f-6216-489e-a835-d7bcefc8836a','8b8bec6d-debf-11e4-9762-0050560a08e8'),
('218c5775-4d3f-4713-9e1e-a62ca4c982fd','8b8c0262-debf-11e4-9762-0050560a08e8'),
('2448605c-8bb1-4738-9745-687a271fdfc6','746f7341-debe-11e4-9762-0050560a08e8'),
('27f329fe-7228-4094-aa61-7f702fb93220','e366df6a-debe-11e4-9762-0050560a08e8'),
('2930bc89-90cb-4afa-8477-06f8c4c11512','8b8bef1f-debf-11e4-9762-0050560a08e8'),
('2942dbfb-cf44-4509-a777-c79a2d525dd4','e366e831-debe-11e4-9762-0050560a08e8'),
('2a01c924-7089-4679-87c2-766d27f80485','8b8bf128-debf-11e4-9762-0050560a08e8'),
('2b5d0401-94ce-4243-87d3-b4f128f5614f','e366d641-debe-11e4-9762-0050560a08e8'),
('2c737642-d075-47ee-b27b-de994ba245ba','adb1e45f-debe-11e4-9762-0050560a08e8'),
('2e36bf7b-76f0-46c2-8156-4ae5153496da','746f74ae-debe-11e4-9762-0050560a08e8'),
('2f04016f-de78-458a-8350-dab109014815','8b8c00de-debf-11e4-9762-0050560a08e8'),
('2f0b2d76-53a3-4927-b2b8-2382ff1e43f1','8b8bfe7e-debf-11e4-9762-0050560a08e8'),
('31370b6c-7b02-4db3-aeed-ad7e5e45efc0','df8e38f9-debd-11e4-9762-0050560a08e8'),
('319aa388-4f46-490b-8898-61e8cef402c3','e366da10-debe-11e4-9762-0050560a08e8'),
('3629f40e-54b1-4718-8e3f-85fc49c394cb','8b8be598-debf-11e4-9762-0050560a08e8'),
('3759724d-5e9c-4fe7-907d-63f734aa8b3c','e366dde1-debe-11e4-9762-0050560a08e8'),
('37d6008b-2e15-45ee-a5c0-f8200a4094da','adb1e29f-debe-11e4-9762-0050560a08e8'),
('3da00585-e151-4283-bbd2-1091f22d3dac','e366d541-debe-11e4-9762-0050560a08e8'),
('3e602c64-f014-4453-8775-137d38d58ddf','8b8be895-debf-11e4-9762-0050560a08e8'),
('40eda971-d58c-422d-8334-2451673b8414','8b8bef5f-debf-11e4-9762-0050560a08e8'),
('43dbd965-0496-4814-92dd-1f604afb4842','adb1e5e8-debe-11e4-9762-0050560a08e8'),
('4415e703-174c-4343-84d6-4e8d5efefdd1','adb1e684-debe-11e4-9762-0050560a08e8'),
('45539c7c-cdab-4db0-986d-a1abee982128','adb1de8b-debe-11e4-9762-0050560a08e8'),
('4808a99b-403d-452c-b2ee-5cb9877b4abc','c609000e-debd-11e4-9762-0050560a08e8'),
('487b8915-ad2b-40f0-932b-bf14767fc34f','e366e98b-debe-11e4-9762-0050560a08e8'),
('4a3beeee-f3f0-4ce8-9b14-35011a80512b','8b8bed6a-debf-11e4-9762-0050560a08e8'),
('4b55442d-842d-4f6a-8a8b-513888decc04','8b8bedab-debf-11e4-9762-0050560a08e8'),
('4ceaed78-e628-41ed-8cc4-cc7e74251d81','8b8bf1ab-debf-11e4-9762-0050560a08e8'),
('514df943-24d5-49fc-a180-4a0ea7ca5ab1','e366fccf-debe-11e4-9762-0050560a08e8'),
('51c5e77c-e55c-4958-a668-db26a4e3448b','e366e175-debe-11e4-9762-0050560a08e8'),
('51cdc531-4aac-49c4-ac63-b21a0982a390','8b8bf16d-debf-11e4-9762-0050560a08e8'),
('54b5a318-03c6-4a4c-845b-0109537ea041','8b8be7fe-debf-11e4-9762-0050560a08e8'),
('598c6a5c-4953-40fc-8bec-d72a6b19af55','8b8befa5-debf-11e4-9762-0050560a08e8'),
('59aea649-8a90-4a76-9c37-ae68e17a6ce6','adb1e226-debe-11e4-9762-0050560a08e8'),
('5c6ad31e-10e8-41a8-baaa-2141c4c75095','8b8bea5f-debf-11e4-9762-0050560a08e8'),
('5caa9488-231f-4fe4-a001-3ed6ffe8d697','8b8bff90-debf-11e4-9762-0050560a08e8'),
('5e299dbd-19ce-45b6-a05c-1b8adef0caa5','a614797b-debd-11e4-9762-0050560a08e8'),
('5e3e2fd6-8ec4-4b0d-88b2-6d04b05ed917','8b8be707-debf-11e4-9762-0050560a08e8'),
('60b6a425-6be5-4022-bc74-3378fa0d6f8c','8b8be5f2-debf-11e4-9762-0050560a08e8'),
('6150135a-27fe-453f-8b91-a433a0d75090','e366e4f8-debe-11e4-9762-0050560a08e8'),
('6210b2e9-1975-437d-8c21-fb00b87973b8','746f72ac-debe-11e4-9762-0050560a08e8'),
('69f3f186-4364-4016-bc49-0e36652ecd92','8b8be4f3-debf-11e4-9762-0050560a08e8'),
('6b413a8b-42a9-43be-9e78-c9ce84d9df16','8b8be681-debf-11e4-9762-0050560a08e8'),
('6b701169-4883-4168-98e9-161c767a5cb3','e366de5f-debe-11e4-9762-0050560a08e8'),
('6c1e6fb9-b14e-4cd8-9d0e-0a45a2e2fdc4','e366d750-debe-11e4-9762-0050560a08e8'),
('6c438c49-a635-4fc7-8e49-fddcfa6dc296','8b8beba8-debf-11e4-9762-0050560a08e8'),
('700f6161-f41f-41ab-88c3-68a25134e95a','8b8bed2a-debf-11e4-9762-0050560a08e8'),
('706bc5bb-ea09-44f4-a5d7-e05379f52001','8b8beb69-debf-11e4-9762-0050560a08e8'),
('71bab4cf-a766-4063-bc0a-2631548118dc','8b8c02e6-debf-11e4-9762-0050560a08e8'),
('74ba1345-d0f7-46d3-9394-e7cb56f32b82','e366dce3-debe-11e4-9762-0050560a08e8'),
('764eb6b4-1210-442e-a925-d6137f68d5c5','8b8bee2f-debf-11e4-9762-0050560a08e8'),
('7aae0e2f-6585-4b92-92fe-065500b41c25','e366e917-debe-11e4-9762-0050560a08e8'),
('7acf8cd1-4c18-4634-b648-85a4a406934d','8b8beae8-debf-11e4-9762-0050560a08e8'),
('7e378fc3-70d7-45d8-9f03-93236416572b','e366dff8-debe-11e4-9762-0050560a08e8'),
('7f297ff6-f2a0-4ac9-acde-87886aaab786','746f73ce-debe-11e4-9762-0050560a08e8'),
('81cfa129-f654-498e-9883-0da168f39c87','8b8be91a-debf-11e4-9762-0050560a08e8'),
('832c0aad-69d1-4703-8f40-cd45a4bc8c72','e366e2d2-debe-11e4-9762-0050560a08e8'),
('848332f1-dcc4-4b41-b49e-af7ac214841d','e366e73e-debe-11e4-9762-0050560a08e8'),
('84ee65e6-e2b4-41af-9063-caa299b727e6','8b8bff09-debf-11e4-9762-0050560a08e8'),
('87893384-d0d3-401e-ba02-4f17f717d236','754f7880-debc-11e4-9762-0050560a08e8'),
('89542d8a-d9bf-466c-9ded-c3402900a107','8b8be7b8-debf-11e4-9762-0050560a08e8'),
('8cd9cf03-b8de-4623-b8cd-2112408c5caa','8b8beaa4-debf-11e4-9762-0050560a08e8'),
('8f050dd1-ef66-4172-80a5-260c97d783d3','8b8beedf-debf-11e4-9762-0050560a08e8'),
('8ffe0ee7-3235-414f-be31-e92f5affe426','e366e561-debe-11e4-9762-0050560a08e8'),
('94d16ddf-4a98-4e4a-ad3f-6b9c1dc90f9d','8b9b9589-debd-11e4-9762-0050560a08e8'),
('952dd5e7-acaf-48c5-90a0-8e52a803c352','e366e6c8-debe-11e4-9762-0050560a08e8'),
('95e7dbac-fdb1-4015-ace8-7d99a12049cf','8b8becab-debf-11e4-9762-0050560a08e8'),
('9913f17f-7357-4e6d-8ad6-36b67b7e4cad','adb1df88-debe-11e4-9762-0050560a08e8'),
('998c3976-6c1e-4e22-b819-bcc4562c6b93','e366d92e-debe-11e4-9762-0050560a08e8'),
('9a9a79a5-fd03-4aec-87ec-2049d416f2c7','8b8be552-debf-11e4-9762-0050560a08e8'),
('9ba4fbb7-70e1-442e-8c8b-5529992982c2','8b8bebec-debf-11e4-9762-0050560a08e8'),
('9c994cab-769a-407d-b9c5-b8e3cd65a319','746f72f8-debe-11e4-9762-0050560a08e8'),
('9e25795f-7023-4e12-b0a8-abaad97d84c5','746f746a-debe-11e4-9762-0050560a08e8'),
('9f269651-14af-4182-8d25-dc7eab9e3335','e366d843-debe-11e4-9762-0050560a08e8'),
('a00cf18c-d152-43fb-97f6-3dee15241937','e366d5c3-debe-11e4-9762-0050560a08e8'),
('a26d8d2f-a145-4663-8ffa-ca1536fa4b0b','8b8bee98-debf-11e4-9762-0050560a08e8'),
('a5d977f7-95d4-4a1c-bc04-184a79e6fcc0','adb1e4db-debe-11e4-9762-0050560a08e8'),
('b0a9d195-4e2e-4f23-ba8a-7753ae3a6c08','adb1ddd7-debe-11e4-9762-0050560a08e8'),
('b297a7b9-899c-45a8-bd4c-f9b2f3e9b546','8b8be763-debf-11e4-9762-0050560a08e8'),
('b33e5e83-1158-4752-b8b6-28ce38491a6c','adb1e356-debe-11e4-9762-0050560a08e8'),
('b34c6364-83c7-413a-a8da-4173be4113c7','8b8c0037-debf-11e4-9762-0050560a08e8'),
('b3a7d859-81b9-49a9-bb6d-9201a5330fdb','adb1dd0b-debe-11e4-9762-0050560a08e8'),
('b4164eb8-f567-4799-923b-08f163cde42b','e366dbf7-debe-11e4-9762-0050560a08e8'),
('bce83073-232e-4382-bd67-8a5f0f786b74','8b8bedea-debf-11e4-9762-0050560a08e8'),
('bf376390-c8c3-439f-be60-59e92fc09beb','e366da95-debe-11e4-9762-0050560a08e8'),
('c27bc492-0f93-4899-a597-7c866b836094','8b8bf0e5-debf-11e4-9762-0050560a08e8'),
('c7f7596c-9ff2-4cba-a0c0-2ce598d25c07','e366d483-debe-11e4-9762-0050560a08e8'),
('c8162012-ccd1-473a-abd0-b59a6b300e88','e366d8bb-debe-11e4-9762-0050560a08e8'),
('c9cd95f6-e076-4d8e-85a5-e7f8a3723f12','e366dc66-debe-11e4-9762-0050560a08e8'),
('ca911e4e-3cee-410a-910d-cc37c22609ef','e366e63c-debe-11e4-9762-0050560a08e8'),
('cb121463-231c-4fbc-9255-894fd30c3bd6','e366db11-debe-11e4-9762-0050560a08e8'),
('cb978c49-773d-42ce-9b2e-7cb53160b924','e366e7bd-debe-11e4-9762-0050560a08e8'),
('cd1a6340-25c0-4933-9b22-9d4bacc77f6b','746f7513-debe-11e4-9762-0050560a08e8'),
('cdaaf0f1-dae0-415b-bb7a-04798d7956f2','8b8be8d8-debf-11e4-9762-0050560a08e8'),
('ce366674-acff-46c4-9809-249903ea0e41','8b8be3c9-debf-11e4-9762-0050560a08e8'),
('ceaeb0c5-57f0-45ca-a381-d37ec1843793','e366dd6a-debe-11e4-9762-0050560a08e8'),
('d1456a8a-89fd-4896-bee2-9c65d98c047c','8b8be336-debf-11e4-9762-0050560a08e8'),
('d228f414-b8e9-420e-911c-b20ff1d2b9e6','e366db85-debe-11e4-9762-0050560a08e8'),
('d4c7c68b-c7ea-44c4-b0ef-b2cc58f77696','8b8bf025-debf-11e4-9762-0050560a08e8'),
('d721d7b8-83a7-4f5f-8950-690fb78ba4db','8b8bea14-debf-11e4-9762-0050560a08e8'),
('d9c1dd68-0729-4565-a088-56b08f72d35e','8b8be852-debf-11e4-9762-0050560a08e8'),
('d9d0b673-1244-4c94-90c3-2a9909547980','746f7422-debe-11e4-9762-0050560a08e8'),
('d9f684d9-b5fb-4ff0-801b-ac2607654b0f','8b8be9a9-debf-11e4-9762-0050560a08e8'),
('da3f1609-1036-4a67-a5e7-2e4edf63d022','8b8be462-debf-11e4-9762-0050560a08e8'),
('dba60be6-55e6-457e-a225-af5d1ec89747','8b8be966-debf-11e4-9762-0050560a08e8'),
('e1a84314-369f-4d8d-bd22-a65d887cfa85','8b8bfe31-debf-11e4-9762-0050560a08e8'),
('e22d8917-1d05-44eb-b805-f761ed66b043','e366e487-debe-11e4-9762-0050560a08e8'),
('e40496f3-96bf-4466-8f77-dffe0dbeb2bf','e366e345-debe-11e4-9762-0050560a08e8'),
('e63493c9-aa54-4d0e-b011-cb2cc1d06111','f4ea144f-debd-11e4-9762-0050560a08e8'),
('e90cd0c9-a3a3-4e2d-84d5-44485eab1b44','8b8bf066-debf-11e4-9762-0050560a08e8'),
('eb554660-8fef-4fd4-ab8c-e48b744af1a6','adb1e117-debe-11e4-9762-0050560a08e8'),
('ebdd4a98-0872-45c6-a5c8-0d6d323187c9','e366dee0-debe-11e4-9762-0050560a08e8'),
('ec1b2129-2c97-4455-8ecf-de3a668b9f82','8b8be419-debf-11e4-9762-0050560a08e8'),
('eed3e79c-866d-4faf-af1c-579172723f14','e366e5ce-debe-11e4-9762-0050560a08e8'),
('ef8936ed-aaca-4979-b4db-09bc5ac98707','8b8beb28-debf-11e4-9762-0050560a08e8'),
('efb6edfe-eacb-461a-95e8-3f72beb42cdf','adb1e192-debe-11e4-9762-0050560a08e8'),
('f2f49dfc-3a37-493d-ba0b-80e480a0ada9','8b8bff4b-debf-11e4-9762-0050560a08e8'),
('f3173bf8-d75c-4355-871b-4dea9cc74caa','e366e1ec-debe-11e4-9762-0050560a08e8'),
('f394a08f-7762-40aa-8d21-40a5e22de97c','adb1e06f-debe-11e4-9762-0050560a08e8'),
('f76e217a-c097-49fd-8bff-afc0891296d3','e366e8a3-debe-11e4-9762-0050560a08e8'),
('fc14d3af-94c4-46ee-b9e2-3f8e92d9b592','e366e409-debe-11e4-9762-0050560a08e8'),
('fda24c28-7f28-47bf-817b-9a9cea7c0cbe','8b8be6c4-debf-11e4-9762-0050560a08e8');

/*Table structure for table `plugin_messaging_servertypes` */

DROP TABLE IF EXISTS `plugin_messaging_servertypes`;

CREATE TABLE `plugin_messaging_servertypes` (
  `ID` int(11) NOT NULL,
  `ServerType` varchar(255) NOT NULL,
  `Enabled` tinyint(1) NOT NULL DEFAULT '0',
  `ReportCategory` int(11) DEFAULT '7',
  `TicketCategory` int(11) DEFAULT '123',
  `AlertLevel` int(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `plugin_messaging_servertypes` */

insert  into `plugin_messaging_servertypes`(`ID`,`ServerType`,`Enabled`,`ReportCategory`,`TicketCategory`,`AlertLevel`) values 
(0,'Exchange',1,7,123,-1),
(1,'Blackberry',1,7,123,-1),
(2,'Dovecot',1,7,123,-1),
(3,'SMTPExim4',1,7,123,-1),
(4,'SMTPPostfix',1,7,123,-1),
(5,'OSXAddressbook',1,7,123,-1),
(6,'OSXCalendar',1,7,123,-1),
(7,'OSXChat',1,7,123,-1),
(8,'OSXMail',1,7,123,-1),
(9,'OSXMailNotification',1,7,123,-1);

/*Table structure for table `plugin_messaging_settings` */

DROP TABLE IF EXISTS `plugin_messaging_settings`;

CREATE TABLE `plugin_messaging_settings` (
  `SettingName` varchar(255) NOT NULL,
  `Value` int(11) NOT NULL,
  PRIMARY KEY (`SettingName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `plugin_messaging_settings` */

insert  into `plugin_messaging_settings`(`SettingName`,`Value`) values 
('AlertLevel',-1),
('DbVersion',6),
('FirstSave',0),
('IsSaving',0),
('IsSyncing',0),
('ReportCategory',7),
('TicketCategory',123),
('UseEdfs',1);

/*Table structure for table `plugin_portmanagement_appliedmonitors` */

DROP TABLE IF EXISTS `plugin_portmanagement_appliedmonitors`;

CREATE TABLE `plugin_portmanagement_appliedmonitors` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(200) NOT NULL,
  `CheckAction` int(11) NOT NULL,
  `AlertAction` int(11) NOT NULL,
  `AlertMessage` text NOT NULL,
  `ContactID` int(11) NOT NULL,
  `Interval` int(11) NOT NULL,
  `Where` varchar(255) NOT NULL,
  `What` varchar(255) NOT NULL,
  `DataOut` text NOT NULL,
  `Comparor` int(11) NOT NULL,
  `DataIn` varchar(200) NOT NULL,
  `IDField` varchar(500) NOT NULL,
  `AlertStyle` int(11) NOT NULL DEFAULT '0',
  `Changed` int(11) NOT NULL,
  `DataCollector` varchar(100) NOT NULL,
  `Category` int(11) NOT NULL,
  `TicketCategory` int(11) NOT NULL,
  `ScriptTarget` int(11) DEFAULT '1',
  `GUID` char(36) NOT NULL,
  `ServerType` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ContactID` (`ContactID`),
  KEY `Name` (`Name`),
  KEY `ServerType` (`ServerType`)
) ENGINE=InnoDB AUTO_INCREMENT=690 DEFAULT CHARSET=utf8;

/*Data for the table `plugin_portmanagement_appliedmonitors` */

insert  into `plugin_portmanagement_appliedmonitors`(`ID`,`Name`,`CheckAction`,`AlertAction`,`AlertMessage`,`ContactID`,`Interval`,`Where`,`What`,`DataOut`,`Comparor`,`DataIn`,`IDField`,`AlertStyle`,`Changed`,`DataCollector`,`Category`,`TicketCategory`,`ScriptTarget`,`GUID`,`ServerType`) values 
(230,'TCP - DNS Port 53',2,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','53','\\0\\0\\x10\\0\\0\\0\\0\\0\\0\\0\\0\\0',6,'','',1,0,'Collect,Collect',8,115,0,'ccfba91c-d25d-11e4-9762-0050560a08e8',0),
(231,'UDP - DNS Port 53',3,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','53','\\0\\0\\x10\\0\\0\\0\\0\\0\\0\\0\\0\\0',6,'','',1,0,'Collect,Collect',8,115,0,'ccfba98f-d25d-11e4-9762-0050560a08e8',0),
(232,'TCP - FTP Port 21',2,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','21','quit\\n',5,'220','',1,0,'Collect,Collect',8,115,0,'ccfba9e7-d25d-11e4-9762-0050560a08e8',0),
(233,'TCP - HTTP Port 80',2,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','80','GET / HTTP/1.1\\nHost: 127.0.0.1\\n\\n',1,'HTTP','',1,0,'Collect,Collect',8,115,0,'ccfbaa36-d25d-11e4-9762-0050560a08e8',3),
(234,'TCP - HTTPS Port 443',2,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','443','',6,'','',1,0,'Collect,Collect',8,115,0,'ccfbaa89-d25d-11e4-9762-0050560a08e8',3),
(235,'TCP - ICA Port 1494',2,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','1494','',6,'','',1,0,'Collect,Collect',8,115,0,'ccfbaad5-d25d-11e4-9762-0050560a08e8',0),
(236,'TCP - IMAP Port 143',2,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','143','',1,'* OK','',1,0,'Collect,Collect',8,115,0,'ccfbab23-d25d-11e4-9762-0050560a08e8',2),
(237,'TCP - LDAP Port 389',2,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','389','',6,'','',1,0,'Collect,Collect',8,115,0,'ccfbab72-d25d-11e4-9762-0050560a08e8',0),
(238,'TCP - MySQL Port 3306',2,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','3306','',6,'','',1,0,'Collect,Collect',8,115,0,'ccfbabd6-d25d-11e4-9762-0050560a08e8',1),
(239,'TCP - POP Port 110',2,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','110','\\n',1,'+OK','',1,0,'Collect,Collect',8,115,0,'ccfbac7b-d25d-11e4-9762-0050560a08e8',2),
(240,'TCP - RDP Port 3389',2,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','3389','',6,'','',1,0,'Collect,Collect',8,115,0,'ccfbacca-d25d-11e4-9762-0050560a08e8',0),
(241,'TCP - SMTP Port 25',2,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.||tzcompdisabled=1|priority=3',0,60,'127.0.0.1','25','\\n',1,'220','',1,0,'Collect,Collect',8,115,0,'ccfbad19-d25d-11e4-9762-0050560a08e8',2),
(242,'TCP - SMTPAUTH Port 587',2,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','587','',5,'220','',1,0,'Collect,Collect',8,115,0,'ccfbad67-d25d-11e4-9762-0050560a08e8',2),
(243,'TCP - SSH Port 22',2,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','22','',6,'','',1,0,'Collect,Collect',8,115,0,'ccfbadb7-d25d-11e4-9762-0050560a08e8',0),
(653,'EXE - DNS Lookup Test',6,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,300,'127.0.0.1','7','nstest.bat',9,'Can\'t','',1,0,'',16,143,0,'ccfbd6f5-d25d-11e4-9762-0050560a08e8',0),
(670,'TCP - MSSQL Port 1433',2,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','1433','',6,'','',1,0,'Collect,Collect',8,115,0,'ccfbd96a-d25d-11e4-9762-0050560a08e8',1),
(671,'TCP - Oracle Port 1521',2,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','1521','',6,'','',1,0,'Collect,Collect',8,115,0,'ccfbd9bb-d25d-11e4-9762-0050560a08e8',1),
(672,'UDP - DHCP Port 67',3,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','67','\\0\\0\\x10\\0\\0\\0\\0\\0\\0\\0\\0\\0',6,'','',1,0,'Collect,Collect',8,115,0,'ccfbda25-d25d-11e4-9762-0050560a08e8',0),
(687,'TCP - HTTP External Connections',6,1,'The number of HTTP connections on %clientname%\\%locationname% is %result%.|tzcompdisabled=1|priority=3',0,300,'127.0.0.1','0','netstat -an | grep ESTABLISHED | grep \'^tcp\' | awk \'{print $4}\' | grep -v \'127.0.0.1\' | grep \'\\.80$\' | wc -l',4,'1000','',1,0,'Collect,Collect',8,115,0,'ccfbdc52-d25d-11e4-9762-0050560a08e8',3),
(688,'TCP - SMTP External Connections',6,1,'The number of HTTP connections on %clientname%\\%locationname% is %result%.|tzcompdisabled=1|priority=3',0,300,'127.0.0.1','7','netstat -an | grep ESTABLISHED | grep \'^tcp\' | awk \'{print $4}\' | grep -v \'127.0.0.1\' | grep \'\\.25$\' | wc -l',4,'1000','',1,0,'Collect,Collect',8,115,0,'ccfbdca1-d25d-11e4-9762-0050560a08e8',2),
(689,'TCP - HTTP Port 80 vCenter Server',2,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.|tzcompdisabled=1|priority=3',0,60,'127.0.0.1','80','GET / HTTP/1.1\\r\\nHost: 127.0.0.1\\r\\n\\r\\n',17,'HTTP','',5,0,'Collect,Collect',0,175,0,'6fd079f8-2d1c-11e8-8c95-08002743a592',3);

/*Table structure for table `plugin_portmanagement_appliesto` */

DROP TABLE IF EXISTS `plugin_portmanagement_appliesto`;

CREATE TABLE `plugin_portmanagement_appliesto` (
  `MonitorGUID` char(36) NOT NULL,
  `Versions` varchar(100) NOT NULL DEFAULT '',
  `Roles` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`MonitorGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `plugin_portmanagement_appliesto` */

insert  into `plugin_portmanagement_appliesto`(`MonitorGUID`,`Versions`,`Roles`) values 
('6fd079f8-2d1c-11e8-8c95-08002743a592','HTTP Port 80tcp vCenter Server',''),
('ccfba91c-d25d-11e4-9762-0050560a08e8','DNS Port 53tcp',''),
('ccfba98f-d25d-11e4-9762-0050560a08e8','DNS Port 53udp',''),
('ccfba9e7-d25d-11e4-9762-0050560a08e8','FTP Port 21tcp',''),
('ccfbaa36-d25d-11e4-9762-0050560a08e8','HTTP Port 80tcp',''),
('ccfbaa89-d25d-11e4-9762-0050560a08e8','HTTPS Port 443tcp',''),
('ccfbaad5-d25d-11e4-9762-0050560a08e8','ICA Port 1494tcp',''),
('ccfbab23-d25d-11e4-9762-0050560a08e8','IMAP Port 143tcp',''),
('ccfbab72-d25d-11e4-9762-0050560a08e8','LDAP Port 389tcp',''),
('ccfbabd6-d25d-11e4-9762-0050560a08e8','MySQL Port 3306tcp',''),
('ccfbac7b-d25d-11e4-9762-0050560a08e8','POP3 Port 110tcp',''),
('ccfbacca-d25d-11e4-9762-0050560a08e8','RDP Port 3389tcp',''),
('ccfbad19-d25d-11e4-9762-0050560a08e8','SMTP Port 25tcp',''),
('ccfbad67-d25d-11e4-9762-0050560a08e8','SMTPAUTH Port 587tcp',''),
('ccfbadb7-d25d-11e4-9762-0050560a08e8','SSH Port 22tcp',''),
('ccfbd6f5-d25d-11e4-9762-0050560a08e8','DNS Port 53udp','Windows Servers'),
('ccfbd96a-d25d-11e4-9762-0050560a08e8','MSSQL Port 1433tcp',''),
('ccfbd9bb-d25d-11e4-9762-0050560a08e8','Oracle Port 1521tcp',''),
('ccfbda25-d25d-11e4-9762-0050560a08e8','DHCP Port 67udp',''),
('ccfbdc52-d25d-11e4-9762-0050560a08e8','HTTP Port 80tcp','OS X Servers'),
('ccfbdca1-d25d-11e4-9762-0050560a08e8','SMTP Port 25tcp','OS X Servers');

/*Table structure for table `plugin_portmanagement_deprecatedgroupagents` */

DROP TABLE IF EXISTS `plugin_portmanagement_deprecatedgroupagents`;

CREATE TABLE `plugin_portmanagement_deprecatedgroupagents` (
  `AgentID` int(11) NOT NULL AUTO_INCREMENT,
  `GroupID` int(11) NOT NULL,
  `SearchID` int(11) NOT NULL,
  `Name` varchar(200) NOT NULL,
  `CheckAction` int(11) NOT NULL,
  `AlertAction` int(11) NOT NULL,
  `AlertMessage` text NOT NULL,
  `ContactID` int(11) NOT NULL,
  `interval` int(11) NOT NULL,
  `Where` varchar(255) NOT NULL,
  `What` varchar(255) NOT NULL,
  `DataOut` text NOT NULL,
  `Comparor` int(11) NOT NULL,
  `DataIn` varchar(8000) NOT NULL,
  `IDField` varchar(500) NOT NULL,
  `AlertStyle` int(11) NOT NULL DEFAULT '0',
  `ScriptID` int(11) NOT NULL,
  `DataCollector` varchar(100) NOT NULL,
  `Category` int(11) NOT NULL,
  `TicketCategory` int(11) NOT NULL,
  `ScriptTarget` int(11) DEFAULT '1',
  `GUID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`AgentID`),
  KEY `ContactID` (`ContactID`),
  KEY `Name` (`Name`),
  KEY `GroupID` (`GroupID`),
  KEY `SearchID` (`SearchID`)
) ENGINE=InnoDB AUTO_INCREMENT=682 DEFAULT CHARSET=utf8;

/*Data for the table `plugin_portmanagement_deprecatedgroupagents` */

insert  into `plugin_portmanagement_deprecatedgroupagents`(`AgentID`,`GroupID`,`SearchID`,`Name`,`CheckAction`,`AlertAction`,`AlertMessage`,`ContactID`,`interval`,`Where`,`What`,`DataOut`,`Comparor`,`DataIn`,`IDField`,`AlertStyle`,`ScriptID`,`DataCollector`,`Category`,`TicketCategory`,`ScriptTarget`,`GUID`) values 
(230,979,494,'TCP - DNS Port 53',2,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.',0,60,'127.0.0.1','53','',6,'','',1,0,'',8,115,1,'6a636eb6-916e-4e1e-86ed-662c12bf4683'),
(231,980,495,'UDP - DNS Port 53',3,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.',0,60,'127.0.0.1','53','\\0\\0\\x10\\0\\0\\0\\0\\0\\0\\0\\0\\0',6,'','',1,0,'',8,115,1,'9460e3d4-0994-47f7-9729-6ca0ea10c51e'),
(232,976,496,'TCP - FTP Port 21',2,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.',0,60,'127.0.0.1','21','quit\\n',5,'220','',1,0,'',8,115,1,'350a228c-f65a-4a4b-b03a-cc94512a478d'),
(233,981,497,'TCP - HTTP Port 80',2,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.',0,60,'127.0.0.1','80','GET / HTTP/1.1\\nHost: 127.0.0.1\\n\\n',1,'HTTP','',1,0,'',8,115,1,'0ae29eaa-18a0-4a11-9152-7f1f98c5d890'),
(234,984,498,'TCP - HTTPS Port 443',2,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.',0,60,'127.0.0.1','443','',6,'','',1,0,'',8,115,1,'41d1cc3a-3dd6-41ea-be38-baafbcee8afb'),
(235,988,499,'TCP - ICA Port 1494',2,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.',0,60,'127.0.0.1','1494','',6,'','',1,0,'',8,115,1,'f741aae5-3413-4576-af58-4f42312e54ed'),
(236,983,500,'TCP - IMAP Port 143',2,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.',0,60,'127.0.0.1','143','',1,'* OK','',1,0,'',8,115,1,'af9f343c-5829-4b4c-8484-628486de9d21'),
(237,989,501,'TCP - LDAP Port 389',2,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.',0,60,'127.0.0.1','389','',6,'','',1,0,'',8,115,1,'73097bc5-6ac3-427b-954e-652b368070ef'),
(238,986,502,'TCP - MySQL Port 3306',2,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.',0,60,'127.0.0.1','3306','',6,'','',1,0,'',8,115,1,'ffe6ef63-8029-4fb1-a41a-876ac86f469b'),
(239,982,503,'TCP - POP Port 110',2,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.',0,60,'127.0.0.1','110','\\n',1,'+OK','',1,0,'',8,115,1,'ea723f56-0170-4d89-96e2-38ed4b5474c6'),
(240,987,504,'TCP - RDP Port 3389',2,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.',0,60,'127.0.0.1','3389','',6,'','',1,0,'',8,115,1,'278aafde-05d2-41ba-866f-5818157f911d'),
(241,978,505,'TCP - SMTP Port 25',2,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.',0,60,'127.0.0.1','25','quit\\n',1,'220','',1,0,'',8,115,1,'f72d237e-92bf-4f3e-bfa5-5cb2c0968f96'),
(242,985,506,'TCP - SMTPAUTH Port 587',2,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.',0,60,'127.0.0.1','587','',5,'220','',1,0,'',8,115,1,'28be5064-e2fb-480e-a5bc-3f0a175b2d7c'),
(243,977,507,'TCP - SSH Port 22',2,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.',0,60,'127.0.0.1','22','',6,'','',1,0,'',8,115,1,'bd4ef026-142a-427d-b359-e3907fec569b'),
(653,980,72,'EXE - DNS Lookup Test',6,3,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.',0,300,'127.0.0.1','7','nstest.bat',9,'Can\'t','',1,0,'',16,143,1,'81173366-bd35-48da-a3f1-c7356599aaac'),
(670,995,559,'TCP - MSSQL Port 1433',2,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.',0,60,'127.0.0.1','1433','',6,'','',1,0,'',8,115,1,'fb7c9e69-d1f3-471f-8161-ca4ae6d8daf2'),
(671,996,560,'TCP - Oracle Port 1521',2,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.',0,60,'127.0.0.1','1521','',6,'','',1,0,'',8,115,1,'82077070-cbcd-4fbb-b71d-082ae2bc20ce'),
(672,1023,609,'UDP - DHCP Port 67',3,1,'%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.!!!%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %FIELDNAME% result %RESULT%.',0,60,'127.0.0.1','67','\\0\\0\\x10\\0\\0\\0\\0\\0\\0\\0\\0\\0',6,'','',1,0,'',8,115,1,'c0a2e49f-bd09-454d-a110-14383851cbd9'),
(680,981,664,'TCP - HTTP External Connections',6,1,'The number of HTTP connections on %clientname%\\%locationname% is %result%.|tzcompdisabled=1|priority=3\n',0,300,'127.0.0.1','0','netstat -an | grep ESTABLISHED | grep \'^tcp\' | awk \'{print $4}\' | grep -v \'127.0.0.1\' | grep \'\\.80$\' | wc -l',4,'1000','',1,0,'',8,115,1,'122f0646-c0f1-42cf-96b5-39a9ddbc30eb'),
(681,978,664,'TCP - SMTP External Connections',6,1,'The number of HTTP connections on %clientname%\\%locationname% is %result%.|tzcompdisabled=1|priority=3',0,300,'127.0.0.1','7','netstat -an | grep ESTABLISHED | grep \'^tcp\' | awk \'{print $4}\' | grep -v \'127.0.0.1\' | grep \'\\.25$\' | wc -l',4,'1000','',1,0,'',8,115,1,'6544fc17-fdb7-402d-86d3-0a87a7f9b85b');

/*Table structure for table `plugin_portmanagement_deprecatedmonitors` */

DROP TABLE IF EXISTS `plugin_portmanagement_deprecatedmonitors`;

CREATE TABLE `plugin_portmanagement_deprecatedmonitors` (
  `GUID` char(36) NOT NULL,
  `MonitorName` varchar(255) NOT NULL,
  PRIMARY KEY (`GUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `plugin_portmanagement_deprecatedmonitors` */

insert  into `plugin_portmanagement_deprecatedmonitors`(`GUID`,`MonitorName`) values 
('0ae29eaa-18a0-4a11-9152-7f1f98c5d890','Port Management.HTTP - 80 TCP'),
('122f0646-c0f1-42cf-96b5-39a9ddbc30eb','Port Management.HTTP - 80 TCP'),
('278aafde-05d2-41ba-866f-5818157f911d','Port Management.RDP - 3389 TCP'),
('28be5064-e2fb-480e-a5bc-3f0a175b2d7c','Port Management.SMTPAUTH - 587 TCP'),
('350a228c-f65a-4a4b-b03a-cc94512a478d','Port Management.FTP - 21 TCP'),
('41d1cc3a-3dd6-41ea-be38-baafbcee8afb','Port Management.HTTPS - 443 TCP'),
('6544fc17-fdb7-402d-86d3-0a87a7f9b85b','Port Management.SMTP - 25 TCP'),
('6a636eb6-916e-4e1e-86ed-662c12bf4683','Port Management.DNS - 53 TCP'),
('73097bc5-6ac3-427b-954e-652b368070ef','Port Management.LDAP - 389 TCP'),
('81173366-bd35-48da-a3f1-c7356599aaac','Port Management.DNS - 53 UDP'),
('82077070-cbcd-4fbb-b71d-082ae2bc20ce','Port Management.Oracle - 1521 TCP'),
('9460e3d4-0994-47f7-9729-6ca0ea10c51e','Port Management.DNS - 53 UDP'),
('af9f343c-5829-4b4c-8484-628486de9d21','Port Management.IMAP - 143 TCP'),
('bd4ef026-142a-427d-b359-e3907fec569b','Port Management.SSH - 22 TCP'),
('c0a2e49f-bd09-454d-a110-14383851cbd9','Port Management.DHCP - 67 UDP'),
('ea723f56-0170-4d89-96e2-38ed4b5474c6','Port Management.POP3 - 110 TCP'),
('f72d237e-92bf-4f3e-bfa5-5cb2c0968f96','Port Management.SMTP - 25 TCP'),
('f741aae5-3413-4576-af58-4f42312e54ed','Port Management.ICA - 1494 TCP'),
('fb7c9e69-d1f3-471f-8161-ca4ae6d8daf2','Port Management.MSSQL - 1433 TCP'),
('ffe6ef63-8029-4fb1-a41a-876ac86f469b','Port Management.MySQL - 3306 TCP');

/*Table structure for table `plugin_portmanagement_guidmap` */

DROP TABLE IF EXISTS `plugin_portmanagement_guidmap`;

CREATE TABLE `plugin_portmanagement_guidmap` (
  `OldGUID` char(36) NOT NULL,
  `NewGUID` char(36) NOT NULL,
  PRIMARY KEY (`OldGUID`,`NewGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `plugin_portmanagement_guidmap` */

insert  into `plugin_portmanagement_guidmap`(`OldGUID`,`NewGUID`) values 
('0ae29eaa-18a0-4a11-9152-7f1f98c5d890','ccfbaa36-d25d-11e4-9762-0050560a08e8'),
('122f0646-c0f1-42cf-96b5-39a9ddbc30eb','ccfbdc52-d25d-11e4-9762-0050560a08e8'),
('278aafde-05d2-41ba-866f-5818157f911d','ccfbacca-d25d-11e4-9762-0050560a08e8'),
('28be5064-e2fb-480e-a5bc-3f0a175b2d7c','ccfbad67-d25d-11e4-9762-0050560a08e8'),
('350a228c-f65a-4a4b-b03a-cc94512a478d','ccfba9e7-d25d-11e4-9762-0050560a08e8'),
('41d1cc3a-3dd6-41ea-be38-baafbcee8afb','ccfbaa89-d25d-11e4-9762-0050560a08e8'),
('6544fc17-fdb7-402d-86d3-0a87a7f9b85b','ccfbdca1-d25d-11e4-9762-0050560a08e8'),
('6a636eb6-916e-4e1e-86ed-662c12bf4683','ccfba91c-d25d-11e4-9762-0050560a08e8'),
('73097bc5-6ac3-427b-954e-652b368070ef','ccfbab72-d25d-11e4-9762-0050560a08e8'),
('81173366-bd35-48da-a3f1-c7356599aaac','ccfbd6f5-d25d-11e4-9762-0050560a08e8'),
('82077070-cbcd-4fbb-b71d-082ae2bc20ce','ccfbd9bb-d25d-11e4-9762-0050560a08e8'),
('9460e3d4-0994-47f7-9729-6ca0ea10c51e','ccfba98f-d25d-11e4-9762-0050560a08e8'),
('af9f343c-5829-4b4c-8484-628486de9d21','ccfbab23-d25d-11e4-9762-0050560a08e8'),
('bd4ef026-142a-427d-b359-e3907fec569b','ccfbadb7-d25d-11e4-9762-0050560a08e8'),
('c0a2e49f-bd09-454d-a110-14383851cbd9','ccfbda25-d25d-11e4-9762-0050560a08e8'),
('ea723f56-0170-4d89-96e2-38ed4b5474c6','ccfbac7b-d25d-11e4-9762-0050560a08e8'),
('f72d237e-92bf-4f3e-bfa5-5cb2c0968f96','ccfbad19-d25d-11e4-9762-0050560a08e8'),
('f741aae5-3413-4576-af58-4f42312e54ed','ccfbaad5-d25d-11e4-9762-0050560a08e8'),
('fb7c9e69-d1f3-471f-8161-ca4ae6d8daf2','ccfbd96a-d25d-11e4-9762-0050560a08e8'),
('ffe6ef63-8029-4fb1-a41a-876ac86f469b','ccfbabd6-d25d-11e4-9762-0050560a08e8');

/*Table structure for table `plugin_portmanagement_servertypes` */

DROP TABLE IF EXISTS `plugin_portmanagement_servertypes`;

CREATE TABLE `plugin_portmanagement_servertypes` (
  `ID` int(11) NOT NULL,
  `ServerType` varchar(255) NOT NULL,
  `Enabled` tinyint(1) NOT NULL DEFAULT '0',
  `ReportCategory` int(11) DEFAULT '7',
  `TicketCategory` int(11) DEFAULT '123',
  `AlertLevel` int(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `plugin_portmanagement_servertypes` */

insert  into `plugin_portmanagement_servertypes`(`ID`,`ServerType`,`Enabled`,`ReportCategory`,`TicketCategory`,`AlertLevel`) values 
(0,'CoreServicesPorts',1,7,123,-1),
(1,'DatabasePorts',1,7,123,-1),
(2,'MessagingPorts',1,7,123,-1),
(3,'WebProxyPorts',1,7,123,-1);

/*Table structure for table `plugin_portmanagement_settings` */

DROP TABLE IF EXISTS `plugin_portmanagement_settings`;

CREATE TABLE `plugin_portmanagement_settings` (
  `SettingName` varchar(255) NOT NULL,
  `Value` int(11) NOT NULL,
  PRIMARY KEY (`SettingName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `plugin_portmanagement_settings` */

insert  into `plugin_portmanagement_settings`(`SettingName`,`Value`) values 
('AlertLevel',-1),
('DbVersion',5),
('FirstSave',0),
('IsSaving',0),
('IsSyncing',0),
('ReportCategory',7),
('TicketCategory',123),
('UseEdfs',1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
