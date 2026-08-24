$diagnosticFile = ".\Model\output\Diagnostics.csv"
$outputFile = ".\Model\output\Absolute_PBIAS.txt"

if (-not (Test-Path $diagnosticFile)) {
    Write-Host "ERROR: Diagnostics file not found:"
    Write-Host $diagnosticFile
    exit 1
}

$data = Import-Csv $diagnosticFile

if ($data.Count -eq 0) {
    Write-Host "ERROR: Diagnostics file is empty."
    exit 1
}

$pbiasColumn = $data[0].PSObject.Properties.Name |
    Where-Object { $_ -match "PBIAS|PCT_BIAS|PERCENT_BIAS" } |
    Select-Object -First 1

if (-not $pbiasColumn) {
    Write-Host "ERROR: PBIAS column was not found."
    Write-Host "Available columns:"
    $data[0].PSObject.Properties.Name
    exit 1
}

$rawPBIAS = $data[-1].$pbiasColumn
$pbias = 0.0

$success = [double]::TryParse(
    $rawPBIAS,
    [System.Globalization.NumberStyles]::Float,
    [System.Globalization.CultureInfo]::InvariantCulture,
    [ref]$pbias
)

if (-not $success) {
    Write-Host "ERROR: Could not convert PBIAS to a number."
    Write-Host "Raw value: $rawPBIAS"
    exit 1
}

$absPBIAS = [Math]::Abs($pbias)

$absPBIAS.ToString(
    "G17",
    [System.Globalization.CultureInfo]::InvariantCulture
) | Set-Content -Encoding ASCII $outputFile

Write-Host "Signed PBIAS: $pbias"
Write-Host "Absolute PBIAS: $absPBIAS"
Write-Host "Created: $outputFile"

exit 0