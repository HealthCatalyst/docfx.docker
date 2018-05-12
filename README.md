# docfx.docker
A Windows Docker image that transforms Heath Catalyst documentation from Markdown to a website and PDFs with DocFx.

https://hub.docker.com/r/hcdocs/docfx

For a Linux image, search https://hub.docker.com for `docfx`.

## The purpose of this
### Let teams store documentation source files (and only source files) anywhere
The intent of the Docker image and the `run.cmd` file in this repo (sorry, no Linux version yet but on it's way) is to enable Health Catalyst teams to store *only* their markdown files, images, and a couple simple configuration files in any directory in any Git repo or storage location.

### Let teams build Health Catalyst-branded output without maintain the mechanisms that do it
Docker containers and the `run.cmd` (when it's executed in the directory of documentation) build the team's documentation into a local preview of the HTML output and generate PDFs, both in Health Catalyst styling. This eliminates the need for a team to store and maintain the entire framework required to build them. Builds also complete more quickly.

## Prerequisites
- Git
- A directory of documentation that looks similar to this:

  root repo<br>
  |-- `Docs`
  |    |-- `articles`<br>
  |    |    |-- `guide-name`<br>
  |    |    |    | -- `media` or `images`<br>
  |    |    |    |     | image files
  |    |    |    | `*.md` files
  |    |    |    | `.toc.yml`
  |    |    | `.toc.yml`
  |    |    | `index.md`
  |    |    | `docfx.json`
  
(coming soon) For a pre-made starter structure of this, open Windows Command Prompt in your `Docs` directory and enter `git clone -b starter https://github.com/HealthCatalyst/docs-project-template.git` or see https://github.com/HealthCatalyst/docs-project-template/tree/starter.

## Install Docker
### For Windows
Download and install Docker for Windows.

When the option is presented, choose Windows containers.

### For Linux
Download and install Docker or install Docker for Windows and select Linux containers when the option is presented.

### Pull the Health Catalyst DocFx Docker image
Start Docker.

(For Windows users) Open Windows Command Prompt.

(For Linux users) Open Git Bash (?).

Enter `docker pull hcdocs/docfx`.

### Add the `run.cmd` file to your documentation directory
In your command-line tool, `cd` to your documentation directory.

Run `https://github.com/HealthCatalyst/docfx.docker.git`.

Delete the `Dockerfile` if you want. You only need `run.cmd`.

### Build a directory of Markdown files and images into a site and PDFs
Run `run.cmd`.

When the site generated, a Chrome window opens with the site displayed. If you prefer a different browser, replace `chrome` in `run.cmd`.

## Troubleshooting

### HNS failed with error
```Error response from daemon: failed to create endpoint vibrant_einstein on network nat: HNS failed with error : The object already exists.```

Right click the Docker icon in the `^` menu at far right of the Windows taskbar.

**Settings...** > **Daemon**

Add the following at the bottom of the code, before the final `}`:

```
,
  "bridge": "none"
```

### Start: failure in a Windows system call
```Error response from daemon: container e8276c09a30a2172d086b6d0134dd521a880183d18e283d594e4b5ca90c8bc1e encountered an error during Start: failure in a Windows system call: The compute system exited unexpectedly. (0xc0370106)```

Run `docker rmi --force hcdocs/docfx`.
