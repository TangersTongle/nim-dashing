# Package

version       = "0.1.0"
author        = "Federico Ceratto"
description   = "Terminal dashboards for Nim"
license       = "LGPLv3"
srcDir        = "src"

# Dependencies

requires "nim >= 0.18.0"

bin       = @["dashing"]

task development_test, "Build for testing":
  exec("mkdir -p tests/bin")
  exec("nim c -r -d:testing --out:tests/bin/dashing src/dashing")

task development, "Build tests for dev":
  exec("mkdir -p bin")
  exec("nim c -r --out:bin/dashing src/dashing")

task debug, "Debug with gdb":
  exec("mkdir -p bin")
  exec("nim c --debugger:native --out:bin/dashing src/dashing")
  exec("gdb --quiet bin/dashing")
