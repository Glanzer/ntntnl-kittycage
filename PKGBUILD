# PKGBUILD for ntntnl-kittycage

# Package metadata
pkgname='ntntnl-kittycage'
pkgver='0.1.0'
pkgrel=1
pkgdesc='The core cage+kitty login environment for the ntntnl-rice ecosystem.'
arch=('any')
license=('GPL')
url='https://github.com/your-repo' # Replace with your repo later
depends=('cage' 'kitty' 'greetd' 'greetd-tuigreet')

# Source files: configuration files, bundled into a tarball
#source=("$pkgname-$pkgver.tar.gz")
source=("source")
sha256sums=('1cb3497376848f77f682b223d0dafba4716a48eec5c6edb40cfaf47f40f0b4d7')

# This function is the "installer".
package() {
  # Define the installation root for our entire ecosystem
  local NTNTNL_ROOT="/opt/ntntnl"

  # --- STEP 1: Install all package files into our private /opt/ntntnl root ---
  cd "$srcdir"

  install -d "$pkgdir$NTNTNL_ROOT/etc/greetd"
  install -m644 etc/greetd/config.toml "$pkgdir$NTNTNL_ROOT/etc/greetd/"

  install -d "$pkgdir$NTNTNL_ROOT/etc/kitty"
  install -m644 etc/kitty/kitty-cage.conf "$pkgdir$NTNTNL_ROOT/etc/kitty/"

  install -d "$pkgdir$NTNTNL_ROOT/libexec"
  install -m755 libexec/intentional-session "$pkgdir$NTNTNL_ROOT/libexec/"
  install -m755 libexec/intentional-greeter "$pkgdir$NTNTNL_ROOT/libexec/"

  install -d "$pkgdir$NTNTNL_ROOT/share/applications"
  install -m644 share/applications/homebase.desktop "$pkgdir$NTNTNL_ROOT/share/applications/"

  install -d "$pkgdir$NTNTNL_ROOT/share/backgrounds"
  install -m644 share/backgrounds/kitty-cage.png "$pkgdir$NTNTNL_ROOT/share/backgrounds/"

  install -d "$pkgdir$NTNTNL_ROOT/share/doc"
  install -m644 share/doc/README.md "$pkgdir$NTNTNL_ROOT/share/doc/"


  # --- STEP 2: Integrate with the system safely ---

  install -Dm644 "$srcdir/etc/greetd/config.toml" "$pkgdir/etc/greetd/config.toml.pacnew"

  # Link files that are UNIQUE
  install -d "$pkgdir/usr/share/wayland-sessions"
  ln -sfn "$NTNTNL_ROOT/share/applications/homebase.desktop" "$pkgdir/usr/share/wayland-sessions/homebase.desktop"
}
