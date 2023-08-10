---
title: Test your module and metadata
weight: 6
---

![Test your module and metadata][06]

Before you publish your module to the PowerShell Gallery, you ensure that it works as expected and
that it follows best practices.

- Use **PowerShell Script Analyzer** to ensure code quality - PowerShell Script Analyzer is a static
  code analysis tool that scans your code to ensure it meets basic PowerShell coding guidelines.
  This tool identifies common issues in your code. You should run it often during development to
  help you get your item ready to publish.
- Test your code - **Pester** provides a framework for writing and running tests. Pester is most
  commonly used for writing unit and integration tests, but it's not limited to just that. It's also
  a base for tools that validate whole environments, computer deployments, database configurations
  and other scenarios.
- Run `Test-ModuleManifest` - If the PowerShell Gallery can't read the manifest information, your
  module won't be published. `Test-ModuleManifest` catches common problems that would cause the
  module to not be usable when it's installed.

## Related links

- [Test-ModuleManifest][03]
- [PSScriptAnalyzer module][04]
- [Pester - The ubiquitous test and mock framework for PowerShell][05]

<!-- link references -->
[03]: https://learn.microsoft.com/powershell/module/microsoft.powershell.core/test-modulemanifest
[04]: https://learn.microsoft.com/powershell/utility-modules/psscriptanalyzer/overview
[05]: https://pester.dev/
[06]: slide6.png
