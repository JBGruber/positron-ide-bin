# Maintainer: Johannes B. Gruber <JohannesB.Gruber@gmail.com>
# https://github.com/JBGruber/positron-ide-bin

pkgname="positron-ide-bin"
# run bash update_v.sh to update version
pkgver=2024.09.0_27
pkgrel=1
pkgdesc="Positron IDE"
arch=('x86_64')
url="https://github.com/posit-dev/positron"
license=('custom')
depends=('r>=3.3.0' 'zstd' 'libarchive')
source=("https://github.com/posit-dev/positron/releases/download/${pkgver//_/-}/Positron-${pkgver//_/-}.deb")
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
