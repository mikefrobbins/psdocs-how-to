---
title: Adding content to Hugo
weight: 7
---

![Adding content to Hugo][01]

It seems like you're looking to add content to a website built using Hugo, a static site generator.
Adding content to Hugo is relatively straightforward due to its content management structure.

Here's a step-by-step guide:

## Navigate to your Hugo project

Open a terminal or command prompt and navigate to your Hugo project directory:

```powershell
Set-Location -Path path/to/your/hugo/site
```

## Create new content

Hugo's CLI provides an easy way to add new content. The basic syntax is:

```powershell
hugo new [path/to/content]
```

For instance, if you're creating a new blog post, it might look like:

```powershell
hugo new posts/my-new-post.md
```

## Edit the Content

The above command will generate a new markdown file at the specified path. You can open this file in
any text editor or markdown editor to add or modify the content.

At the top of the generated file, there's a section called "Front Matter" which uses YAML, TOML, or
JSON (depending on your configuration). This section contains metadata about the content, like
title, date, draft status, and more.

For instance:

```yaml
---
title: "My New Post"
date: 2023-08-10T00:00:00Z
draft: true
---
```

Beneath the Front Matter, you can write your content in Markdown.

## Preview Your site

After adding or editing content, you can start Hugo's built-in web server to preview your site:

```powershell
hugo server
```

Once the server starts, you can view your site by navigating to `http://localhost:1313` in your web
browser. If the content doesn't appear as expected, make sure the `draft` field in the Front Matter
is set to `false` or use `hugo server -D` to view drafts.

<!-- link references -->
[01]: slide7.png
