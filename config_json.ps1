$version = Get-Content -Path "$env:Build_SourcesDirectory/version" 

if (![string]::IsNullOrWhiteSpace($version)) {
    $jsonBody = @{
    UpdateContainerInstanceviaPipeline = "True"
    PortalID = "877"
    WebAppName = "Mavim-nl-scalingdta"
    Webconfigversion = "$version"
    ForceFunction = "True"
    RedeployApp = "True"
    } | ConvertTo-Json
} else {
    Write-Host "The version variable is empty. The script will not run."
    Exit 1
}