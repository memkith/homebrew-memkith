# Homebrew formula for memkith — canonical source.
#
# This file is the source of truth. On every `v*` tag, CI in
# memkith/memkith renders this file with the real artifact SHA
# substituted for fc9c2d269308254c90380a7c5ba4a9924253a258d4d94919cbec6dbd4b21352a and pushes the result to
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
  version "0.2.0b1"
  license "MIT"

  # Apple Silicon only — there's no Intel Mac build. If you're on x86_64
  # Mac and need this, open an issue.
  depends_on arch: :arm64
  depends_on :macos

  # Hosted on Cloudflare R2 at the release.memkith.com custom domain.
  url "https://release.memkith.com/memkith-v#{version}-darwin-arm64.tar.gz"
  sha256 "fc9c2d269308254c90380a7c5ba4a9924253a258d4d94919cbec6dbd4b21352a"

  def install
    bin.install "memkith"
    bin.install_symlink bin/"memkith" => "memkith-mcp"
  end

  test do
    assert_match "Multiplayer context", shell_output("#{bin}/memkith --help")
    assert_predicate bin/"memkith-mcp", :exist?
  end
end
