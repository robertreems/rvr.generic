function Get-MyPublicIP {

    <#
    .SYNOPSIS
        Returns the the current public IP-address.
    .DESCRIPTION
        Returns the current public IP-address ([System.Net.IPAddress]).
    .LINK
        Specify a URI to a help page, this will show when Get-Help -Online is used.
    .EXAMPLE
        Get-MyPublicIP
        Returns:
            AddressFamily      : InterNetwork
            ScopeId            :
            IsIPv6Multicast    : False
            IsIPv6LinkLocal    : False
            IsIPv6SiteLocal    : False
            IsIPv6Teredo       : False
            IsIPv6UniqueLocal  : False
            IsIPv4MappedToIPv6 : False
            Address            : 3584594005
            IPAddressToString  : 85.144.168.213
    #>

    $ErrorActionPreference = 'Stop'
    [System.Uri]$url = "https://api.ipify.org"


    $request = Invoke-WebRequest -Uri $url
    $publicIP = [System.Net.IPAddress]::Parse($request.Content)

    return $publicIP
}