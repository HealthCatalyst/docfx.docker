git clone https://github.com/HealthCatalyst/docfx.docker.git update
move /y update\run.cmd .
move /y update\rebuild.cmd .
move /y update\executions.cmd .
rmdir /s /q update
executions.cmd