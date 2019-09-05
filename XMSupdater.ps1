function CompareVersion ($onlineVersion, $chocoVersion){
    if ($onlineVersion -gt $chocoVersion) {
        return $true;
    }
    return $false;
}

function NuspecFile ($xmsVersion, $onlineVersion){
    $filetext = ""

    if ($xmsVersion -eq "gms") {
            $filetext = @"
<?xml version="1.0"?>
<package xmlns="http://schemas.microsoft.com/packaging/2011/08/nuspec.xsd">
  <metadata>
    <id>gms</id>
    <version>$onlineVersion</version>
    <title>Groundwater Modeling System (GMS) Software</title>
    <authors>Aquaveo</authors>
    <owners>kylebaker</owners>
    <licenseUrl>http://aquaveo.com/end-user-license-agreement</licenseUrl>
    <projectUrl>http://aquaveo.com/software/gms-groundwater-modeling-system-introduction</projectUrl>
    <iconUrl>https://cdn.jsdelivr.net/gh/kylebaker/AquaveoChocolateyPackages@master/icons/gms-icon.png</iconUrl>
    <requireLicenseAcceptance>false</requireLicenseAcceptance>
    <description>### A valid license from Aquaveo is required to use this software

        ###Speed up and simplify model building with the conceptual model approach in GMS
       We pioneered conceptual modeling and have refined it over many years. That's why GMS is the quickest and most intuitive groundwater modeling interface available. Construct a high level representation of the model using familiar GIS objects: points, arcs and polygons and easily update the model as needed.</description>
    <summary>Groundwater and subsurface simulations in a 3D environment.</summary>
    <copyright>2019 Aquaveo, LLC</copyright>
    <tags>wms aquaveo trial</tags>
    <bugTrackerUrl>https://bugs.aquaveo.com</bugTrackerUrl>
  </metadata>
 </package>
"@
    }
    if ($xmsVersion -eq "sms") {
        $filetext = @"
<?xml version="1.0"?>
<package xmlns="http://schemas.microsoft.com/packaging/2011/08/nuspec.xsd">
  <metadata>
    <id>sms</id>
    <version>$onlineVersion</version>
    <title>Surface-water Modeling System (SMS) Software</title>
    <authors>Aquaveo</authors>
    <owners>kylebaker</owners>
    <licenseUrl>http://aquaveo.com/end-user-license-agreement</licenseUrl>
    <projectUrl>http://aquaveo.com/software/sms-surface-water-modeling-system-introduction</projectUrl>
    <iconUrl>https://cdn.jsdelivr.net/gh/kylebaker/AquaveoChocolateyPackages@master/icons/sms-icon.png</iconUrl>
    <requireLicenseAcceptance>false</requireLicenseAcceptance>
    <description>### A valid license from Aquaveo is required to use this software

        ### Flexible modeling approaches
Aquaveo pioneered the conceptual model approach. Build a conceptual model in SMS by constructing a high level representation of the model using familiar GIS objects: points, arcs and polygons. Work with large, complex models in a simple and efficient manner by using the conceptual modeling approach and easily update or change the model as needed.

SMS also has powerful tools to build meshes and grids.</description>
    <summary>Access a full range of coastal and riverine solutions with SMS - the leading application for surface-water modeling</summary>
    <copyright>2019 Aquaveo, LLC</copyright>
    <tags>sms aquaveo trial</tags>
    <bugTrackerUrl>https://bugs.aquaveo.com</bugTrackerUrl>
  </metadata>
</package>
"@
    }
    if ($xmsVersion -eq "wms") {
        $filetext = @"
<?xml version="1.0"?>
<package xmlns="http://schemas.microsoft.com/packaging/2011/08/nuspec.xsd">
  <metadata>
    <id>wms</id>
    <version>$onlineVersion</version>
    <title>Watershed Modeling System (WMS) Software</title>
    <authors>Aquaveo</authors>
    <owners>kylebaker</owners>
    <licenseUrl>http://aquaveo.com/end-user-license-agreement</licenseUrl>
    <projectUrl>http://aquaveo.com/software/wms-watershed-modeling-system-introduction</projectUrl>
    <iconUrl>https://cdn.jsdelivr.net/gh/kylebaker/AquaveoChocolateyPackages@master/icons/wms-icon.png</iconUrl>
    <requireLicenseAcceptance>false</requireLicenseAcceptance>
    <description>### A valid license from Aquaveo is required to use this software

        ###The complete all-in-one watershed solution
* Web-based data acquisition tools
* Terrain data import and editing tools
* Automated watershed delineation and hydrologic modeling
* Support for the most industry standard hydrologic models
* Step-by-step hydrologic modeling wizard
* Hydraulic modeling and floodplain mapping
* Storm drain modeling
* 2D (Distributed) Hydrology
* Integration with FHWA hydraulic calculation software
* Export WMS animations to GoogleTM Earth</description>
    <summary>All-in-one hydrologic and hydraulic solutions and pipe network tools.</summary>
    <copyright>2019 Aquaveo, LLC</copyright>
    <tags>wms aquaveo trial</tags>
    <bugTrackerUrl>https://bugs.aquaveo.com</bugTrackerUrl>
  </metadata>
</package>
"@
    }
    out-file -filepath .\$xmsVersion.nuspec -inputobject $filetext
}

function ChocolateyInstallFile($xmsVersion, $hash, $link) {
    $filetext = @"
`$ErrorActionPreference = 'Stop'

`$packageName    = '$xmsVersion'
`$fileType       = 'exe'
`$url64          = '$link'
`$checksum64     = '$hash'
`$checksumType64 = 'sha256'
`$silentArgs     = "/qn"
`$validExitCodes = @(0)

`$packageArgs = @{
  packageName     = `$packageName
  fileType        = `$fileType
  url64           = `$url64
  checksum64      = `$checksum64
  checksumType64  = `$checksumType64
  silentArgs      = `$silentArgs
  validExitCodes  = `$validExitCodes
}

Install-ChocolateyPackage @packageArgs
"@

out-file -filepath .\chocolateyinstall.ps1 -inputobject $filetext

}

function UpdatePackage ($xmsVersion, $onlineVersion, $link) {
    Write-Host "$xmsVersion needs to be updated"

    Import-Module BitsTransfer
    Write-Host "Downloading file to get the hash"
    Start-BitsTransfer -Source $link -Destination .\xms.exe
    Write-Host "File has been downloaded"
    $rawHash = Get-FileHash .\xms.exe
    $hash = $rawHash.Hash
    rm xms.exe
    Write-Host "File has been removed"

    new-item -Name "$xmsVersion" -ItemType directory
    cd $xmsVersion

    NuspecFile $xmsVersion $onlineVersion;

    new-item -Name "tools" -ItemType directory
    cd tools

    ChocolateyInstallFile $xmsVersion $hash $link;

    cd ..
    cpack
    cd ..
}


function FindVersions($xmsVersion, $NuspecFile){

    $baseURL    = "https://aquaveo.com/downloads-"
    Write-Host "Checking if $xmsVersion needs to be updated" -ForegroundColor Green
    $fullURL = $baseURL + $xmsVersion
    $HttpContent = Invoke-WebRequest -URI $fullURL
    $firstLink = $HttpContent.Links | Where-Object {$_.href -like "*downloads.aquaveo.com*"} | Select-Object -First 1
    $link = $firstLink."href" -replace ";","&"

    $versionString = $firstLink."innerHTML" -replace '\([^\)]+\)', '' -replace "[^0-9.]", "" -replace " ", ""
    $onlineVersion = [version]$versionString

    $output = choco info $xmsVersion
    $output = $output -like "$xmsVersion*"
    $output = $output -replace '\([^\)]+\)', '' -replace "[^0-9.]", "" -replace " ", "" | Out-String
    $chocoVersion = [version]$output

    $onlineVersion = New-Object -TypeName System.Version -ArgumentList $onlineVersion.Major,$onlineVersion.Minor,$onlineVersion.Build
    $chocoVersion = New-Object -TypeName System.Version -ArgumentList $chocoVersion.Major,$chocoVersion.Minor,$chocoVersion.Build

    Write-Host $onlineVersion -ForegroundColor Green
    Write-Host $chocoVersion -ForegroundColor DarkGreen
    Write-Host ""

    $result = CompareVersion $onlineVersion $chocoVersion;

    if ($result) {
        UpdatePackage $xmsVersion $onlineVersion $link;
    }
    else {
        Write-Host "$xmsVersion is up  to date" -ForegroundColor Green
        Write-Host "==================" -ForegroundColor Red
        Write-Host ""
    }   
}

$xmsVersion = "gms"

FindVersions $xmsVersion;

$xmsVersion = "sms"

FindVersions $xmsVersion;

$xmsVersion = "wms"

FindVersions $xmsVersion;