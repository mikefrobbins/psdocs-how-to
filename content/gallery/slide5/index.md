---
title: Module manifest metadata
weight: 5
---

![Module manifest metadata][05]

The PowerShell Gallery provides information to gallery users drawn from metadata fields that are
included in the script or module manifest. Creating or modifying items for publication to the
PowerShell Gallery has a small set of requirements for information supplied in the item manifest.

When you create a module manifest using `New-ModuleManifest` the cmdlet prepopulates the **PSData**
hashtable with placeholder keys that are needed when publishing the module to the PowerShell
Gallery.

## Required metadata

- **Module Name** - Based on the name of the `.PSD1` file
- **Version** - format should follow SemVer guidelines
- **Author** - name of the author/owner
- **Description** - briefly explain what the module does and any requirements it has

## Recommended metadata

- **PSData.ProjectUri** - a link your source code
- **PSData.LicenseUri** - a link to the license for your code
- **PSData.Tags** - tags indicating PSEdition and platform support, and other keywords

## Ownership recommendations

Authors and owners of PowerShell Gallery items are related concepts, but don't always match. Item
owners are users with PowerShell Gallery accounts that have permission to maintain the item. There
may be many owners who can update an item.

- Have multiple owners, with at least one being the name of the team that produces the item
- Have the **Author** be a well-known team name within your organization

For more information, see the following articles:

- [Package metadata values that impact the PowerShell Gallery UI][03]
- [about_Module_Manifests][04]

[Previous][01] | [Next][02]

<!-- link references -->
[01]: ../slide4
[02]: ../slide6
[03]: https://learn.microsoft.com/powershell/gallery/concepts/package-manifest-affecting-ui
[04]: https://learn.microsoft.com/powershell/module/microsoft.powershell.core/about/about_module_manifests
[05]: slide5.png
