@{
    # Defaults for all dependencies
    PSDependOptions  = @{
        Target     = 'CurrentUser'
        Parameters = @{
            # Use a local repository for offline support
            Repository         = 'PSGallery'
            SkipPublisherCheck = $true
        }
    }

    # Dependency Management modules
    # PackageManagement = '1.2.2'
    # PowerShellGet     = '2.0.1'

    # Common modules - These versions used are what has been tested against during Development.
    BuildHelpers     = '2.0.16'
    Pester           = '5.4.1'
    PlatyPS          = '0.14.2'
    psake            = '4.9.0'
    PSDeploy         = '1.0.5'
    PSScriptAnalyzer = '1.21.0'
}