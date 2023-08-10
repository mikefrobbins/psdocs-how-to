---
title: Code
weight: 8
---

![Code][04]

Markdown supports two different code styles:

- **Code spans (inline)** - marked by a single backtick (`` ` ``) character. Used within a paragraph
  rather than as a standalone block.
- **Code blocks** - a multi-line block surrounded by triple-backtick (`` ``` ``) strings. Code
  blocks may also have a language label following the backticks. The language label enables syntax
  highlighting for the contents of the code block.

All code blocks should be contained in a code fence. Never use indentation for code blocks. Markdown
allows this pattern but it can be problematic and should be avoided.

A code block is one or more lines of code surrounded by a triple-backtick (`` ``` ``) code fence.
The code fence markers must be on their own line before and after the code sample. The opening
marker may have an optional language label. The language label enables syntax highlighting on the
rendered webpage.

### Syntax code blocks

Syntax code blocks are used to describe the syntactic structure of a command. Don't use a language
tag on the code fence. This example illustrates all the possible parameters of the `Get-Command`
cmdlet.

~~~markdown
```
Get-Command [-Verb <String[]>] [-Noun <String[]>] [-Module <String[]>]
  [-FullyQualifiedModule <ModuleSpecification[]>] [-TotalCount <Int32>] [-Syntax]
  [-ShowCommandInfo] [[-ArgumentList] <Object[]>] [-All] [-ListImported]
  [-ParameterName <String[]>] [-ParameterType <PSTypeName[]>] [<CommonParameters>]
```
~~~

The output displayed by PowerShell commands should be enclosed in an **Output** code block to
prevent syntax highlighting. For example:

~~~markdown
```powershell
Get-Command -Module ManageIssues
```

```Output
CommandType    Name                  Version    Source
-----------    ----                  -------    ------
Function       Add-ClosingComment    1.0.0      ManageIssues
Function       Find-Issue            1.0.0      ManageIssues
```
~~~

The **Output** code label isn't an official "language" supported by the syntax highlighting system.
However, this label is useful because our publishing system adds the "Output" label to the code box
frame on the web page. The "Output" code box has no syntax highlighting.

> [!NOTE]
> Results can vary depending on the rendering engine used by the web site.

## Avoid line continuation in code samples

Avoid using line continuation characters (`` ` ``) in PowerShell code examples. These are hard to
see and can cause problems if there are extra spaces at the end of the line.

- Use PowerShell splatting to reduce line length for cmdlets that have several parameters.
- PowerShell has natural line break opportunities, like after pipe (`|`) characters, opening braces
  (`{`), parentheses (`(`), and brackets (`[`).

For more information, see [Markdown for code samples][03].

<!-- link references -->
[03]: https://learn.microsoft.com/powershell/scripting/community/contributing/powershell-style-guidemarkdown-for-code-samples
[04]: slide8.png
