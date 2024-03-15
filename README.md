# minimaJake

This project is a fork of the default [minima theme](https://github.com/jekyll/minima) that [Jekyll](https://github.com/jekyll/jekyll) uses, aiming to add enough functionality to make minima a realistic choice, without any bloat / nonsense.

## About

minimaJake is used to host [JakeSteam](https://github.com/JakeSteam)'s [personal](https://jakelee.co.uk), [programming](https://blog.jakelee.co.uk), and [internet history](https://history.jakelee.co.uk) sites.

A live demo is available at [minima.jakelee.co.uk](https://minima.jakelee.co.uk), and a full guide to all launch features is available in [the announcement post](https://blog.jakelee.co.uk/introducing-minimajake-for-jekyll/).

## How to use

The easiest way is to just [copy the `_config.yml`](https://github.com/JakeSteam/blog-programming/blob/main/_config.yml) from one of the blogs using this theme, updating the name / accent colour etc as desired.

The theme is imported via `remote_theme: JakeSteam/minimaJake` in your `config.yml`, optionally adding `@1.0.12` to specify a release from [the releases page](https://github.com/JakeSteam/minimaJake/releases).

## Additions

Native (liquid) features:

- Table of contents (toggleable & collapsible)
- Linkable headers
- Tag system
- Pagination improvements
- End of post call to action
- Social & meta link system in footer
- Network site picker
- Plaintext or HTML excerpts (`show_excerpts` / `show_excerpts_html`)
- Read time / word count (`replace_read_time_with_word_count`)
- Search

Third party features:

- Giscus comments
- Configurable Ko-fi donation button & floating prompt

Design changes:

- Banner images
- Accent colour system

[![](https://blog.jakelee.co.uk/assets/images/2023/minimajake.png)](https://blog.jakelee.co.uk/assets/images/2023/minimajake.png)
