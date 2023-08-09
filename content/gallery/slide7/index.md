---
title: Publish to the PowerShell Gallery
weight: 7
---

# Publish to the PowerShell Gallery

![Publish to the PowerShell Gallery][05]

## Publishing requirements

Use the `Publish-Module` or `Publish-PSResource` cmdlets to publish items to the PowerShell Gallery.
These commands both require:

- Path to the module
- PowerShell Gallery API Key

Most of the other cmdlet options are covered by the module manifest, so you shouldn't need to
specify them in the command.

To avoid errors, use the **WhatIf** and **Verbose** parameters before publishing. This helps
identify problems with your module before actually publishing. Every time you publish to the
PowerShell Gallery, you must update the version number in the manifest.

## After publishing

After you have published the module to the PowerShell Gallery, you should check that it can be
accessed by the public (without an account).

You may need to adjust information in the Gallery UI. For example, you can manage owners, add custom
documentation, or unlist a version of the module.

## Related links

- [Publish-Module][04]
- [Publish-PSResource][03]

[Previous][01] | [Next][02]

<!-- link references -->
[01]: ../slide6
[02]: ../slide8
[03]: https://learn.microsoft.com/powershell/module/microsoft.powershell.psresourceget/publish-psresource
[04]: https://learn.microsoft.com/powershell/module/powershellget/publish-module
[05]: slide7.png
