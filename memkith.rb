# Homebrew formula for memkith — canonical source.
#
# This file is the source of truth. On every `v*` tag, CI in
# memkith/memkith renders this file with the real artifact SHA
# substituted for f51084e99470e75ad3be5c235d26d194801ca5b6d8bd06847e36f0d61e07a6d8 and pushes the result to
# memkith/homebrew-memkith. Do not hand-edit the live tap copy;
# edit this file instead.
#
# Release artifacts are hosted on Cloudflare R2 (not GitHub Releases)
# because the memkith/memkith repo is private and brew downloads
# unauthenticated.
#
# Install:
#   brew tap memkith/memkith
#   brew install memkith
#
# (One-shot equivalent: `brew install memkith/memkith/memkith`.)

class Memkith < Formula
  desc "Multiplayer context for AI coding agents"
  homepage "https://github.com/memkith/memkith"
  version "0.1.0b7"
  license "MIT"

  # Apple Silicon only — there's no Intel Mac build. If you're on x86_64
  # Mac and need this, open an issue.
  depends_on arch: :arm64
  depends_on :macos

  # Hosted on Cloudflare R2 at the release.memkith.com custom domain.
  url "https://release.memkith.com/memkith-v#{version}-darwin-arm64.tar.gz"
  sha256 "f51084e99470e75ad3be5c235d26d194801ca5b6d8bd06847e36f0d61e07a6d8"

  def install
    bin.install "memkith"
  end

  test do
    assert_match "Multiplayer context", shell_output("#{bin}/memkith --help")
  end
end
