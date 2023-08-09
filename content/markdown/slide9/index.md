---
title: Line length
weight: 9
---

![Line length][05]

### Limit line length to 100 characters

This applies to conceptual articles and cmdlet reference. Limiting the line length improves the
readability of git diffs and history. It also makes it easier for other writers to make
contributions.

Use the [Reflow Markdown][04] extension in VS Code to reflow paragraphs to fit the prescribed line
length.

About_topics are limited to 80 characters. For more specific information, see
[Formatting About_ files][03].

### Blank lines, spaces, and tabs

Blank lines also signal the end of a block in Markdown.

- There should be a single blank between Markdown blocks of different types -- for example, between
  a paragraph and a list or header.
- Don't use more than one blank line. Multiple blank lines render as a single blank line in HTML
  and serve no purpose.
- Within a code block, consecutive blank lines break the code block.

Spacing is significant in Markdown.

- Remove extra spaces at the end of lines. Trailing spaces can change how Markdown renders.
- Always uses spaces instead of hard tabs.

[Previous][02] | [Next][01]

<!-- link references -->
[01]: ../slide10
[02]: ../slide8
[03]: https://learn.microsoft.com/powershell/scripting/community/contributing/powershell-style-guide#formatting-about_-files
[04]: https://marketplace.visualstudio.com/items?itemName=marvhen.reflow-markdown
[05]: slide9.png
