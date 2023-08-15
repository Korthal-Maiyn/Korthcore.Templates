<#
    .SYNOPSIS
    Converts inputStrings to Latin Characters.

    .DESCRIPTION
    Ensures that strings that have been provided are normalised by converting any Diacritic characters to standard English (Latin) characters.

    .EXAMPLE
    PS C:\>$FirstName = "Chrîstophèr"
    PS C:\>(Convert-ToLatinCharacter $FirstName)

    Christopher

    .EXAMPLE
    PS C:\>$FirstName = "Chrîstophèr"
    PS C:\>$FirstName | Convert-ToLatinCharacter

    Christopher

    .INPUTS
    System.String. Convert-ToLatinCharacter accepts an inputString as a System.String. This may be pipelined as per Example #2.

    .OUTPUTS
    System.String. Convert-ToLatinCharacter returns a normalised string.

#>
function Convert-ToLatinCharacter {
    param(
        [Parameter(Mandatory = $true,
        HelpMessage = "Specifies the inputString to be converted to Latin Characters.",
        ValueFromPipeline = $true)]
        [string[]]
        $inputString
    )

    process
    {
        [Text.Encoding]::ASCII.GetString([Text.Encoding]::GetEncoding("Cyrillic").GetBytes($inputString))
    }
}