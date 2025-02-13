UPDATE plugin_vm_legacymonitors
SET 
#will update esx-host cpu precentage per core
MonitorDescription = CASE WHEN MonitorName = 'ESX-Host CPU Percentage Per Core' THEN 'ESX - CPU over 80% for %hostname% %result%' ELSE plugin_vm_legacymonitors.monitordescription END, 
      alertmessage = CASE WHEN MonitorName = 'ESX-Host CPU Percentage Per Core' THEN 'The CPU usage for the host server %hostname% with IP address %ipaddress% has surpassed 80% for a CPU core' ELSE plugin_vm_legacymonitors.alertmessage END,
#will update esx-host disk resets
MonitorDescription =CASE WHEN MonitorName = 'ESX-Host Disk Resets' THEN 'ESX - Disk reset detected on %hostname%' ELSE plugin_vm_legacymonitors.monitordescription END, 
     alertmessage = CASE WHEN MonitorName = 'ESX-Host Disk Resets' THEN 'Disk reset detected on %hostname% with IP address %ipaddress%' ELSE plugin_vm_legacymonitors.alertmessage END,
  alerttemplateid = CASE WHEN MonitorName = 'ESX-Host Disk Resets' THEN '3' ELSE plugin_vm_legacymonitors.alerttemplateid END,
#will update esx-host disk percentage free
MonitorDescription =CASE WHEN MonitorName = 'ESX-Host Disk Percentage Free' THEN 'ESX - Disk space < 10% on %hostname% %result%' ELSE plugin_vm_legacymonitors.monitordescription END, 
     alertmessage = CASE WHEN MonitorName = 'ESX-Host Disk Percentage Free' THEN 'The disk space for the host server %hostname% with IP address %ipaddress% is under 10% free' ELSE plugin_vm_legacymonitors.alertmessage END,
  alerttemplateid = CASE WHEN MonitorName = 'ESX-Host Disk Percentage Free' THEN '3' ELSE plugin_vm_legacymonitors.alerttemplateid END,
#will update esx-host memory usage
MonitorDescription =CASE WHEN MonitorName = 'ESX-Host Memory Usage' THEN 'ESX - Memory usage over 90% for %hostname% at %result%' ELSE plugin_vm_legacymonitors.monitordescription END, 
     alertmessage = CASE WHEN MonitorName = 'ESX-Host Memory Usage' THEN 'The memory usage for the host server %hostname% with IP address %ipaddress% is currently over 90%' ELSE plugin_vm_legacymonitors.alertmessage END,
  alerttemplateid = CASE WHEN MonitorName = 'ESX-Host Memory Usage' THEN '3' ELSE plugin_vm_legacymonitors.alerttemplateid END,
#will update esx-host recently restarted
MonitorDescription =CASE WHEN MonitorName = 'ESX-Host Recently Restarted' THEN 'ESX - The host server %hostname% recently restarted' ELSE plugin_vm_legacymonitors.monitordescription END, 
     alertmessage = CASE WHEN MonitorName = 'ESX-Host Recently Restarted' THEN 'The host server %hostname% with IP address %ipaddress% recently restarted' ELSE plugin_vm_legacymonitors.alertmessage END,
  alerttemplateid = CASE WHEN MonitorName = 'ESX-Host Recently Restarted' THEN '3' ELSE plugin_vm_legacymonitors.alerttemplateid END,
#will update esx-host bad sensor count
MonitorDescription =CASE WHEN MonitorName = 'ESX-Host Bad Sensor Count' THEN 'ESX - Bad sensor on %hostname% %result%' ELSE plugin_vm_legacymonitors.monitordescription END, 
     alertmessage = CASE WHEN MonitorName = 'ESX-Host Bad Sensor Count' THEN 'Bad sensor detected on %hostname% with IP address %ipaddress%' ELSE plugin_vm_legacymonitors.alertmessage END,
#will update esx-host power state test
MonitorDescription =CASE WHEN MonitorName = 'ESX-Host Power State Test' THEN 'ESX - The host server %hostname% is offline' ELSE plugin_vm_legacymonitors.monitordescription END, 
     alertmessage = CASE WHEN MonitorName = 'ESX-Host Power State Test' THEN 'The host server %hostname% with IP address %ipaddress% is not responding and may be offline' ELSE plugin_vm_legacymonitors.alertmessage END,
  alerttemplateid = CASE WHEN MonitorName = 'ESX-Host Power State Test' THEN '3' ELSE plugin_vm_legacymonitors.alerttemplateid END,
#will update esx-bad storage sensor count
MonitorDescription =CASE WHEN MonitorName = 'ESX-Host Bad Storage Sensor Count' THEN 'ESX - Bad sensor on %hostname% %result%' ELSE plugin_vm_legacymonitors.monitordescription END, 
     alertmessage = CASE WHEN MonitorName = 'ESX-Host Bad Storage Sensor Count' THEN 'Bad sensor detected on %hostname% with IP address %ipaddress%' ELSE plugin_vm_legacymonitors.alertmessage END,
  alerttemplateid = CASE WHEN MonitorName = 'ESX-Host Bad Storage Sensor Count' THEN '3' ELSE plugin_vm_legacymonitors.alerttemplateid END,

#will update hv-host cpu percentage per core
MonitorDescription =CASE WHEN MonitorName = 'HV-Host CPU Percentage Per Core' THEN 'HV - CPU over 80% for %hostname% %result%' ELSE plugin_vm_legacymonitors.monitordescription END, 
     alertmessage = CASE WHEN MonitorName = 'HV-Host CPU Percentage Per Core' THEN 'The CPU usage for the host server %hostname% with IP address %ipaddress% has surpassed 80% for a CPU core' ELSE plugin_vm_legacymonitors.alertmessage END,
#will update hv-host memory usage
MonitorDescription =CASE WHEN MonitorName = 'HV-Host Memory Usage' THEN 'HV - Memory usage over 80% for %hostname% at %result%' ELSE plugin_vm_legacymonitors.monitordescription END, 
     alertmessage = CASE WHEN MonitorName = 'HV-Host Memory Usage' THEN 'The memory usage for the host server %hostname% with IP address %ipaddress% is currently over 80%' ELSE plugin_vm_legacymonitors.alertmessage END,
  alerttemplateid = CASE WHEN MonitorName = 'HV-Host Memory Usage' THEN '3' ELSE plugin_vm_legacymonitors.alerttemplateid END,
#will update hv-host disk percentage used
MonitorDescription =CASE WHEN MonitorName = 'HV-Host Disk Percentage Used' THEN 'HV - Disk space < 10% on %hostname% %result%' ELSE plugin_vm_legacymonitors.monitordescription END, 
     alertmessage = CASE WHEN MonitorName = 'HV-Host Disk Percentage Used' THEN 'The disk space for the host server %hostname% with IP address %ipaddress% is under 10% free' ELSE plugin_vm_legacymonitors.alertmessage END,
  alerttemplateid = CASE WHEN MonitorName = 'HV-Host Disk Percentage Used' THEN '3' ELSE plugin_vm_legacymonitors.alerttemplateid END,
#will update hv-host recently restarted
MonitorDescription =CASE WHEN MonitorName = 'HV-Host Recently Restarted' THEN 'HV - The host server %hostname% recently restarted' ELSE plugin_vm_legacymonitors.monitordescription END, 
     alertmessage = CASE WHEN MonitorName = 'HV-Host Recently Restarted' THEN 'The host server %hostname% with IP address %ipaddress% recently restarted' ELSE plugin_vm_legacymonitors.alertmessage END,
#will update hv-host disk percentage used
MonitorDescription =CASE WHEN MonitorName = 'HV-Host Power State Test' THEN 'HV - The host server %hostname% is offline' ELSE plugin_vm_legacymonitors.monitordescription END, 
     alertmessage = CASE WHEN MonitorName = 'HV-Host Power State Test' THEN 'The host server %hostname% with IP address %ipaddress% is not responding and may be offline' ELSE plugin_vm_legacymonitors.alertmessage END,
  alerttemplateid = CASE WHEN MonitorName = 'HV-Host Power State Test' THEN '3' ELSE plugin_vm_legacymonitors.alerttemplateid END,
#will update hv-host disk failure predicted
MonitorDescription =CASE WHEN MonitorName = 'HV-Host Disk Failure Predicted' THEN 'HV - SMART indicating disk failure on %hostname% %result%' ELSE plugin_vm_legacymonitors.monitordescription END, 
     alertmessage = CASE WHEN MonitorName = 'HV-Host Disk Failure Predicted' THEN 'SMART monitoring is inidicating that the disk on %hostname% with IP address %ipaddress% may fail soon' ELSE plugin_vm_legacymonitors.alertmessage END,
  alerttemplateid = CASE WHEN MonitorName = 'HV-Host Disk Failure Predicted' THEN '3' ELSE plugin_vm_legacymonitors.alerttemplateid END;