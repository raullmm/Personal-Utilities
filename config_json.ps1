$version = Get-Content -Path "$env:Build_SourcesDirectory/version"  
          
$jsonBody = @{
  UpdateContainerInstanceviaPipeline = "True"
  PortalID = "877"
  WebAppName = "Mavim-nl-scalingdta"
  Webconfigversion = $version
  ForceFunction = "True"
  RedeployApp = "True"
} | ConvertTo-Json