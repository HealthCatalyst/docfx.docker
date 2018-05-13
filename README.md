# docfx.docker
A Windows Docker image that transforms Heath Catalyst documentation from Markdown to a website and PDFs with DocFx.

| For Windows | For Linux |
|-------------|-----------|
| https://hub.docker.com/r/hcdocs/docfx | Search https://hub.docker.com for `docfx`. |


# The purpose of this
## Let teams store documentation source files (and only source files) anywhere
The intent of the Docker image and the `run.cmd` file (sorry, no Linux version yet but on it's way) is to enable Health Catalyst teams to store *only* their markdown files, images, and a couple simple configuration files in any directory in any Git repo or storage location.

## Let teams build Health Catalyst-branded output without maintaining the mechanisms that do it
Docker containers and the `run.cmd` (when it's executed in the directory of documentation) build the team's documentation into a local preview of the HTML output and generate PDFs, both in Health Catalyst styling. This eliminates the need for a team to store and maintain the entire framework required to build them. Builds also complete more quickly.

# Prerequisites
- Git
- A directory of documentation that looks similar to this:
```
  root repo
  |-- `Docs`
  |    |-- `<articles>`
  |    |    |-- `guide-name`
  |    |    |    | -- `media` or `images`
  |    |    |    |     | image files
  |    |    |    | `*.md` files
  |    |    |    | `.toc.yml`
  |    |    | `.toc.yml`
  |    |    | `index.md`
  |    |    | `docfx.json`
```

### Download a starter project already in this structure
Open your command-line tool in the root of your repo and and enter `git clone https://github.com/HealthCatalyst/docs-project-template.git`. Rename the directory `docs-project-template` to `Docs`.

### Browse example files
https://github.com/HealthCatalyst/docs-project-template.

# First time ever
## Install Docker
| For Windows | For Linux |
|-------------|-----------|
| Download and install Docker for Windows. When the option is presented, choose Windows containers. | Either download and install Docker or download install Docker for Windows and select Linux containers when the option is presented. |

Open a command-line tool in your documentation directory. Run:

``git clone https://github.com/HealthCatalyst/docfx.docker.git update
move update\run.cmd .
rmdir /s /q update```

# Every time after
## Build a directory of Markdown files and images into a site and PDFs
Open your command-line tool in your documentation directory. Run `run.cmd`.

If the image has changed, it may take a couple minutes to update while the latest version is downloaded.

To re-build the site/PDF(s) after you make changes, press `Ctrl` + `C`. Reply `y` to `Terminate batch job (Y/N)?` and press `Enter`. Run `rebuild.cmd`.

# Troubleshooting
## HNS failed with error
```Error response from daemon: failed to create endpoint vibrant_einstein on network nat: HNS failed with error : The object already exists.```

Right click the Docker icon in the `^` menu at far right of the Windows taskbar.

**Settings...** > **Daemon**

Add the following at the bottom of the code, before the final `}`:

```
,
  "bridge": "none"
```

## Start: failure in a Windows system call
```Error response from daemon: container e8276c09a30a2172d086b6d0134dd521a880183d18e283d594e4b5ca90c8bc1e encountered an error during Start: failure in a Windows system call: The compute system exited unexpectedly. (0xc0370106)```

Run `docker rmi --force hcdocs/docfx`.
