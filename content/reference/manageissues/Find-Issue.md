---
external help file: ManageIssues-help.xml
Module Name: ManageIssues
online version: https://mikefrobbins.github.io/psdocs-how-to/reference/manageissues/find-issue
schema: 2.0.0
title: Find-Issue
---

## SYNOPSIS
Returns a list of stale issues from a GitHub repository.

## SYNTAX

### ByAgeDays (Default)

```
Find-Issue -OlderThanDays <UInt32> [-Label <String[]>] [-RepoName <String>] [-OutPath <String>]
 [<CommonParameters>]
```

### ByAgeMonths

```
Find-Issue -OlderThanMonths <UInt32> [-Label <String[]>] [-RepoName <String>] [-OutPath <String>]
 [<CommonParameters>]
```

## DESCRIPTION

This cmdlet returns a list of stale issues from a GitHub repository based on the age of the issue.
You can be filter by one or more labels. The output can be saved to a CSV file for further
processing.

## EXAMPLES

### EXAMPLE 1

```powershell
Find-Issue -OlderThanDays 30 -Label 'cloud-shell/svc'
```

This example returns a list of issues that are older than 30 days and have the label
"cloud-shell/svc".

### EXAMPLE 2

```powershell
Find-Issue -OlderThanMonths 3 -Label 'sql/subsvc', 'synapse-analytics/svc' -OutPath C:\Temp\issues.csv
```

This example returns a list of issues that are older than 3 months and have the labels "sql/subsvc"
and "synapse-analytics/svc". The output is saved to the file `C:\Temp\issues.csv`.

## PARAMETERS

### -Label

One or more labels that the issue must have. Multiple labels are specified as an array
(comma-separated list).

```yaml
Type: System.String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -OlderThanDays

The number of days that an issue must be older than to be considered stale.

```yaml
Type: System.UInt32
Parameter Sets: ByAgeDays
Aliases:

Required: True
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -OlderThanMonths

The number of months that an issue must be older than to be considered stale.

```yaml
Type: System.UInt32
Parameter Sets: ByAgeMonths
Aliases:

Required: True
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -OutPath

The path to a CSV file to save the output to. If not specified, the output is displayed in the
console.

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -RepoName

The name of the repository to search. The default is "MicrosoftDocs/azure-docs".

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: MicrosoftDocs/azure-docs
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

[Add-ClosingComment](../add-closingcomment)
