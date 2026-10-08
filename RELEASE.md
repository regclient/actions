# Release Notes

## Release v0.2.0

This release is primarily to pull in various dependency updates.
Very little has changed in the actions code itself.

Changes:

- Fix: Manage Go version in GHA with version-bump. ([PR 47][pr-47])
- Chore: Add copyright headers and markdown linting. ([PR 59][pr-59])
- Feat: Run the version command after installing. ([PR 67][pr-67])
- Chore: Refactor release process. ([PR 71][pr-71])

Contributors:

- @HastD
- @sudo-bmitch

[pr-47]: https://github.com/regclient/actions/pull/47
[pr-59]: https://github.com/regclient/actions/pull/59
[pr-67]: https://github.com/regclient/actions/pull/67
[pr-71]: https://github.com/regclient/actions/pull/71

## Release v0.1.0

- Fix: Handle special characters in the inputs. ([PR 20][pr-20])
- Feat: Support passing additional options to `regctl registry login` like `--skip-check`. ([PR 20][pr-20])
- Chore: Pin cosign to v2. ([PR 29][pr-29])
- Feat: Add installers for each regclient command. ([PR 32][pr-32])
- Fix: Fixing installer for separate commands. ([PR 34][pr-34])
- Feat: Add support for cosign v3 bundles. ([PR 35][pr-35])
- Chore: Allow action to be manually tested. ([PR 37][pr-37])
- Fix: Expand $HOME variable in default install directory. ([PR 41][pr-41])
- Fix: Add the path to main releases. ([PR 42][pr-42])
- Feat: Add a release workflow. ([PR 44][pr-44])

Contributors:

- @soult
- @sudo-bmitch

[pr-20]: https://github.com/regclient/actions/pull/20
[pr-29]: https://github.com/regclient/actions/pull/29
[pr-32]: https://github.com/regclient/actions/pull/32
[pr-34]: https://github.com/regclient/actions/pull/34
[pr-35]: https://github.com/regclient/actions/pull/35
[pr-37]: https://github.com/regclient/actions/pull/37
[pr-41]: https://github.com/regclient/actions/pull/41
[pr-42]: https://github.com/regclient/actions/pull/42
[pr-44]: https://github.com/regclient/actions/pull/44
