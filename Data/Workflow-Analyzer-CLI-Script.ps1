<# Run UiPath Studio's Workflow Analyzer via command line and pipe results to file #>

param (
    $ProjectFilePath=".\project.json",
    $OutputFilePath=".\$(Get-Date -Format 'yyyy-MM-dd-HH-mm-ss')-Workflow-Analysis.json"
    )


$ExecutableFilePath="\Program Files\UiPath\Studio\"
cd $ExecutableFilePath

Write-Output "$(Get-Date -Format 'HH:mm:ss') - STARTED - Workflow Analyzer CLI Script"
#Write-Output "$ProjectFilePath"
Write-OutPut "$OutputFilePath"

$Command = ".\UiPath.Studio.CommandLine.exe analyze -p $ProjectFilePath"
$OutputFilePath = "$OutputFilePath\$(Get-Date -Format 'yyyy-MM-dd-HH-mm-ss')-Workflow-Analysis.json" 

Invoke-Expression $Command | Out-File -FilePath $OutputFilePath

Write-Output "$(Get-Date -Format 'HH:mm:ss') - COMPLETED - Workflow Analyzer CLI Script"
