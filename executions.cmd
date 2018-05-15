docker pull hcdocs/docfx:latest
call npm install
rmdir /s /q _site
rmdir /s /q docs-project-template
rmdir /s /q resources
rmdir /s /q templates
del package.json
del readme.md
git clone -b docker https://github.com/HealthCatalyst/docs-project-template.git
robocopy docs-project-template\resources resources /E /IS /MOVE
robocopy docs-project-template\templates templates /E /IS /MOVE
move /y docs-project-template\package.json .
move /y docs-project-template\readme.md .
timeout 2
rmdir /s /q docs-project-template
docker run -v %cd%:c:/docs -p 8080:8080 hcdocs/docfx:latest docfx build c:/docs/docfx.json
cd _site
start chrome --new-window "http://localhost:8080" && docfx serve
