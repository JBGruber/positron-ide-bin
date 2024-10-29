# Maintainer: Johannes B. Gruber <JohannesB.Gruber@gmail.com>
# https://github.com/JBGruber/positron-ide-bin

pkgname="positron-ide-bin"
pkgver=0.0.1
pkgrel=1
pkgdesc="Positron IDE"
arch=('x86_64')
url="https://github.com/posit-dev/positron"
license=('custom')
depends=('r>=3.3.0' 'zstd' 'libarchive')

# pulls latest numbered version from GitHub API
api_url="https://api.github.com/repos/posit-dev/positron/tags"
latest_tag=$(curl -s "$api_url" | grep -m 1 -oP '"name": "\K[0-9][^"]*(?=")')
formatted_version=${latest_tag//-/_}
source=("https://github.com/posit-dev/positron/releases/download/${formatted_version//_/-}/Positron-${formatted_version//_/-}.deb")
sha256sums=('SKIP')  # TODO: replace 'SKIP' with actual checksum for better security
OPTIONS=(!debug !lto)

package() {
    # extract application from data archive inside deb
    bsdtar -xf data.tar.zst -C "${srcdir}/"
    # create dir structure
    mkdir -p "${pkgdir}/usr/share/applications/"
    # move .desktop files
    mv "${srcdir}/usr/share/applications"/* "${pkgdir}/usr/share/applications/"
    # move the actual application
    mv "${srcdir}/usr/share/positron" "${pkgdir}/usr/share/"
}
