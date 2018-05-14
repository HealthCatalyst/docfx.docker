docker pull hcdocs/docfx:latest
npm install
docker run -v %cd%:c:/docs -p 8080:8080 -m 2GB hcdocs/docfx:latest docfx build c:/docs/docfx.json
cd _site
start chrome --new-window "http://localhost:8080" && docfx serve
