---
title: Tables
weight: 7
---

![Tables][05]

Most implementations of Markdown support tables, however, table markup is not defined in the
[Commonmark specification][04] of the Markdown language.

Most implementations support the [GitHub Flavored Markdown (GFM)][03] table syntax. The syntax for
tables is:

```markdown
| Default | Left justified | Right justified | Centered |
| ------- | :------------- | --------------: | :------: |
| 1234 | 1234 | 1234 | ABC |
| ABC | 1234 | 1234 | 1234 |
| 1234 | 1234 | 1234 | ABC |
| ABC | 1234 | 1234 | 1234 |
```

Renders as:

| Default | Left justified | Right justified | Centered |
| ------- | :------------- | --------------: | :------: |
| 1234    | 1234           |            1234 |   ABC    |
| ABC     | 1234           |            1234 |   1234   |
| 1234    | 1234           |            1234 |   ABC    |
| ABC     | 1234           |            1234 |   1234   |

<!-- link references -->
[03]: https://github.github.com/gfm/
[04]: https://spec.commonmark.org/0.30/
[05]: slide7.png
