# `cargo deb` Build Environment (debian armv7)

Provides a build environment for executing `cargo deb` [1] and producing statically linked binaries for the built Debian (`.deb`) package.

This build on a `debian:buster` base image and targets `armv7-unknown-linux-musleabihf`. The `musl` installation is possible thanks to the cross project [2].

The interface for this package was inspired/copied from the cargo-static-build [3] action.

[1] Cargo Deb provided by mmstick
- https://github.com/mmstick/cargo-deb
- https://crates.io/crates/cargo-deb

[2] MUSL environment made possible thanks to `cross` dual-licensed under [Apache 2.0](https://github.com/rust-embedded/cross/blob/master/LICENSE-APACHE) or [MIT](https://github.com/rust-embedded/cross/blob/master/LICENSE-MIT)
- https://github.com/rust-embedded/cross

[3] https://github.com/zhxiaogg/cargo-static-build

**NOTE**: This package may fail to build your project if your build links against other OS-provided libraries. Feel free to open a pull-request to modify the `Dockerfile` so your project can build.

## Inputs

`cmd` - The command to be executed inside the container. Defaults to `cargo deb --target=armv7-unknown-linux-musleabihf`

## Outputs

None, besides the `deb` package that is built. The built `.deb` will be located in `target/armv7-unknown-linux-musleabih/debian/<DEB>`.

## Example Usage

```yaml
name: Deb Static Build

on: [push]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@master
    - name: Deb Build
      uses: ebbflow-io/cargo-deb-armv7-debian@1.47.0-1
```

A working example can be found in use by Ebbflow to build its client package for various OS and CPU architectures [here](https://github.com/ebbflow-io/ebbflow/blob/master/.github/workflows/continuous-integration.yml).
