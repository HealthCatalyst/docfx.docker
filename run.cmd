git clone https://github.com/HealthCatalyst/docfx.docker.git update
move update\run-me.cmd .
move update\rebuild.cmd .
move update\executions.cmd .
rmdir /s /q update
executions.cmd