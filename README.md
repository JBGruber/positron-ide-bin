
# Positron for Arch Linux

A next-generation data science IDE built by Posit PBC. An extensible, polyglot tool for writing code and exploring data. Learn more at <https://github.com/posit-dev/positron>.

This repo contains a PKGBUILD file to install it on Arch Linux in addition to an update_v bash script that makes sure you get the newest version:

```bash
# update version in PKGBUILD
bash update_v.sh
# install package
makepkg -si
```

Or run both with the included `Makefile`:

```bash
make
```
