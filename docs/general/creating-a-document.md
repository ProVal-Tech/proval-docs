---
id: 'creating-a-document'
title: 'Creating a Document'
title_meta: 'Creating a Document'
keywords: [ "document", "create", "new" ]
description: 'How to create a new document in the documentation system.'
tags: [ ]
draft: false
unlisted: true
---

Creating a new document in the documentation system is a simple process. This guide will walk you through the steps to create a new document.

1. If you haven't already, clone the repository to your local machine.
2. Create a new branch for your document/documents.
3. Copy the template from the respective folder in the repository. Name it appropriately. Names should be all lowercase, with hyphens separating words.
4. In the Front Matter of the document, each section should be filled out as follows:

- id - A new GUID for the document.
- title - The title of the document.
- title_meta - The title of the document.
- keywords - Keywords for the document. These are not strictly enforced, but they help with searchability.
- description - A brief description of the document.
- tags - Tags for the document. These are strictly enforced and should be chosen from the list of available tags in the [tags](../tags.yml) file.
- draft - Set to `false` if the document is ready for publication.
- unlisted - Set to `true` if the document should not be listed in the documentation index.

5. Fill out the document with the appropriate content based on the template.
6. Commit your changes and push your branch to the repository.
7. Create a pull request to merge your branch into the `main` branch.
8. Once your pull request is approved and merged, your document will be live on the documentation site.

# FAQ

## How do I know which tags to use?
Tags are listed in the [tags](../tags.yml) file. Choose from the list of available tags there. Try not to exceed 5 tags per document.

If you need a new tag, please open an issue to request it.

## How do I attach a file to a document?
To attach a file to a document, place the file that you would like to attach in the `/static/attachments` folder. Then, in the document, use the following markdown to link to the file:

```markdown
[My Test Document](/attachments/Test.pdf)
```
[My Test Document](/attachments/Test.pdf)