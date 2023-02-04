Param (
   [Parameter(Mandatory=$True)]
   [string]$url
)

Write-Host "`nEnumerate Web Create By: Hernan Rodriguez`n"

Write-Host "`n------------ Web Scrapping ------------`n"
$baseUri = New-Object System.Uri($url)
$webClient = New-Object System.Net.WebClient
$webClient.Headers.Add('user-agent', [Microsoft.PowerShell.Commands.PSUserAgent]::FireFox)
$html = $webClient.DownloadString($url)
$htmlDoc = New-Object HtmlAgilityPack.HtmlDocument
$htmlDoc.LoadHtml($html)

$nodes = $htmlDoc.DocumentNode.SelectNodes("//a")

foreach ($node in $nodes) {
   $href = $node.GetAttributeValue("href", "")
   $linkUri = New-Object System.Uri($href, [System.UriKind]::RelativeOrAbsolute)
   if ($linkUri.IsAbsoluteUri -and $linkUri.Host -ne $baseUri.Host) {
      continue
   }

   Write-Host "$url$linkUri"
}
Write-Host "`n------------ Scanning Ports ------------`n"

[string]$url
[uri]$uri = New-Object System.Uri($url)
[string]$host = $uri.Host

[int[]]$commonPorts = @(20, 21, 22, 23, 25, 53, 80, 110, 123, 443, 465, 587, 993, 995, 1723, 3389, 5900, 8080, 8443, 8834, 10000, 27017, 49152, 49154, 49155, 49157,1433, 1521, 3306, 5432, 6379, 27017, 5984, 9042, 11211)
Write-Host "`n------------ Info Ports ------------
1433: SQL Server
1521: Oracle
3306: MySQL
5432: PostgreSQL
6379: Redis
27017: MongoDB
5984: CouchDB
9042: Cassandra
11211: Memcached `n"

foreach ($port in $commonPorts) {
   $socket = New-Object System.Net.Sockets.Socket(
      [System.Net.Sockets.AddressFamily]::InterNetwork,
      [System.Net.Sockets.SocketType]::Stream,
      [System.Net.Sockets.ProtocolType]::Tcp
   )
   $asyncResult = $socket.BeginConnect($host, $port, $null, $null)
   $waitHandle = $asyncResult.AsyncWaitHandle
   if ($waitHandle.WaitOne(1000, $false)) {
      Write-Host "Port $port is open"
   }
   else {
   }
   $socket.Close()

  
}
