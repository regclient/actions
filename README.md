# regclient actions

This repo contains various GitHub actions for regclient.

## regctl-install

This action installs the `regctl` binary.

### regctl-install Usage

```yaml
- name: Install regctl
  uses: regclient/actions/regctl-installer@main
  with:
    release: 'v0.4.0' # optional version
```

### regctl-installer Inputs

The following inputs are available for regctl-installer:

| Input | Description |
| --- | --- |
| `release` | `regctl` version to use. Defaults to `latest` (most recent release). Set to `main` to build the latest commit using `go install`. |
| `install-dir` | directory to place the `regctl` binary into instead of the default (`$HOME/.regctl/bin`). |

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

Install latest release:

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
        uses: actions/setup-go@v3
      - name: Install cosign
        uses: sigstore/cosign-installer@main
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
