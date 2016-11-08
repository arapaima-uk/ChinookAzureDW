$connectionString = $args[0]

Add-Type -Path 'DbUp.dll'
$scriptsPath = Join-Path -Path $PSScriptRoot -ChildPath "DWScripts.dll"
$scripts = [System.Reflection.Assembly]::LoadFrom($scriptsPath)
$dbUp = [DbUp.DeployChanges]::To
$dbUp = [SqlServerExtensions]::SqlDatabase($dbUp, "$connectionString")
$dbUp = [StandardExtensions]::WithScriptsEmbeddedInAssembly($dbUp, $scripts)
$dbUp = [SqlServerExtensions]::JournalToSqlTable($dbUp, 'DbUp', 'SchemaVersions')
$dbUp = [StandardExtensions]::LogToConsole($dbUp)
$upgradeResult = $dbUp.Build().PerformUpgrade()