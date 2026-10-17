class Roamer < Formula
  desc "CLI automation for Apple Vision Pro Simulator"
  homepage "https://github.com/chiimagnus/Roamer"
  url "https://github.com/chiimagnus/Roamer/releases/download/v0.1.1/roamer-macos-arm64.tar.gz"
  sha256 "06d36b9577b09e1b5ea426b5f87571931d1dda04bb72c6f754594633ec3c775e"
  license "AGPL-3.0-only"

  depends_on arch: :arm64
  depends_on macos: :tahoe
  depends_on xcode: "27.0"

  def install
    odie "Roamer requires macOS 26.6 or later" if MacOS.full_version < MacOSVersion.new("26.6")
    bin.install "roamer"
    prefix.install "LICENSE"
  end

  test do
    assert_equal "roamer #{version}", shell_output("#{bin}/roamer --version").strip
  end
end
