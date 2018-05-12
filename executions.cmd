docker pull hcdocs/docfx:latest
rmdir _site
rmdir /s /q docs-project-template
rmdir /s /q resources
rmdir /s /q templates
del package.json
del readme.md
git clone -b docker https://github.com/HealthCatalyst/docs-project-template.git
move docs-project-template\resources .
move docs-project-template\templates .
move docs-project-template\package.json .
move docs-project-template\readme.md .
docker run -v %cd%:c:/docs -p 8080:8080 hcdocs/docfx:latest docfx build c:/docs/docfx.json
rmdir /s /q docs-project-template
cd _site
start chrome --new-window "http://localhost:8080" && docfx serve