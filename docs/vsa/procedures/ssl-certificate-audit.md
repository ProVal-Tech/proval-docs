---
id: '6da85c3b-f91a-4952-b69f-0345c721c6da'
slug: /6da85c3b-f91a-4952-b69f-0345c721c6da
title: 'SSL Certificate Audit'
title_meta: 'SSL Certificate Audit'
keywords: ['certificates', 'audit', 'expiration', 'status', 'thumbprint', 'issuer', 'subject', 'client', 'computer']
description: 'This Script pulls any and all certificates in the personal certificate repository on windows machines that it is run on.'
tags: ['windows','auditing','certificates']
draft: false
unlisted: false
last_update:
  date: 2026-04-08
---

## Summary

This Script pulls any and all certificates in the personal certificate repository on windows machines that it is run on. Then creates a CSV file under the `C:\ProgramData\_automation\AgentProcedure\SSLAudit`


## Implementation

1. Export the agent procedure from ProVal's VSA RMM instance.   
   **Name:** `SSL Certificate Audit`   
   ![Image](../../../static/img/docs/6da85c3b-f91a-4952-b69f-0345c721c6da/xml.webp)  
   The export will download the necessary XML file.   
   
2. Import this XML file into the partner's VSA RMM instance.   

3. Export the `Check-SSL-Certificate.ps1` from the ProVal's Internal VSA. This is also placed under the below path:  
`Manage Files` > `Shared Files` > `PVAL` > `Check-SSL-Certificate.ps1`  

   ![Image](../../../static/img/docs/6da85c3b-f91a-4952-b69f-0345c721c6da/managed-files.webp)

4. Map the `Check-SSL-Certificate.ps1` into the 11th step of the script in the client's environment.

   ![Image](../../../static/img/docs/6da85c3b-f91a-4952-b69f-0345c721c6da/mapping.webp) 

5. Execute the agent procedure in the partne's VSA RMM and click Submit:
   ![Image](../../../static/img/docs/6da85c3b-f91a-4952-b69f-0345c721c6da/ssl.webp)

## Output

Script log
`C:\ProgramData\_automation\AgentProcedure\SSLAudit\.csv-file-name`

## Changelog

### 2026-04-08

- Initial version of the document