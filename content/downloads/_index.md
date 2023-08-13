---
title: Downloads
weight: 90
---

This page contains links to the PowerPoint presentations and demo scripts used in the workshop.

### PowerPoint presentations

- [Markdown](../presentations/Markdown.pptx)
- [GitHub](../presentations/GitHub.pptx)
- [HelpSystem](../presentations/HelpSystem.pptx)
- [Publishing your module to PSGallery](../presentations/Publishing%20your%20module%20to%20PSGallery.pptx)
- [Hugo](../presentations/Hugo.pptx)

### Source code

- [ManageIssues-source.zip](../scripts/ManageIssues-source.zip)

  This zip file contains the source code for the ManageIssues module. Besides the source for the
  module, this archive includes:

  - `build.ps1` - the script that builds the module and publishes it to the PowerShell Gallery
  - `makedocs.ps1` - the script that generates the help files for the module

- [hugo-create.zip](../scripts/hugo-create.zip)

  This zip file contains the demo script and GitHub action we used to create the Hugo website.

  - `hugo.ps1` - the script that creates the Hugo website. This script is not designed to be run
    directly. It is a runbook containing code for the steps to create the site. Some steps have
    example code snippets for different operating systems.
  - `hugo.yaml` - the GitHub action that builds the static website and deploys it to GitHub pages.
     This file gets installed by one of the steps in the `hugo.ps1` script.
