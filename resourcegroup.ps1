if (Test-Path -Path "$env:Build_SourcesDirectory/Web.zip") {
    # Expand the Web.zip
    Expand-Archive -Path "$env:Build_SourcesDirectory/Web.zip" -DestinationPath "./WebExpanded" -Force

    # Get the version
    $version = Get-Content -Path $env:Build_SourcesDirectory/version                         
    Write-Host "The version is going to deploy is $version"

    # Rename the file with the specific name
    Write-Host "The files list are:"
    ls ".\WebExpanded\"
    Write-Host "Rename the web.config name with the new version"       

    # Upload the file web.config
    Write-Host "Upload the file to the correct blob storage:"
    az storage blob upload --connection-string "$env:webconfigStorageAccount" --type block --file ".\WebExpanded\web.config" --container-name webconfig --name web.config_$version --overwrite

    # Rename the file Web.zip to Portalaks.zip and version to versionaks
    Write-Host "Rename the file Web.zip to Portalaks.zip and version to versionaks"

    # Upload to the specific container
    Write-Host "Upload the files Portalaks.zip and versionaks to the correct blob container"
    az storage blob upload --connection-string "$env:webconfigStorageAccount" --type block --file "$env:Build_SourcesDirectory\Web.zip" --container-name productionportal --name Portalaks.zip --overwrite
    az storage blob upload --connection-string "$env:webconfigStorageAccount" --type block --file "$env:Build_SourcesDirectory\version" --container-name productionportal --name versionaks --overwrite
} else {
    Write-Host "Web.zip not found. Skipping the script."
}