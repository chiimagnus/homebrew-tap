class Applemapscli < Formula
  desc "Native Apple Maps CLI with ordered multi-stop routes"
  homepage "https://github.com/chiimagnus/AppleMapsCLI"
  url "https://github.com/chiimagnus/AppleMapsCLI/releases/download/v0.1.0/applemaps-macos-arm64.tar.gz"
  sha256 "21f8887fba048d57465158ab3bb466a54efdba256d2bbcdd3dc4f2912d8929ea"
  license "MIT"

  depends_on arch: :arm64
  depends_on macos: :sequoia

  def install
    odie "AppleMapsCLI requires macOS 15.6 or later" if MacOS.full_version < MacOSVersion.new("15.6")
    bin.install "applemaps"
  end

  test do
    assert_match "USAGE: applemaps", shell_output("#{bin}/applemaps --help")
    assert_match '"via"', shell_output("#{bin}/applemaps directions --json-schema")
  end
end
