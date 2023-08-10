---
title: Lists
weight: 5
---

![Lists][03]

Markdown supports both ordered and unordered lists. Create unordered lists by prefixing list items
with a `-` character. Create ordered lists by prefixing list items with a number followed by a `.`
character.

## Numbered list (ordered)

To create a numbered list, can use `1.` for all items. The numbers are rendered in ascending order
as a sequential list when published. Nested items are indented 3 characters. Nested lists using
numbers render as lowercase letters when published.

```markdown
1. This is a numbered item
1. This is a parent numbered list
   1. This is a nested list item
   1. This is a nested list item
1. This is the last time int he parent list
```

This renders as follows:

1. This is a numbered item
1. This is a parent numbered list
   1. This is a nested list item
   1. This is a nested list item
1. This is the last time int he parent list

## Bulleted list (unordered)

To create a bulleted list, use `-` followed by a space at the beginning of each line. Indent
subitems by two spaces.

```markdown
- This is bulleted list item
- This is a parent bulleted list
  - This is a nested list item
  - This is a nested list item
- This is the end of the parent list
```

This renders as follows:

- This is bulleted list item
- This is a parent bulleted list
  - This is a nested list item
  - This is a nested list item
- This is the end of the parent list

## Indentation

In Markdown, spaces before the first character of a line determine the line's alignment relative to
the preceding lines. Indentation influences numbered and bulleted lists to render multiple levels of
nesting in a hierarchical or outline format.

To indent text to align with a preceding paragraph or an item in a numbered or bulleted list, use
spaces, not tabs.

The following two examples show how indented paragraphs render based on their relationship to other
paragraphs.

~~~markdown
1. This is a numbered list example (one space after the period before the letter T).

   This sentence is indented three spaces.

   ```
   This code block is indented three spaces.
   ```

- This is a bulleted list example (one space after the bullet before the letter T).

  This sentence is indented two spaces.

  > [!TIP]
  > This tip is indented two spaces.

  - This is a second-level bullet (indented two spaces, with one space after the bullet before the
    letter T).

    This sentence is indented four spaces.

    > This quote block is indented four spaces.
~~~

This example renders as:

1. This is a numbered list example (one space after the period before the letter T).

   This sentence is indented three spaces.

   ```
   This code block is indented three spaces.
   ```

- This is a bulleted list example (one space after the bullet before the letter T).

  This sentence is indented two spaces.

  > [!TIP]
  > This tip is indented two spaces.

  - This is a second-level bullet (indented two spaces, with one space after the bullet before the
    letter T).

    This sentence is indented four spaces.

    > This quote block is indented four spaces.

<!-- link references -->
[03]: slide5.png
