class Applebookscli < Formula
  desc "Native CLI for querying and safely updating Apple Books data"
  homepage "https://github.com/chiimagnus/AppleBooksCLI"
  url "https://github.com/chiimagnus/AppleBooksCLI/releases/download/v0.4.1/chiimagnus-applebookscli-0.4.1.tgz"
  version "0.4.1"
  sha256 "5a9aad5f0035cc63fe7ab8e00d0d608c2680c7d10f38fb499bb63bc3a79e0c4d"
  license "AGPL-3.0-only"

  depends_on arch: :arm64
  depends_on macos: :monterey

  def install
    bin.install "bin/applebookscli"
    (libexec/"applebookscli").install "libexec/applebookscli/applebookscli-pdf-worker"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/applebookscli --version").strip
    assert_predicate libexec/"applebookscli/applebookscli-pdf-worker", :executable?
  end
end
