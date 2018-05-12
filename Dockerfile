FROM microsoft/nanoserver
ENV chocolateyUseWindowsCompression=false

FROM stefanscherer/chocolatey
RUN choco install -y php
RUN php --version

RUN choco install \
    git  \
    docker \
    docfx \
    wkhtmltopdf \
    --confirm \
    --limit-output \
    --timeout 216000

CMD ["Start.cmd"]