# Azure IP filter and downloader script v1.1.0
# Author: Daniel Keer
# Author URI: https://thedxt.ca
# Script URI: https://github.com/thedxt/IP-Downloader
#
# DESCRIPTION
#
# grabs the JSON file for the Azure IP Ranges and Service Tags – Public Cloud
# script allows for flitering and downloads the ips into one big file
# it also makes a file just for IPv4 and IPv6
# the uri from MS will need to be replaced as that may change
# the uri is here https://www.microsoft.com/en-us/download/details.aspx?id=56519
#
# change the variables as needed

#save location
$exportlocation = "C:\temp\"

#region filter
$regionFilter = "canada"

#grab URI from txt file
$DLURI = Invoke-WebRequest -uri "https://raw.githubusercontent.com/thedxt/IP-Downloader/main/URIs/Azure-JSON-URI.txt"

#download the JSON file from MS
$MSjsonDL = Invoke-WebRequest -Uri $DLURI.Content

#getting date
$time = get-date -f yyyy_MMM_dd_hhmm_tt

#convert to PS object
$MSjsonOBJ = ConvertFrom-Json $MSjsonDL

#select the values
$properties = $MSjsonOBJ.values.properties

#filter to pick only specific regions and null for ones that dont have regions
$regions = $properties | where-object { $_.region -match $regionFilter -OR $_.region -eq ""}

#save files using reg ex to filter ipv4 and ipv6 to their own files if needed
$regions.addressPrefixes | out-file "$exportlocation\$($time)_filtered_region_$($regionFilter)_all_IPs.txt"

$regions.addressPrefixes -match '\.' | out-file "$exportlocation\$($time)_filtered_region_$($regionFilter)_v4_IPs.txt"

$regions.addressPrefixes -match '\:' | out-file "$exportlocation\$($time)_filtered_region_$($regionFilter)_v6_IPs.txt"
