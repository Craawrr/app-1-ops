
$ErrorActionPreference = "Stop"

$konfiguracja = Get-Content -LiteralPath "./steam/gra.json" -Raw
$gra = $konfiguracja | ConvertFrom-Json

$parametry = @{
    appid = $gra.appid
    languages = @('all')
    num_per_page = 1
    purchase_type = 1
}

$parametry = $parametry | ConvertTo-Json -Compress

$response = Invoke-RestMethod `
    -Uri "https://api.steampowered.com/IUserReviewsService/GetAppReviews/v1/" `
    -Body @{ input_json = $parametry } `
    -UseBasicParsing `
    -TimeoutSec 20

Write-Host "Gra: $($gra.nazwa)"
Write-Host "Ocena graczy: $($response.response.query_summary.review_score_desc)"
Write-Host "Liczba recenzji: $($response.response.query_summary.total_reviews)"
