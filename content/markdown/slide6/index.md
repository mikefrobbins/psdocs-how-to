---
title: Links and images
weight: 6
---

![Links and images][03]

## Hyperlinks

Hyperlink in Markdown use the following syntax:

```markdown
[<link-text>](<link-url>)
```

The `<link-text>` is the text that's displayed in the rendered output. The `<link-url>` is the URL
to a web page or file. For example:

```markdown
You can find the source files for the PowerShell documentation at
[PowerShell-Docs](https://github.com/MicrosoftDocs/PowerShell-Docs).
```

Is rendered as:

You can find the source files for the PowerShell documentation at
[PowerShell-Docs](https://github.com/MicrosoftDocs/PowerShell-Docs).

## Images

You can insert images in Markdown using a modified form of the hyperlink syntax. The syntax is:

```markdown
![<alt-text>][<image-url>]
```

The `<alt-text>` is the text that is displayed if the image cannot be loaded. The `<image-url>` is
the URL that points to the image file. For example:

```markdown
This is an image of thethe PowerShell Hero: ![PowerShell Hero](pshero-110x110.png)
```

Renders as:

This is an image of thethe PowerShell Hero: ![PowerShell Hero](pshero-110x110.png)

<!-- link references -->
[03]: slide6.png
