$ModuleRoot = $env:BHModulePath
$ModuleName = $env:BHProjectName
$ModulePath = $env:BHPSModuleManifest
Remove-Module -Name $ModuleName -ErrorAction 'SilentlyContinue'
Import-Module $ModulePath -Force

InModuleScope $ModuleName {
    BeforeAll {
        # Load Private function
        . "$ModuleRoot\Private\ConvertTo-LatinCharacter.ps1"
    }

    Describe -Tags ('Unit') "Unit Tests for ConvertTo-LatinCharacter" {
        # Run tests based upon the Examples from the Function Docs
        It "Returns <expected> from inputString <inputString> as a Parameter" -TestCases @(
            #Test with string containing Diacritic characters.
            @{ inputString = "Chrîstophèr"; Expected = "Christopher"}
            #Test with string containing Latin characters only.
            @{ inputString = "Christopher"; Expected = "Christopher"}
        ) {
            (ConvertTo-LatinCharacter $inputString) | Should -Be $expected
        }
        # Run tests based upon the Examples from the Function Docs
        It "Returns <expected> from inputString <inputString> via Pipeline" -TestCases @(
            #Test with string containing Diacritic characters.
            @{ inputString = "Chrîstophèr"; Expected = "Christopher"}
            #Test with string containing Latin characters only.
            @{ inputString = "Christopher"; Expected = "Christopher"}
        ) {
            ($inputString | ConvertTo-LatinCharacter) | Should -Be $expected
        }
    } # Describe Unit Tests for ConvertTo-LatinCharacter
}