#region Presentation Info

<#
  Creating documentation for your PowerShell module using Hugo
  PowerShell on the River 2023
  Author:  Mike F. Robbins
  Website: https://mikefrobbins.com/
  Twitter: @mikefrobbins
#>

#endregion

#region Safety to prevent the entire script from being run instead of a selection

throw "You're not supposed to run the entire script"

#endregion

#region Set presentation mode

# Current theme and zoom level for VS Code
$VSCodeSettingsPath = "$HOME/Library/Application Support/Code/User/profiles/-12baa4e9/settings.json"
$VSCodeSettings = Get-Content -Path $VSCodeSettingsPath
$VSCodeSettings | ConvertFrom-Json | Select-Object -Property 'workbench.colorTheme', 'window.zoomLevel'

# Set VS Code theme to PowerShell ISE and zoom level to 1
if ($VSCodeSettings -match '"workbench.colorTheme": ".*",') {
    $VSCodeSettings = $VSCodeSettings -replace '"workbench.colorTheme": ".*",', '"workbench.colorTheme": "PowerShell ISE",'
}
if ($VSCodeSettings -match '"window.zoomLevel": \d,') {
    $VSCodeSettings = $VSCodeSettings -replace '"window.zoomLevel": \d,', '"window.zoomLevel": 2,'
}
$VSCodeSettings | Out-File -FilePath $VSCodeSettingsPath

#endregion

#region Prerequisites
# Install git
# Install the GitHub CLI (gh) or use the Github website to create the repository
# Install the documentarian module (for Get-Metadata and Set-Metadata)
# Install-module -Name Documentarian

# Path to presentation content
$gitRepoParentPath = '~/Developer/git'
$hugoSiteName = 'psotr'
$sourceRepoPath = '~/Developer/git/psotr-pr'
$destinationRepoPath = Join-Path -Path $gitRepoParentPath -ChildPath $hugoSiteName
$githubUserName = 'mikefrobbins'

#endregion

#region Install Hugo

#region Windows

# Install Hugo
winget install Hugo.Hugo.Extended

#endregion

#region macOS

# Install Homebrew
# https://brew.sh/
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install Hugo
brew install hugo

#endregion

#region Linux

#Install Hugo
# https://gohugo.io/installation/linux/

#endregion

#endregion

#region Create a new site and configure it

# Show website does not exist

#Local website
Start-Process http://localhost:1313/

# Local folder or GitHub repo does not exisst
Test-Path -Path $destinationRepoPath -PathType Container

# Create a new site
Set-Location -Path $gitRepoParentPath
hugo new site $hugoSiteName

# Move into the new site directory
Set-Location -Path $destinationRepoPath

# Initialize a new git repository
git init

# Add a theme
git submodule add https://github.com/$githubUserName/hugo-theme-relearn.git themes/hugo-theme-relearn

# Configure Hugo to use the theme
Add-Content -Path hugo.toml -Value "theme = 'hugo-theme-relearn'"

# Test the website locally

# Show that Hugo server ties up your prompt
hugo server

# Show that Hugo server can be run in the background
Start-Job -Name hugo -ScriptBlock {hugo server} -WorkingDirectory $destinationRepoPath
Get-Job -Name hugo | Receive-Job -Keep
# Stop-Job -Name hugo
# Remove-Job -Name hugo

# Visit the local version of the website
Start-Process http://localhost:1313/

#endregion

#region GitHub

# GitHub Pages website
Start-Process https://$githubUserName.github.io/$hugoSiteName/

# GitHub repo does not exist
Start-Process https://github.com/mikefrobbins/psotr

# Add a .gitignore file
Copy-Item -Path "$sourceRepoPath/Creating docs for your module/hugo/.gitignore" -Destination $destinationRepoPath

# Add and commit the changes
git status
git add .
git commit -m 'Initial commit'

# Create a new repo on GitHub and push your local clone to it
gh repo create $hugoSiteName --private --push --source=. --add-readme --description 'Repo to host demo website'

# Add a GitHub Action

# Query Github pages info (not found is expected)
gh api -H "Accept: application/vnd.github+json" -H "X-GitHub-Api-Version: 2022-11-28" /repos/$githubUserName/$hugoSiteName/pages

# Enable GitHub pages and set it to deplay via a GitHub Action
gh api -H "Accept: application/vnd.github+json" -H "X-GitHub-Api-Version: 2022-11-28" /repos/$githubUserName/$hugoSiteName/pages -F "source:branch=main" -F "source:path=/" -F "build_type=workflow"

# Add the GitHub Action workflow folder
New-Item -Path "$destinationRepoPath/.github/workflows" -ItemType Directory -Force

# Copy the GitHub Action workflow file into the folder
Copy-Item -Path "$sourceRepoPath/Creating docs for your module/hugo/hugo.yaml" -Destination "$destinationRepoPath/.github/workflows/"

# Add and commit the changes
git status
git add .
git commit -m 'Added GitHub Action workflow'
git push

# For more info, see: https://gohugo.io/hosting-and-deployment/hosting-on-github/

#endregion

#region Test the website

# Visit the website
Start-Process https://$githubUserName.github.io/$hugoSiteName/

# Check the status of the GitHub Action workflow
gh workflow list
gh workflow view 'Deploy Hugo site to Pages'
Start-Process https://github.com/$githubUserName/$hugoSiteName/actions

# View the status of the GitHub Action workflow
Start-Process https://github.com/$githubUserName/$hugoSiteName

#endregion

#region Deploy the docs

# Create path for content to be published
New-Item -Path "$destinationRepoPath/content/reference/manageissues/" -ItemType Directory -Force

# Copy reference documentation
Copy-Item -Path "$sourceRepoPath/Creating docs for your module/module/docs/*.md" -Destination "$destinationRepoPath/content/reference/manageissues/"

# Rename the module file to _index.md
Rename-Item -Path "$destinationRepoPath/content/reference/manageissues/ManageIssues.md" -NewName _index.md

# Update metadata
$files = Get-ChildItem -Path "$destinationRepoPath/content/reference/manageissues" -Filter *.md

foreach ($file in $files) {
  # Remove h1 from the content
  $Content = Get-Content -Path $file.FullName
  $h1 = $Content -match '^\# (.*)'

  if ($h1) {
    $title = $h1 -replace '^\# '
    $newContent = $Content -replace $h1
    $newContent | Out-File -FilePath $file.FullName -Force
  }

  # Add title to metadata
  $metadata = Get-Metadata -Path $file.FullName

  if (-not($metadata.title)) {
    $metadata.title = "'$title'"
    Set-Metadata -Path $file.FullName -NewMetadata $metadata
  }

}

# Add and commit the changes
git status
git add .
git commit -m "Added reference documentation"
git push

# Check the status of the GitHub Action workflow
gh workflow view 'Deploy Hugo site to Pages'

#endregion

#region Cleanup and reset demo

Get-Job -Name hugo | Stop-Job -PassThru | Remove-Job
#gh repo delete $hugoSiteName --yes
#Remove-Item -Path $destinationRepoPath -Recurse -Force

$VSCodeSettingsPath = "$HOME/Library/Application Support/Code/User/profiles/-12baa4e9/settings.json"
$VSCodeSettings = Get-Content -Path $VSCodeSettingsPath

if ($VSCodeSettings -match '"workbench.colorTheme": ".*",') {
    $VSCodeSettings = $VSCodeSettings -replace '"workbench.colorTheme": ".*",', '"workbench.colorTheme": "Visual Studio Dark",'
}
if ($VSCodeSettings -match '"window.zoomLevel": \d,') {
    $VSCodeSettings = $VSCodeSettings -replace '"window.zoomLevel": \d,', '"window.zoomLevel": 1,'
}

$VSCodeSettings | Out-File -FilePath $VSCodeSettingsPath

#endregion