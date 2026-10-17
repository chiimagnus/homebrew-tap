class Applebookscli < Formula
  desc "Native CLI for querying and safely updating Apple Books data"
  homepage "https://github.com/chiimagnus/AppleBooksCLI"
  url "https://github.com/chiimagnus/AppleBooksCLI/releases/download/v0.4.2/chiimagnus-applebookscli-0.4.2.tgz"
  sha256 "d3d71bbe48c35e6d8009411ba9aa3c355ad28a677971da7418b002fe8fdaba41"
  license "AGPL-3.0-only"

  depends_on arch: :arm64
  depends_on macos: :sequoia

  def install
    odie "AppleBooksCLI requires macOS 15.6 or later" if MacOS.full_version < MacOSVersion.new("15.6")
    bin.install "bin/applebookscli"
    (libexec/"applebookscli").install "libexec/applebookscli/applebookscli-pdf-worker"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/applebookscli --version").strip
    assert_predicate libexec/"applebookscli/applebookscli-pdf-worker", :executable?
  end
end
