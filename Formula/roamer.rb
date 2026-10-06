class Roamer < Formula
  desc "CLI automation for Apple Vision Pro Simulator"
  homepage "https://github.com/chiimagnus/Roamer"
  url "https://github.com/chiimagnus/Roamer/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "219edbaea3fb72f82226108d2160bdccfb1e8b4e790b488b14c7ca9fa9b44228"
  license "AGPL-3.0-only"

  depends_on arch: :arm64
  depends_on macos: :tahoe
  depends_on xcode: "27.0"

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/roamer"
  end

  test do
    assert_equal "roamer #{version}", shell_output("#{bin}/roamer --version").strip
  end
end
