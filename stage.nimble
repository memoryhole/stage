# Package

version       = "0.1.0"
author        = "bung87"
description   = "nim tasks apply to git hooks"
license       = "MIT"
srcDir        = "src"
bin = @["stage"]


# Dependencies

requires "nim >= 1.3.3"
requires "shell"
requires "cligen"

task debug, "Builds":
  exec "nim c -o:stage src/stage"

let sh = """
cat << EOF > .git/hooks/pre-commit
#!/bin/sh
if stage checkError;then
    stage fixStyle
else
    exit 1
fi
EOF
chmod +x .git/hooks/pre-commit
"""
exec sh