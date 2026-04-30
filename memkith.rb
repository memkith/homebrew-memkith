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
  version "0.1.0b2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/memkith/memkith/releases/download/v#{version}/memkith-v#{version}-darwin-arm64.tar.gz"
      sha256 "93ab0c9e3c1946b45b178aef3c684a80b46394a94dc7a4ed099e87438dcefc2f"
    end
  end

  def install
    bin.install "memkith"
  end

  test do
    assert_match "Multiplayer context", shell_output("#{bin}/memkith --help")
  end
end
