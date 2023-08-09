<#
.SYNOPSIS
Build script for the module docs
#>
[CmdletBinding()]
param(
    # Delete any previously built artifacts
    [Parameter(ParameterSetName = 'NewMarkdown')]
    [switch]$Clean,

    # Create new markdown files for the module
    [Parameter(ParameterSetName = 'NewMarkdown')]
    [switch]$NewMarkdown,

    # Create MAML help from the markdown files
    [Parameter(ParameterSetName = 'NewMaml')]
    [switch]$NewMaml,

    # Create updateable help assets
    [Parameter(ParameterSetName = 'UpdateableHelp')]
    [switch]$NewUpdateableHelp
)
$moduleName = 'ManageIssues'
$outputDir = "${PSScriptRoot}/out/"

if ( $clean ) {
    $null = if (Test-Path "${outputDir}/docs") {
        Remove-Item "${outputDir}/docs" -Recurse -Force
    }
    $null = if (Test-Path "${outputDir}/help") {
        Remove-Item "${outputDir}/help" -Recurse -Force
    }
    $null = if (Test-Path "${outputDir}/cab") {
        Remove-Item "${outputDir}/cab" -Recurse -Force
    }
}

if ( $NewMarkdown ) {
    $modInfo = Get-Module $moduleName
    if ($null -eq $modInfo) {
        throw "'$moduleName' not loaded. Import the module before running this script."
    }
    $newMarkdownHelpSplat = @{
        Module                = $moduleName
        AlphabeticParamsOrder = $true
        UseFullTypeName       = $true
        OutputFolder          = "${outputDir}/docs"
        WithModulePage        = $true
        Force                 = $true
    }
    New-MarkdownHelp @newMarkdownHelpSplat
}

if ( $NewMaml ) {
    if (-not (Test-Path "${outputDir}/docs/*.md")) {
        throw "Could not find '${outputDir}/docs'"
    }
    if (-not (Test-Path "${outputDir}/help")) {
        mkdir "${outputDir}/help"
    }
    $newExternalHelpSplat = @{
        Path       = "${outputDir}/docs"
        OutputPath = "${outputDir}/help"
        Force      = $true
    }
    New-ExternalHelp @newExternalHelpSplat
}

if ($newUpdateableHelp) {
    if (-not (Test-Path "${outputDir}/help/${moduleName}-help.xml")) {
        throw "Could not find '${moduleName}-help.xml'"
    }
    if (-not (Test-Path "${outputDir}/cab")) {
        mkdir "${outputDir}/cab"
    }
    $newExternalHelpCabSplat = @{
        CabFilesFolder  = "${outputDir}/help/"
        LandingPagePath = "${outputDir}/docs/${moduleName}.md"
        OutputFolder    = "${outputDir}/cab"
    }
    New-ExternalHelpCab @newExternalHelpCabSplat
}