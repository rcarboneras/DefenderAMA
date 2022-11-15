

<#[
   {
      "policyDefinitionId": "/providers/Microsoft.Authorization/policyDefinitions/2a0e14a6-b0a6-4fab-991a-187a4f81c498",
      "parameters": {
         "tagName": {
            "value": "Business Unit"
         },
         "tagValue": {
            "value": "Finance"
         }
      }
   },
   {
      "policyDefinitionId": "/providers/Microsoft.Authorization/policyDefinitions/464dbb85-3d5f-4a1d-bb09-95a9b5dd19cf"
   }
]#>

$PolicySetObject = Get-Content ".\initiatives\Configure_machines_to_create_the_default_Microsoft_Defender_for_Cloud_pipeline_using_Azure_Monitor_Agent\policyset.json" | ConvertFrom-Json

$PolicyDefinition = $PolicySetObject.properties.policyDefinitions | ConvertTo-Json -Depth 10
$PolicyParameters = $PolicySetObject.properties.parameters | ConvertTo-Json -Depth 10
$PolicyMetadata = $PolicySetObject.properties.metadata | ConvertTo-Json -Depth 10
$PolicyDescription = $PolicySetObject.properties.description
$PolicyDisplayName = $PolicySetObject.properties.displayName

New-AzPolicySetDefinition -Name 'WDCAgentsPolicySetDefinition'`
-PolicyDefinition $PolicyDefinition `
-Parameter $PolicyParameters `
-Metadata $PolicyMetadata `
-Description $PolicyDescription `
-DisplayName $PolicyDisplayName


