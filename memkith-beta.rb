# Generated from memkith/memkithV2. Do not edit in the tap.
class MemkithBeta < Formula
  desc "Multiplayer context for AI coding agents"
  homepage "https://memkith.com"
  version "0.2.0b7"
  license "Apache-2.0"

  conflicts_with "memkith", because: "both install memkith"

  if OS.mac? && Hardware::CPU.arm?
    url "https://beta-release.memkith.com/memkith-v0.2.0b7-darwin-arm64.tar.gz"
    sha256 "30f536fb06f1ec1863bbe895d02831f25d28df89cc4c0c0dbb6610ed7a26aaec"
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
