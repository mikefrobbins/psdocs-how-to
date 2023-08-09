<#
.SYNOPSIS
Build script for the module
#>
param(
    # Deletes files from a previous build
    [switch]$clean,

    # Copies module to a versioned directory
    [switch]$publish,

    # Runs Pester tests (if available)
    [switch]$test,

    # Creates a NuGet package and publishes it to the `out` directory
    [switch]$package,

    # Publishes the module to the PowerShell Gallery from the `out` directory
    [switch]$gallery
)
$moduleName = "ManageIssues"
$psd = Import-PowerShellDataFile "$PSScriptRoot/src/${moduleName}.psd1"
$moduleVersion = $psd.ModuleVersion
$moduleDeploymentDir = "${PSScriptRoot}/out/${moduleName}/${moduleVersion}"

if ( $clean ) {
    $null = if (Test-Path "${PSScriptRoot}/out/${moduleName}") {
        Remove-Item "${PSScriptRoot}/out/${moduleName}" -Recurse -Force
    }
    $null = if (Test-Path "$PSScriptRoot/out/*.nupkg") {
        Remove-Item "$PSScriptRoot/out/*.nupkg" -Force
    }
    $null = if (Test-Path "$PSScriptRoot/out/testResults.xml") {
        Remove-Item "$PSScriptRoot/out/testResults.xml" -Force
    }
}

if ($publish) {
    # create directory with version
    # copy files to that location
    if (-not (Test-Path $moduleDeploymentDir)) {
        New-Item -Type Directory -Force -Path $moduleDeploymentDir
    }
    Copy-Item -Force -Recurse "$PSScriptRoot/src/*" $moduleDeploymentDir
}

if ( $test ) {
    if ( ! $publish ) {
        ./build.ps1 -publish
    }
    # run tests
    $psExe = (get-process -id $PID).MainModule.filename
    $testCommand = "import-module $PSScriptRoot/out/${moduleName}; Set-Location $PSScriptRoot/test; Invoke-Pester -OutputFormat NUnitXml -OutputFile  $PSScriptRoot/out/testResults.xml"
    $psArgs = "-noprofile","-noninteractive","-command",$testCommand
    & $psExe $psArgs
}

if ( $package ) {
    if (-not (test-path $moduleDeploymentDir)) {
        throw "Could not find '$moduleDeploymentDir'"
    }
    $repoName = [Guid]::NewGuid().ToString("N")
    try {
        Register-PSRepository -Name $repoName -SourceLocation $PSScriptRoot/out/
        Publish-Module -Path $moduleDeploymentDir -Repository $repoName
    }
    finally {
        Unregister-PSRepository -Name $repoName
    }
}

if ( $gallery ) {
    if (-not (test-path $moduleDeploymentDir)) {
        throw "Could not find '$moduleDeploymentDir'"
    }
    $publishModuleSplat = @{
        NuGetApiKey = $env:PSGALLERY_TOKEN
        Path = "$PSScriptRoot/out/${moduleName}"
        Repository = 'PSGallery'
    }
    Publish-Module @publishModuleSplat
}