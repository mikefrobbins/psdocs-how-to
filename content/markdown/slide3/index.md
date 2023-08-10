---
title: Headings
weight: 3
---

![Headings][05]

The Markdown specification provides two ways to create headings.

- [ATX style][03] headings
- [Setext style][04] headings

ATX style headings provide the most flexibility and are the most commonly used. Setext headings are
more limited and have problems in some Markdown parsers.

ATX headings are created by prefixing the heading text with one or more `#` characters. The number
of `#` characters determines the heading level. For example, `# Heading 1` creates a level 1
heading, `## Heading 2` creates a level 2 heading, and so on.

For example:

```markdown
# Title (H1)

## Heading (H2)

### Subheading 1 (H3)

#### Subheading 2 (H4)

##### Subheading 3 (H5)

###### Subheading 4 (H6)
```

Renders as:

# Title (H1)

## Heading (H2)

### Subheading 1 (H3)

#### Subheading 2 (H4)

##### Subheading 3 (H5)

###### Subheading 4 (H6)

<!-- link references -->
[03]: https://spec.commonmark.org/0.30/#atx-headings
[04]: https://spec.commonmark.org/0.30/#setext-headings
[05]: slide3.png
