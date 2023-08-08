---
external help file: ManageIssues-help.xml
Module Name: ManageIssues
online version: https://mikefrobbins.github.io/psdocs-how-to/Reference/ManageIssues/Add-ClosingComment.html
schema: 2.0.0
title: Add-ClosingComment
---

## SYNOPSIS
Adds a comment to a list of issues.

## SYNTAX

```
Add-ClosingComment [-CsvPath] <String> [-CommentPath] <String> [<CommonParameters>]
```

## DESCRIPTION

This cmdlet adds a comment to a list of issues. The list of issues is specified in a CSV file. The
CSV file must have a column named "apiUrl" that contains the URL of the GitHub API for the issue.
You can create this CSV file by using the Find-Issue cmdlet. The comment added to the issue is read
from the specified Markdown file.

## EXAMPLES

### EXAMPLE 1

```powershell
Add-ClosingComment -CsvPath C:\Temp\issues.csv -CommentPath C:\Temp\comment.md
```

## PARAMETERS

### -CommentPath

The path to the Markdown file that contains the comment to add to the issue.

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CsvPath

The path to the CSV file that contains the list of issues to add a comment to.

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable,
-InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose,
-WarningAction, and -WarningVariable. For more information, see
[about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

This cmdlet requires a GitHub personal access token to be stored in the environment variable
`$Env:GITHUB_TOKEN`.

## RELATED LINKS

[Find-Issue](https://mikefrobbins.github.io/psdocs-how-to/Reference/ManageIssues/Find-Issue.html)
