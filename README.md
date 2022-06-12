# regclient actions

This repo contains various GitHub actions for regclient.

## regctl-install

This action installs the `regctl` binary.

### Usage

```yaml
- name: Install regctl
  uses: regclient/actions/regctl-installer@main
  with:
    release: 'v0.4.0' # optional version
```

### Optional Inputs

The following optional inputs:

| Input | Description |
| --- | --- |
| `release` | `regctl` version to use. Defaults to `latest` (most recent release). Set to `main` to build the latest commit using `go install`. |
| `install-dir` | directory to place the `regctl` binary into instead of the default (`$HOME/.regctl/bin`). |

### Examples

Install latest release:

```yaml
jobs:
  example:
    runs-on: ubuntu-latest
    name: example
    steps:
      - name: Install regctl
        uses: regclient/actions/regctl-installer@main
```

Install from `main` branch using `go insall`:

```yaml
jobs:
  example:
    runs-on: ubuntu-latest
    name: example
    steps:
      - name: Set up Go 1.17
        uses: actions/setup-go@v3
        with:
          go-version: 1.17.x
      - name: Install regctl
        uses: regclient/actions/regctl-installer@main
        with:
          release: 'main'
```

## Project Details

For more details on the regclient project, see [regclient/regclient](https://github.com/regclient/regclient).
