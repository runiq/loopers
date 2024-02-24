Building the Flatpak requires creating the `cargo-sources.json` file, which contains all dependencies an a format the Flatpak Builder can understand.
You can use `create-cargo-sources.sh` to generate it.
It installs [`flatpak-cargo-generator.py`](https://github.com/flatpak/flatpak-builder-tools/tree/master/cargo) in a virtualenv, downloads the generator script, runs it, and deletes the virtualenv when it's done.
