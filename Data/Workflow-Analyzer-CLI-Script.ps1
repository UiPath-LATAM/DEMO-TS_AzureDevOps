<# Run UiPath Studio's Workflow Analyzer via command line and pipe results to file #>

param (
     [Parameter(Mandatory)]
     [string]$ProjectFilePath,

     [Parameter(Mandatory)]
     [string]$OutputFilePath
    )

mkdir $OutputFilePath
$OutputLog = "$OutputFilePath\$(Get-Date -Format 'yyyy-MM-dd-HH-mm-ss')-Workflow-AnalysysStage.log"
New-Item $OutputLog
$OutputFilePath = "$OutputFilePath\$(Get-Date -Format 'yyyy-MM-dd-HH-mm-ss')-Workflow-Analysis.json"
New-Item $OutputFilePath 

$ExecutableFilePath="\Program Files\UiPath\Studio\"
cd $ExecutableFilePath

Write-Output "$(Get-Date -Format 'HH:mm:ss') - STARTED - Workflow Analyzer CLI Script" | Out-File -Path $OutputLog
#Write-Output "$ProjectFilePath"
#Write-OutPut "$OutputFilePath"

$Command = ".\UiPath.Studio.CommandLine.exe analyze -p $ProjectFilePath"

Invoke-Expression $Command | Out-File -FilePath $OutputFilePath

Write-Output "$(Get-Date -Format 'HH:mm:ss') - COMPLETED - Workflow Analyzer CLI Script" | Out-File -Path $OutputLog
