param (
    [string]$token,
    [string]$imageTag,
    [string]$imageRepository
)

# Your existing script code here
$jsonBody = @"
{
    "resources": {
        "repositories": {
            "self": {
                "refName": "testing-scalingdta"
            }
        }
    },
    "variables": {
        "VERSIONNUMBER": {
            "isSecret": false,
            "value": "$imageTag"
        },
        "customer": {
            "isSecret": false,
            "value": "scalingdta"
        },
        "SCALESET": {
            "isSecret": false,
            "value": "3"
        },
        "IMAGENAME": {
            "isSecret": false,
            "value": "$imageRepository"
        }
    }
}
"@

# Rest of your script remains the same
$headers = @{
    Authorization = "Basic " + [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(":$token"))
    "Content-Type" = "application/json"
}

$response = Invoke-RestMethod -Uri "$(URL_CONFIGMAPUPDATER)" -Method Post -Headers $headers -Body $jsonBody

$response