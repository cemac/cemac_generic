# ARC
A collection of one liner commands for arc usage


### Keep Script 
This finds all user owned files and updates them. Slow but effective. 



- `find /nobackup -user ${USER} -type f -exec touch -ah {} \; `

You can add `2>/dev/null` if you want to ignore all permission denied errors.
