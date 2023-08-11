---
title: Page bundles
weight: 8
---

![Page bundles][01]

In Hugo, a static site generator, "Page Bundles" is a concept that allows content to be organized in
a coherent and flexible manner. They are especially useful when you have resources, such as images
or other media, associated with a content page.

Here's how to organize content using Page Bundles in Hugo:

## Understand the two types of page bundles

- **Leaf Bundles**: The directory itself represents a single page, and any content inside that
  directory becomes the resources for that page. The content for the page is in an `index.md` (or
  `index.html` or any other format that Hugo understands) file inside the directory.

- **Branch Bundles**: The directory contains other content pages but doesn’t represent a single page
  itself.

## Creating a leaf bundle

Let's say you have an article titled "My Vacation".

1. Create a directory named `my-vacation`.
1. Inside the `my-vacation` directory, create an `index.md` file. This file will contain the content
   of your article.
1. Place any related resources (like images) directly inside the `my-vacation` directory.

The structure would look something like this:

```
content/
└── posts/
    └── my-vacation/
        ├── index.md  (The actual content of "My Vacation")
        ├── image1.jpg
        └── image2.png
```

## Using Resources in the leaf bundle

With the structure in place, in your `index.md` file, you can reference resources:

```markdown
---
title: "My Vacation"
date: 2023-08-10
---

Here's a picture from my vacation!

![picture-of-my-vacation](image1.jpg)
```

## Creating a branch bundle

For a branch bundle, you don't create an `index.md` inside the directory. Instead, you add other
content directories or files inside it.

Example:

```
content/
└── articles/
    ├── my-vacation.md
    └── another-article.md
```

## Notes

- **Ordering**: You can control the ordering of content in a branch bundle by using weight in front
  matter or by filename/date.

- **Accessing Resources**: Hugo provides `.Resources` which is an array of resources, and
  `.Resources.GetMatch` to fetch specific resources.

- **Image Processing**: Hugo has built-in image processing capabilities. When you're using page
  bundles, it becomes easy to fetch, resize, or modify images associated with the content.

- **Nested Bundles**: It’s possible to nest bundles, though for clarity and simplicity, it's usually
  better to avoid deep nesting.

## Tips for better organization

- **Consistency**: Stick with one method. Whether you choose to use branch or leaf bundles (or
  both), be consistent in your approach.

- **Documentation**: Keep a small README or notes on your structure, especially if collaborating
  with others.

- **Use Hugo's Functions**: Utilize functions like `.Resources.GetMatch` and `.Resources.Match` to
  access resources efficiently.

The flexibility of Hugo's page bundles allows for a structured and efficient approach to content
organization. Whether you're dealing with articles, images, or other media, the feature can simplify
your workflow.

<!-- link references -->
[01]: slide8.png
