---
title: Hugo themes
weight: 6
---

![Hugo themes][01]

Adding a theme to a Hugo site involves several steps, but I'll break it down to make it easy for
you. Here's how you can add a theme to a Hugo site:

## Choose a theme

You can find Hugo themes at [Hugo Themes](https://themes.gohugo.io/). Once you've picked a theme you
like, make a note of its GitHub repository URL.

## Install the theme

You can add the theme to your Hugo site by cloning the theme's repository into the `themes/`
directory of your site:

```powershell
git clone [THEME_GITHUB_REPOSITORY_URL] themes/[THEME_NAME]
```

For example, if you wanted to use the `ananke` theme, you would do:

```powershell
git clone https://github.com/budparr/gohugo-theme-ananke.git themes/ananke
```

## Update the configuration

Edit your `config.toml` (or `config.yaml` or `config.json`, depending on which format you've chosen)
and add or update the `theme` variable to match the theme's directory name:

```toml
theme = "THEME_NAME"
```

For our example with `ananke`, it would be:

```toml
theme = "ananke"
```

## Adjust for the theme's specific settings

Many themes come with their own specific settings, shortcodes, or archetypes. You'll want to read
the theme's documentation to understand any additional configuration or content structure that's
expected.

You might need to:

- Adjust site parameters.
- Add menu items.
- Set up taxonomies.
- Add content to specific sections.

## Preview Your site

To preview your site with the new theme, you can run Hugo's built-in server:

```powershell
hugo server
```

Now, you can open your browser to `http://localhost:1313/` to see your site in action.

## Customize the theme

If you wish to modify the theme, you can do so by copying the relevant files from the theme's
directory into your main site directory and modifying them there. This allows you to update the
theme in the future without overwriting your customizations.

<!-- link references -->
[01]: slide6.png
