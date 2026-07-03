class Lilyads < Formula
  desc "AI-friendly Apple Ads CLI by Lily"
  homepage "https://github.com/crevas/Apple-Ads-CLI"
  version "0.1.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/crevas/Apple-Ads-CLI/releases/download/v0.1.3/lily_darwin_arm64.tar.gz"
      sha256 "5930b8fa46d329b156ecf060199e65a2e11c0478b8d72746488219ea3b9f39a0"
    else
      url "https://github.com/crevas/Apple-Ads-CLI/releases/download/v0.1.3/lily_darwin_amd64.tar.gz"
      sha256 "654d45d3c5528378e043786e7c585e0fc49a191b743084d3b518dbb247d6af3f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/crevas/Apple-Ads-CLI/releases/download/v0.1.3/lily_linux_arm64.tar.gz"
      sha256 "164e53fc2f63ed06b169ac8afe6d2e9e42079d2a26d78342895c8598db8586ec"
    else
      url "https://github.com/crevas/Apple-Ads-CLI/releases/download/v0.1.3/lily_linux_amd64.tar.gz"
      sha256 "f5f753b938d1a18a7f5361a8b0b8368136ad56551440728dbf8b1bba22f14cd4"
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
