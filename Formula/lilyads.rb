class Lilyads < Formula
  desc "AI-friendly Apple Ads CLI by Lily"
  homepage "https://github.com/crevas/Apple-Ads-CLI"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/crevas/Apple-Ads-CLI/releases/download/v0.1.0/lily_darwin_arm64.tar.gz"
      sha256 "87b47dd9b3bdf401b3450f9abf3b03dd8a3f1127df184b4fb68c6c2e8721175f"
    else
      url "https://github.com/crevas/Apple-Ads-CLI/releases/download/v0.1.0/lily_darwin_amd64.tar.gz"
      sha256 "7272085e9ee0da39bb89f077615ae0c6277fabae2726b529504a9e44b5c501fc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/crevas/Apple-Ads-CLI/releases/download/v0.1.0/lily_linux_arm64.tar.gz"
      sha256 "e156078ba3dfaeaead3408e1295e7b90ee734eae562fbd680a8887081d08d8b7"
    else
      url "https://github.com/crevas/Apple-Ads-CLI/releases/download/v0.1.0/lily_linux_amd64.tar.gz"
      sha256 "54c431d97ec13261873f0d2759a7cf2ec152267614ac25d5666b5b6db87d1cf9"
    end
  end

  def install
    bin.install "lily"
    bin.install_symlink bin/"lily" => "lilyads"
  end

  test do
    assert_match "lily #{version}", shell_output("#{bin}/lily --version")
    assert_match "lily #{version}", shell_output("#{bin}/lilyads --version")
  end
end
