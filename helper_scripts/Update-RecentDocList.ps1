$docsPath = (Get-Item $PSScriptRoot).Parent.FullName + "\docs"
$docs = Get-ChildItem $docsPath -Recurse -Filter "*.md"
$recentDocs = $docs | ForEach-Object {
    $_ | Add-Member -NotePropertyName "LastCommitTime" -NotePropertyValue (
        [datetime]::Parse((git log -1 --format="%ci" -- $_.FullName 2>$null))
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
    }
}
$output | ConvertTo-Json | Out-File -FilePath "$((Get-Item $PSScriptRoot).Parent.FullName)\src\pages\recentDocs.json" -Encoding UTF8