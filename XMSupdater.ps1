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
    <description>
# GMS - Groundwater Modeling System

## Speed up &amp; simplify model building with the conceptual model approach in GMS

We pioneered conceptual modeling and have refined it over many years. That's why GMS is the quickest and most 
intuitive groundwater modeling interface available. Construct a high level representation of the model using 
familiar GIS objects: points, arcs and polygons and easily update the model as needed. Conceptual modeling in 
GMS [starting at $2,400](https://aquaveo.com/software/gms-pricing) (including 3D visualization)

For models with simple geometry and boundary conditions, use the grid approach and edit values directly in 
the grid.

---
## 3D visualization optimized for performance

GMS is the most advanced software system available for performing groundwater simulations in a three-dimensional 
environment.


* Interact with models in true 3D
* Optimized OpenGL graphics for improved hardware rendering
* Create photo-realistic renderings
* Generate animations for PowerPoint or web presentations
* Drape images over the model and control the opacity
* Annotations – Add north arrows, scale bars, reference images, company logos, and more

---
## Import a variety of data formats &amp; imagery

Models require data from many different sources. That’s why GMS is built to easily import numerous file types:

* Raster images including georeference and projection support
* Topographical maps &amp; elevation data
* Borehole data including stratigraphy and geophysical data
* Native MODFLOW files
* MODFLOW files from Visual MODFLOW, Groundwater Vistas and PM Win
* Web data services such as TerraServer
* ArcGIS geodatabases and shapefiles
* CAD files including .dwg, .dgn, and .dxf formats
* Worldwide projection support including Cartesian and Geographic Systems
* File Import wizard for delimited text files and spreadsheets

---
## Advanced subsurface characterization

From cross-section editing to advanced probability statistics, GMS offers unparalleled subsurface modeling tools.

* Generate iso-surfaces from 3D data to visualize plumes
* Cut cross-sections anywhere through 3D data
* 2D &amp; 3D geostatistics – Kriging, IDW and Natural Neighbor
* Robust and fast algorithms to create solids from horizons

---
## Software from an industry leader

GMS is developed by Aquaveo, an engineering services company with many years of experience developing groundwater modeling solutions.

* Step-by-step tutorials and how-to videos
* Online community forum and product documentation
* Phone and email technical support
* Regularly scheduled training courses taught by expert modelers
* On-site training available
* Professional consulting services
    </description>
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
    <description>
# SMS 13.0 - The Complete Surface-water Solution

## Flexible modeling approaches

Aquaveo pioneered the conceptual model approach. Build a conceptual model in SMS by constructing a high level representation of the model using familiar GIS objects: points, arcs and polygons. Work with large, complex models in a simple and efficient manner by using the conceptual modeling approach and easily update or change the model as needed.


SMS also has powerful tools to build meshes and grids.

---
## 3D visualization optimized for performance

SMS is the most advanced software system available for performing surface-water simulations in a three-dimensional environment.


* Interact with models in true 3D
* Optimized OpenGL graphics for improved hardware rendering
* Create photo-realistic renderings
* Generate animations for PowerPoint or web presentations
* Drape images over the model and control the opacity
* Annotations – Add north arrows, scale bars, reference images, company logos, and more

---
## Import a variety of data formats &amp; imagery

Models require data from many different sources. That’s why SMS is built to easily import numerous file types:

* Raster images including georeference and projection support
* Topographical maps &amp; elevation data
* Borehole data including stratigraphy and geophysical data
* Native MODFLOW files
* MODFLOW files from Visual MODFLOW, Groundwater Vistas and PM Win
* Web data services such as TerraServer
* ArcGIS geodatabases and shapefiles
* CAD files including .dwg, .dgn, and .dxf formats
* Worldwide projection support including Cartesian and Geographic Systems
* File Import wizard for delimited text files and spreadsheets

---
## Advanced subsurface characterization

From cross-section editing to advanced probability statistics, GMS offers unparalleled subsurface modeling tools.

* Generate iso-surfaces from 3D data to visualize plumes
* Cut cross-sections anywhere through 3D data
* 2D &amp; 3D geostatistics – Kriging, IDW and Natural Neighbor
* Robust and fast algorithms to create solids from horizons

---
## Software from an Industry Leader

SMS is developed by Aquaveo, an engineering services company with many years of experience developing groundwater modeling solutions.

* Step-by-step tutorials and how-to videos
* Online community forum and product documentation
* Phone and email technical support
* Regularly scheduled training courses taught by expert modelers
* On-site training available
* Professional consulting services
</description>
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
    <description>
# WMS - The All-in-one Watershed Solution

## Flexible modeling approaches

The complete all-in-one watershed solution

* GIS Tools
* Web-based data acquisition tools
* Terrain data import and editing tools
* Automated watershed delineation &amp; hydrologic modeling
* Support for the most industry standard hydrologic models
* Step-by-step hydrologic modeling wizard
* Hydraulic modeling &amp; floodplain mapping
* Storm drain modeling
* 2D (Distributed) Hydrology
* Integration with FHWA hydraulic calculation software
* Export WMS animations to GoogleTM Earth

---
## Automated watershed delineation &amp; hydrologic modeling

* Automatically delineate a watershed and sub-basins using digital terrain data
* Automatically compute geometric basin data such as area, slope, mean elevation, maximum flow distance and more
* With a small amount of input, compute hydrologic basin data such as time of concentration, curve number, and infiltration parameters
* Industry standard equations for computing sub-basin lag times and times of concentration are included with WMS
* Add any number of interior outlet points and let WMS subdivide the watershed automatically
* Manipulate stream networks to represent man-made features or proposed changes to the watershed
* Override derived basin boundaries to match your knowledge of the watershed


---
## Support for most industry standard hydrologic models

* A license of WMS Floodplain or greater includes an interface for the following industry standard hydrologic models:
  * HEC-1
  * HEC-HMS
  * TR-20
  * TR-55
  * Rational Method
  * MODRAT
  * OC (Orange County, California) Rational
  * OC Hydrographic
  * HSPF
  * National Streamflow Statistics
  * Convert and compare the results of a watershed developed for one model with any of the other models supported in WMS
  * Read and compare observed hydrographs with computed hydrographs

---
## Hydraulic modeling &amp; floodplain mapping

* Define a stream centerline and bank stations
* Define cross section locations
* Automatically cut cross sections and derive Manning's roughness values from elevation and ground material data
* Export cross sections to the HEC-RAS or Simplified Dam Break hydraulic models
* Run the hydraulic model and read the water elevations back into WMS
* Read water surface elevation data from a hydraulic model or manually input known water surface elevations
* Create flood extents and flood depth maps using digital terrain data and water surface elevation data points
* Link the peak flow or complete hydrograph from any of the WMS-supported hydrologic models to an HEC-RAS hydraulic model

---
## Storm drain modeling

* Draw a storm drain network or import a network from GIS
* Compute elevations, lengths, and slopes of pipes from underlying elevation data
* Link the storm drain network to your hydrologic model data
* Export the hydrologic model data and the storm drain network to EPA-SWMM or XP-SWMM
* Import existing EPA-SWMM or XP-SWMM files into WMS

---
## 2D (Distributed) hydrology

* WMS supports 2D models:
  * The US Army Corps of Engineers (USACE) GSSHA model
  * The HMS version of the quasi-distributed MODClark method
* Flood forecasting (depth and velocity over entire 2D domain)
* Thunderstorm (localized rainfall) flood analysis
* Surface ponding and infiltration analysis
* Wetland modeling
* Land use change impact modeling
* Groundwater/surface-water interaction modeling
* Sediment and contaminant modeling

---
## Import what you need

* USGS DEMs - download and use any format of DEM from the USGS
* USGS NED data - seamless elevation data can be downloaded and read into WMS
* ArcGIS Raster (ASCII format) - read elevation or attribute data in gridded format from ArcGIS
* ESRI Shape files - read all shapes and attributes into WMS
* DXF and DWG CAD files - WMS now supports the latest versions of DXF and DWG
* TIFF, JPEG image files - /images along with geo-referencing information can be read by WMS
* Any data supported by ArcGIS can be read into WMS (ArcGIS license required, compatible with ArcGIS 10.0)

---
## Software from an Industry Leader

* Step-by-step tutorials and how-to videos
* Online community forum and product documentation
* Phone and email technical support
* Regularly scheduled training courses taught by expert modelers
* On-site training available
* Professional consulting services
    </description>
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