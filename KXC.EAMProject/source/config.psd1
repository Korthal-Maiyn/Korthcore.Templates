# KXC.EnterpriseAccessModel — Environment Configuration
# This file is the single source of truth for environment-specific settings.
# Never overwrite this file directly — each change requires a new CHG and git commit.
# New CHG = new commit. The ChangeReference here must match the commit footer.
@{
    # Audit
    ChangeReference    = '<%=$PLASTER_PARAM_ChangeReference%>'
    Environment        = '<%=$PLASTER_PARAM_Environment%>'    # PreProd | Prod

    # Scope — source identifiers to target
    Scopes             = @('c1', 'c2')

    # SailPoint
    OrgUrl             = 'https://<tenant>.identitynow.com'

    # Provisioning — toggled via change, not script modification
    EnableProvisioning = $false

    # Azure Key Vault — secret names only, never values
    KeyVaultName       = 'kv-eam-<environment>'
    SecretNames        = @{
        ClientId     = 'sp-sailpoint-clientid'
        ClientSecret = 'sp-sailpoint-clientsecret'
    }
}