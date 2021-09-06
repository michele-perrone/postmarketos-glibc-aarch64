# Maintainer: Michele Perrone <perrone.michele@outlook.com>

pkgname="glibc"
pkgver="2.34"
_pkgrel="0"
pkgrel="0"
pkgdesc="GNU C Library compatibility layer"
arch="aarch64"
url="https://github.com/michele-perrone/postmarketos-glibc-aarch64"
license="LGPL"
source="glibc-bin-$pkgver-$arch.tar.gz
nsswitch.conf
ld.so.conf"
subpackages="$pkgname-bin $pkgname-dev $pkgname-i18n"
triggers="$pkgname-bin.trigger=/lib:/usr/lib:/usr/glibc-compat/lib"

package() {
  mkdir -p "$pkgdir/lib" "$pkgdir/usr/glibc-compat/lib/locale" "$pkgdir"/usr/glibc-compat/lib "$pkgdir"/etc
  cp -a "$srcdir"/usr "$pkgdir"
  cp "$srcdir"/ld.so.conf "$pkgdir"/usr/glibc-compat/etc/ld.so.conf
  cp "$srcdir"/nsswitch.conf "$pkgdir"/etc/nsswitch.conf
  rm "$pkgdir"/usr/glibc-compat/etc/rpc
  rm -rf "$pkgdir"/usr/glibc-compat/bin
  rm -rf "$pkgdir"/usr/glibc-compat/sbin
  rm -rf "$pkgdir"/usr/glibc-compat/lib/gconv
  rm -rf "$pkgdir"/usr/glibc-compat/lib/getconf
  rm -rf "$pkgdir"/usr/glibc-compat/lib/audit
  rm -rf "$pkgdir"/usr/glibc-compat/share
  rm -rf "$pkgdir"/usr/glibc-compat/var
  ln -s /usr/glibc-compat/lib/ld-linux-aarch64.so.1 ${pkgdir}/lib/ld-linux-aarch64.so.1
  ln -s /usr/glibc-compat/etc/ld.so.cache ${pkgdir}/etc/ld.so.cache
}

bin() {
  depends="$pkgname libgcc"
  mkdir -p "$subpkgdir"/usr/glibc-compat
  cp -a "$srcdir"/usr/glibc-compat/bin "$subpkgdir"/usr/glibc-compat
}

i18n() {
  depends="$pkgname-bin"
  arch="noarch"
  mkdir -p "$subpkgdir"/usr/glibc-compat
  cp -a "$srcdir"/usr/glibc-compat/share "$subpkgdir"/usr/glibc-compat
}

sha512sums="130908511b73324974369b21c55fc9058ae6e992fd5812025d5619adcd06a2d37a58b9d9583ebc8ccbfa20e80066381e2893c95155db828f7724601f48b358f2  glibc-bin-2.34-aarch64.tar.gz
478bdd9f7da9e6453cca91ce0bd20eec031e7424e967696eb3947e3f21aa86067aaf614784b89a117279d8a939174498210eaaa2f277d3942d1ca7b4809d4b7e  nsswitch.conf
11ddf5bbb87c0996ba35b928296858d15b244e2dd0f266a55714298628a6448be660baf8245064a79b00434577e0420b2e61d5537e74f7ca033a345b7073cbc3  ld.so.conf"
