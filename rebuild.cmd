docker run -v %cd%:c:/docs -p 8080:8080 hcdocs/docfx:latest docfx build c:/docs/docfx.json
cd _site
start chrome --new-window "http://localhost:8080" && docfx serve