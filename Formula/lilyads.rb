class Lilyads < Formula
  desc "AI-friendly Apple Ads CLI by Lily"
  homepage "https://github.com/crevas/Apple-Ads-CLI"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/crevas/Apple-Ads-CLI/releases/download/v0.1.1/lily_darwin_arm64.tar.gz"
      sha256 "a1660cc110ce8604de6e99874faa41dfa54d0e807be31ed6b2a7635fb6b60437"
    else
      url "https://github.com/crevas/Apple-Ads-CLI/releases/download/v0.1.1/lily_darwin_amd64.tar.gz"
      sha256 "94190573c41ae4729a3256c69183a81b504df19bd9347d9812e1e409666422a3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/crevas/Apple-Ads-CLI/releases/download/v0.1.1/lily_linux_arm64.tar.gz"
      sha256 "f7c9e55a0f02c5d55bb028459edab26391881d15c34748f76eff5f210d9f223d"
    else
      url "https://github.com/crevas/Apple-Ads-CLI/releases/download/v0.1.1/lily_linux_amd64.tar.gz"
      sha256 "8b5088fd10e5e5c6f3cd8f3c9d46fab28fbc60e089f0821830bfc4387f90f32d"
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
