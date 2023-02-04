# Pwsh-Enumerate
Pwsh-Enumerate It is a script that allows you to extract the labels from a website, through webscrapping, also perform a scan of common ports, as an added value for the identification of services and database managers.

## Requirements::
```sh
Install-PackageProvider -Name NuGet -Force
```

## Install package HTMLAgilityPack online:
```sh
Install-Package HtmlAgilityPack.CssSelectors.NetCore -Force
```

## Install package  HTMLAgilityPack offline:
```sh

IEX (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/pldmgg/misc-powershell/master/MyFunctions/PowerShellCore_Compatible/Install-HTMLAgilityPack.ps1')        
Install-HTMLAgilityPack -NuGetPkgDownloadPath "$HOME\Downloads\HTMLAgilityPack\HTMLAgilityPack.zip"                                                                                        
```

## Enable TLS requests.
```sh

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
```

##  Run Web Scrapping and port scanning:
```sh
.\scrap.ps1 https://www.example.com/
```

![image](https://user-images.githubusercontent.com/66162160/216781020-2019473b-65d4-4566-9827-b20c0b5e7a00.png)

![image](https://user-images.githubusercontent.com/66162160/216781035-0bef8c2c-4355-40c7-9143-afd049308576.png)
