$scriptPath = Split-Path $script:MyInvocation.MyCommand.Path

mkdir "$scriptPath/test/diskp"
mkdir "$scriptPath/test/disk1"
mkdir "$scriptPath/test/disk2"
mkdir "$scriptPath/test/oscontent"

$wslScriptPath = wsl wslpath -u "`"$scriptPath`""

docker run `
-v $wslScriptPath/test/snapraid.conf:/etc/snapraid.conf `
-v $wslScriptPath/test/oscontent:/mnt/oscontent `
-v $wslScriptPath/test/diskp:/mnt/diskp `
-v $wslScriptPath/test/disk1:/mnt/disk1 `
-v $wslScriptPath/test/disk2:/mnt/disk2 `
snapraid sync