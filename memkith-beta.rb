# Generated from memkith/memkithV2. Do not edit in the tap.
class MemkithBeta < Formula
  desc "Multiplayer context for AI coding agents"
  homepage "https://memkith.com"
  version "0.2.0b5"
  license "Apache-2.0"

  conflicts_with "memkith", because: "both install memkith"

  if OS.mac? && Hardware::CPU.arm?
    url "https://beta-release.memkith.com/memkith-v0.2.0b5-darwin-arm64.tar.gz"
    sha256 "295f7bc6468a20922a46d6baa26889935c9b7c0c3081a2f3278b0e44278dcb0f"
  else
    odie "Memkith has no native build for this platform"
  end

  def install
    libexec.install Dir["*"]
    %w[memkith memkith-hook memkith-mcp].each do |command|
      bin.install_symlink libexec/"memkith" => command
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/memkith --version")
  end
end
