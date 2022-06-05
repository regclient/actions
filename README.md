# regclient-action

## regctl-install

This action installs the `regctl` binary.

### Usage

```yaml
uses: regclient/regclient-action/regctl-installer@main
with:
  release: 'v0.4.0' # optional version
```

### Optional Inputs

The following optional inputs:

| Input | Description |
| --- | --- |
| `release` | `regctl` version to use instead of the default. |
| `install-dir` | directory to place the `regctl` binary into instead of the default (`$HOME/.regctl/bin`). |

## Project Details

For more details on the regclient project, see [regclient/regclient](https://github.com/regclient/regclient).
