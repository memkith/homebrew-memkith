# Homebrew formula for memkith.
#
# Bump `version` and the `sha256` line after each release; everything
# else is stable.
#
# Install:
#   brew tap memkith/memkith
#   brew install memkith

class Memkith < Formula
  desc "Multiplayer context for AI coding agents"
  homepage "https://github.com/memkith/memkith"
  version "0.1.0b6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://release.memkith.com/memkith-v#{version}-darwin-arm64.tar.gz"
      sha256 "bbe05bc5f2278905bcea36771224aa1b6d71ee45aa8ed74d6497fd59fc38a2cb"
    end
  end

  def install
    bin.install "memkith"
  end

  test do
    assert_match "Multiplayer context", shell_output("#{bin}/memkith --help")
  end
end
