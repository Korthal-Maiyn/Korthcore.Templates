# PSScriptAnalyzer Settings for KXC.EnterpriseAccessModel
# Referenced by: .vscode/settings.json and azure-pipelines/jobs/tests.yaml
@{
    Severity     = @('Error', 'Warning')
    ExcludeRules = @(
        # Allow backtick line continuation in pipeline contexts
        'PSAvoidTrailingWhitespace'
    )
    IncludeRules = @(
        'PSAvoidUsingCmdletAliases',
        'PSAvoidUsingPositionalParameters',
        'PSAvoidUsingWriteHost',
        'PSMissingModuleManifestField',
        'PSPlaceOpenBrace',
        'PSPlaceCloseBrace',
        'PSProvideCommentHelp',
        'PSReservedCmdletChar',
        'PSReservedParams',
        'PSShouldProcess',
        'PSUseApprovedVerbs',
        'PSUseBOMForUnicodeEncodedFile',
        'PSUseCmdletCorrectly',
        'PSUseConsistentIndentation',
        'PSUseConsistentWhitespace',
        'PSUseCorrectCasing',
        'PSUseDeclaredVarsMoreThanAssignments',
        'PSUsePSCredentialType',
        'PSUseToExportFieldsInManifest'
    )
}