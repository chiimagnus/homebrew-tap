class Applebookscli < Formula
  desc "Native CLI for querying and safely updating Apple Books data"
  homepage "https://github.com/chiimagnus/AppleBooksCLI"
  url "https://github.com/chiimagnus/AppleBooksCLI/releases/download/v0.5.0/chiimagnus-applebookscli-0.5.0.tgz"
  sha256 "38b00b83151c50eea3e76babf231ab417b19b0111f9bacfd05acde19bee3dde1"
  license "AGPL-3.0-only"

  depends_on arch: :arm64
  depends_on macos: :sequoia

  def install
    odie "AppleBooksCLI requires macOS 15.6 or later" if MacOS.full_version < MacOSVersion.new("15.6")
    bin.install "bin/applebookscli"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/applebookscli --version").strip
  end
end
