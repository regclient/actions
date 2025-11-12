# regclient actions

This repo contains various GitHub actions for regclient.

## cmd-installer

This action installs the requested binary.
Most users will run one of the command specific installers below.

### cmd-installer Usage

```yaml
- name: Install regctl
  uses: regclient/actions/cmd-installer@main
  with:
    install-cmd: 'regctl' # regclient command to install
    release: 'v0.4.7' # optional version
```

### cmd-installer Inputs

The following inputs are available for cmd-installer:

| Input | Description |
| --- | --- |
| `install-cmd` | regclient command to install. This is required. |
| `release` | version to use. Defaults to `latest` (most recent release). Set to `main` to build the latest commit using `go install`. |
| `install-dir` | directory to place the binary into instead of the default (`$HOME/.regclient/bin`). |

If cosign is installed, signatures on downloaded binaries will be verified.

## regctl-installer

This action installs the `regctl` binary.

### regctl-installer Usage

```yaml
- name: Install regctl
  uses: regclient/actions/regctl-installer@main
  with:
    release: 'v0.4.7' # optional version
```

### regctl-installer Inputs

The following inputs are available for regctl-installer:

| Input | Description |
| --- | --- |
| `release` | `regctl` version to use. Defaults to `latest` (most recent release). Set to `main` to build the latest commit using `go install`. |
| `install-dir` | directory to place the `regctl` binary into instead of the default (`$HOME/.regctl/bin`). |

If cosign is installed, signatures on downloaded binaries will be verified.

## regsync-installer

This action installs the `regsync` binary.

### regsync-installer Usage

```yaml
- name: Install regsync
  uses: regclient/actions/regsync-installer@main
  with:
    release: 'v0.4.7' # optional version
```

### regsync-installer Inputs

The following inputs are available for regsync-installer:

| Input | Description |
| --- | --- |
| `release` | `regsync` version to use. Defaults to `latest` (most recent release). Set to `main` to build the latest commit using `go install`. |
| `install-dir` | directory to place the `regsync` binary into instead of the default (`$HOME/.regsync/bin`). |

If cosign is installed, signatures on downloaded binaries will be verified.

## regbot-installer

This action installs the `regbot` binary.

### regbot-installer Usage

```yaml
- name: Install regbot
  uses: regclient/actions/regbot-installer@main
  with:
    release: 'v0.4.7' # optional version
```

### regbot-installer Inputs

The following inputs are available for regbot-installer:

| Input | Description |
| --- | --- |
| `release` | `regbot` version to use. Defaults to `latest` (most recent release). Set to `main` to build the latest commit using `go install`. |
| `install-dir` | directory to place the `regbot` binary into instead of the default (`$HOME/.regbot/bin`). |

If cosign is installed, signatures on downloaded binaries will be verified.

## regctl-login

This action performs a login to a registry, similar to `docker login`.

### regctl-login Usage

```yaml
- name: regctl login
  uses: regclient/actions/regctl-login@main
```

### regctl-login Inputs

The following inputs are available for regctl-login:

| Input | Description |
| --- | --- |
| `registry` | Registry to use. Defaults to `ghcr.io`. Use `docker.io` to login to Docker Hub. |
| `username` | Username for the login. Defaults to `${{ github.actor }}`. |
| `password` | Password for the login. Defaults to `${{ github.token }}`. |

## Examples

Install latest release of regctl:

```yaml
jobs:
  example:
    runs-on: ubuntu-latest
    name: example
    steps:
      # if cosign is installed, signatures will be verified
      - name: Install cosign
        uses: sigstore/cosign-installer@main
      - name: Install regctl
        uses: regclient/actions/regctl-installer@main
      - name: regctl login
        uses: regclient/actions/regctl-login@main
```

Install from `main` branch using `go install`, and login to Docker Hub using a secret:

```yaml
jobs:
  example:
    runs-on: ubuntu-latest
    name: example
    steps:
      - name: Set up Go
        uses: actions/setup-go@v6
      - name: Install regctl
        uses: regclient/actions/regctl-installer@main
        with:
          release: 'main'
      - name: regctl login
        uses: regclient/actions/regctl-login@main
        with:
          registry: docker.io
          username: ${{ secrets.DOCKERHUB_USERNAME }}
          password: ${{ secrets.DOCKERHUB_TOKEN }}
```

## Project Details

For more details on the regclient project, see [regclient/regclient](https://github.com/regclient/regclient).
