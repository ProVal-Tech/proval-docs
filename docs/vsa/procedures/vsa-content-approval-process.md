---
id: '183a6a77-39ff-4a42-95ac-1929e053630d'
slug: /183a6a77-39ff-4a42-95ac-1929e053630d
title: 'VSA Content Approval Process'
title_meta: 'VSA Content Approval Process'
keywords: ['approval', 'content', 'documentation', 'review', 'production']
description: 'This document outlines the process for reviewing and approving content submitted for approval in the Autotask queue. It includes steps for verifying content functionality, ensuring documentation meets guidelines, and moving approved content into production.'
tags: []
draft: false
unlisted: false
---

## Getting the Approval Request

You will receive an approval ticket in your Autotask queue when a piece of content is submitted for approval. All content approvals land on the DevOps Manager's desk before being routed to the appropriate department. RMM-specific content will be assigned to the RMM Developer for approval, who may then delegate to the Consultant or Lead Engineer.

## 1. Reviewing the Content

1. Open the ITGlue link in the ticket.

2. Open the related content in the VSA. If the content cannot be found or does not exist in the VSA, set the document to "Needs Revision" and assign the AutoTask ticket to the Engineer for revision. Be sure to note the reason for the revision request in both the ticket and the ITG document.

3. Review the VSA content, ensuring that it is functional, meets the needs of the original Client Request, and adheres to all ProVal Policy and Best Practices. If any of these criteria are not met, set the document to "Needs Revision" and assign the AutoTask ticket to the Engineer for revision. Be sure to note the reason for the revision request in both the ticket and the ITG document.

## 2. Reviewing the Documentation

1. Once you've verified that the content meets expectations, inspect the document itself.  
   
   First, ensure that the title of the document complies with the Documentation Guidelines. If it does not, set the document to "Needs Revision" and assign the AutoTask ticket to the Engineer for revision. Be sure to note the reason for the revision request in both the ticket and the ITG document.

2. Next, correct any simple grammar, spelling, or layout issues in the document.

3. Finally, ensure that the documentation is accurate and matches the functionality of the content. If any content is missing or incorrect, set the document to "Needs Revision" and assign the AutoTask ticket to the Engineer for revision. Be sure to note the reason for the revision request in both the ticket and the ITG document.

## 3. Approving Content

1. Once you've determined that the content is fit for production, you will approve the content and documentation.  
   
   First, set the Document flag to "Approved" and save. Note the date and your ITG username in the flag notes field.

2. Next, assign the AutoTask approval request ticket to the Engineer so that they know the content has been approved. Make sure to leave a note on the ticket indicating such.

## 4. Moving Content & Documentation into Production

1. Once the content is approved, it is ready to go into production. Once you assign the ticket to the Engineer, they will handle implementation in the client environment. You are expected to properly store the content and its documentation in ProVal's infrastructure.  
   
   First, if the content is one of the following types:
   - Agent Procedure
   - Policy
   - Reports
   
   Move the content to the appropriate directory. Client-specific content should be moved to the relevant client folder, and VSA-wide content should be categorized per the Document Title.

2. Next, move the ITGlue Document to the appropriate location.  
   - Client-specific content should be moved to the Client Organization/Content directory.
   - VSA-wide or Stack content should be categorized appropriately within Documents/Content Library/_RMM - Kaseya/

3. Finally, add the content you've approved to the content tracker for the month: [Content Tracker](https://proval.itglue.com/5078775/documents/folder/3021357) so that we can discuss all created content in a monthly meeting.

