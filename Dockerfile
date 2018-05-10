# Copyright (C) Microsoft Corporation. All rights reserved.
# Licensed under the MIT license. See LICENSE.txt in the project root for license information.
FROM microsoft/nanoserver:10.0.14393.447
ENV chocolateyUseWindowsCompression=false

FROM stefanscherer/chocolatey
RUN choco install -y php
RUN php --version

RUN choco install \
    git  \
    docker \
    docfx \
    --confirm \
    --limit-output \
    --timeout 216000