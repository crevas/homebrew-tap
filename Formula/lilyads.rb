class Lilyads < Formula
  desc "AI-friendly Apple Ads CLI by Lily"
  homepage "https://github.com/crevas/Apple-Ads-CLI"
  version "0.1.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/crevas/Apple-Ads-CLI/releases/download/v0.1.5/lily_darwin_arm64.tar.gz"
      sha256 "284872c89695c3b1a31e9455f88f25868cc4bb54f08614e72a724325c3a20b3a"
    else
      url "https://github.com/crevas/Apple-Ads-CLI/releases/download/v0.1.5/lily_darwin_amd64.tar.gz"
      sha256 "8fec899f8c43abb9676416caf74b663d783091815f014f666c2edf1f7215bd2a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/crevas/Apple-Ads-CLI/releases/download/v0.1.5/lily_linux_arm64.tar.gz"
      sha256 "0d562d2b011981cf7fcad75022f6196b809d54a54645855d46e62eae3f7a2485"
    else
      url "https://github.com/crevas/Apple-Ads-CLI/releases/download/v0.1.5/lily_linux_amd64.tar.gz"
      sha256 "10f593999c21a51b2bd5e17989c81613348123aa08ee467cc4e5aae4522f1876"
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
