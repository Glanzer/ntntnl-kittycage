# PKGBUILD for ntntnl-kittycye

# Package metadata
pkgname='ntntnl-kittycage'
pkgver='0.1.0'
pkgrel=1
pkgdesc='The core cage+kitty login environment for the ntntnl-rice ecosystem.'
arch=('any')
license=('GPL')
url='https://github.com/Glanzer/ntntnl-kittycage'
depends=('cage' 'kitty' 'greetd' 'greetd-tuigreet')

# Point ONLY to the source tarball on your GitHub release page
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")

# Generate this with the updpkgsums command
sha256sums=('1c00c330dc6fc3f6edc8207c83ddec4c5ec9684a002ac420a60220b86505aa39')

# This function is the "installer".
package() {
  # ... (no changes needed in this function) ...
  # Define the installation root for our entire ecosystem
  local NTNTNL_ROOT="/opt/ntntnl"

  # --- STEP 1: Install all package files into our private /opt/ntntnl root ---
  cd "$srcdir/source"

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

  install -Dm644 etc/greetd/config.toml "$pkgdir/etc/greetd/config.toml.pacnew"

  # Link files that are UNIQUE
  install -d "$pkgdir/usr/share/wayland-sessions"
  ln -sfn "$NTNTNL_ROOT/share/applications/homebase.desktop" "$pkgdir/usr/share/wayland-sessions/homebase.desktop"
}
