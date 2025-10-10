#!/usr/bin/env bash
set -e

echo "Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Updating Homebrew..."
brew update

echo "Installing formulae..."
brew install \
  aom gmp libnghttp2 libxau openexr theora \
  aribb24 gnutls libnghttp3 libxcb openjpeg tmux \
  brotli graphite2 libngtcp2 libxdmcp openjph tree \
  c-ares harfbuzz libogg libxext openssl@3 tree-sitter \
  ca-certificates libpng libxrender opus unbound \
  cairo highway librist little-cms2 p11-kit unibilium \
  carapace icu4c@77 libsamplerate lpeg pango utf8proc \
  cjson imath libsndfile luajit pcre2 uvwasi \
  cloc jpeg-turbo libsodium luv pixman webp \
  codex jpeg-xl libsoxr lz4 python@3.11 x264 \
  dav1d lame libssh lzo rav1e x265 \
  eza lazydocker libssh2 mbedtls readline xorgproto \
  fd lazygit libtasn1 ripgrep xvid \
  ffmpeg leptonica libtiff rubberband xz \
  flac libarchive libudfread mpdecimal sdl2 zeromq \
  fontconfig libass libunibreak mpg123 simdjson zimg \
  freetype libb2 libunistring ncurses snappy zoxide \
  frei0r libbluray libuv neovim speex zsh-autosuggestions \
  fribidi libdeflate libvidstab nettle zstd \
  fzf libevent libvmaf node srt \
  gettext libgit2 libvorbis starship \
  giflib libidn2 libvpx opencode svt-av1 \
  glib libmicrohttpd libx11 opencore-amr tesseract

echo "Installing casks..."
brew install --cask \
  betterdisplay fliqlo font-jetbrains-mono-nerd-font \
  ghostty visual-studio-code bruno font-geist-mono \
  font-monocraft keycastr

echo "Cleaning up..."
brew cleanup

echo "✅ All installations complete!"
