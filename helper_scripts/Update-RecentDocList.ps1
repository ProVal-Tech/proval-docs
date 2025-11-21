$docsPath = (Get-Item $PSScriptRoot).Parent.FullName + "\docs"
$docs = Get-ChildItem $docsPath -Recurse -Filter "*.md"
$recentDocs = $docs | ForEach-Object {
    $parentPath = Split-Path $_.FullName
    if ((Get-Item $parentPath).Name -in ("docs", "unsorted")) {
        return
    }
    if ((Get-Item (Split-Path $parentPath)).Name -ne "docs") {
        $parentPath = Split-Path $parentPath
        while ((Get-Item (Split-Path $parentPath)).Name -ne "docs") {
            $parentPath = Split-Path $parentPath
        }
    }
    $parentName = (Get-Item $parentPath).Name
    $_ | `
        Add-Member -NotePropertyName "LastCommitTime" -NotePropertyValue (
        [datetime]::Parse((git log -1 --format="%ci" -- $_.FullName 2>$null))
    ) -PassThru | `
        Add-Member -NotePropertyName "Category" -NotePropertyValue $parentName -PassThru | `
        Add-Member -NotePropertyName "GitAddedTime" -NotePropertyValue (
        [datetime]::Parse(((git log --diff-filter=A --format="%ci" -- $_.FullName 2>$null) -split ("`n") | Select-Object -Last 1))
    ) -PassThru
} | Where-Object { $_.LastCommitTime -ne $null } | Sort-Object LastCommitTime -Descending
$output = foreach ($doc in $recentDocs) {
    $content = Get-Content $doc.FullName
    $title = $content | Select-String -Pattern "^title: (`"|')(.*)(`"|')"
    $slug = $content | Select-String -Pattern "^slug: (`"|')?(.*)(`"|')?"
    [PSCustomObject]@{
        Title      = if ($title) { $title.Matches[0].Groups[2].Value } else { "No Title" }
        Slug       = if ($slug) { $slug.Matches[0].Groups[2].Value } else { $doc.BaseName }
        LastCommit = $doc.LastCommitTime
        Category   = $doc.Category
        GitAdded   = $doc.GitAddedTime
    }
}
$output | Where-Object { $_.Slug -match "[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}" -and $_.Title.Trim() -ne "" } | ConvertTo-Json | Out-File -FilePath "$((Get-Item $PSScriptRoot).Parent.FullName)\static\api\recentDocs.json" -Encoding UTF8