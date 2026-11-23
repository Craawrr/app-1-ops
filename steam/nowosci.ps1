
$ErrorActionPreference = "Stop"

$konfiguracja = Get-Content -LiteralPath "./steam/gra.json" -Raw
$gra = $konfiguracja | ConvertFrom-Json

$url = "https://api.steampowered.com/ISteamNews/GetNewsForApp/v2/?appid=$($gra.appid)&count=1&maxlength=300&feeds=steam_community_announcements"

$response = Invoke-RestMethod -Uri $url -UseBasicParsing -TimeoutSec 20

$news = $response.appnews.newsitems[0]

Write-Host "Gra: $($gra.nazwa)"
Write-Host "Tytul komunikatu: $($news.title)"
Write-Host "Link do komunikatu: $($news.url)"
