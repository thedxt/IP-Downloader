# Azure IP filter and downloader script v1.0
Grabs the JSON file for the Azure IP Ranges and Service Tags – Public Cloud.

Script allows for flitering and downloads the ips into one big file it also makes a file just for IPv4 and IPv6

The uri from microsoft will need to be replaced as that may change (they update the file weekly) you can grab the direct json link here by download the file directly https://www.microsoft.com/en-us/download/details.aspx?id=56519

## How to use
* make sure C:\temp exists or change the location under save location
* change your region filter as needed to suit your needs
* in download the JSON file from MS replace the uri in from MS when they update the file to keep it as updated as possible
* the filter includes null regions as some of the data doesn't have a region

## known issues
* C:\temp needs to exist
