class Lilyads < Formula
  desc "AI-friendly Apple Ads CLI by Lily"
  homepage "https://github.com/crevas/Apple-Ads-CLI"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/crevas/Apple-Ads-CLI/releases/download/v0.3.0/lily_darwin_arm64.tar.gz"
      sha256 "b030036b9500ce6a3874c6241102eae7776ad98df3c969d792ba0c13ee4f70b2"
    else
      url "https://github.com/crevas/Apple-Ads-CLI/releases/download/v0.3.0/lily_darwin_amd64.tar.gz"
      sha256 "5800f227250ff8f6379a82df7c9b1fa3a38de205e7a5d1edd320fa3429b62206"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/crevas/Apple-Ads-CLI/releases/download/v0.3.0/lily_linux_arm64.tar.gz"
      sha256 "faacfa04cb2bc09056f60e0ef5b628f989320b4a7ba0fe02f34f1eaca0f9b7e5"
    else
      url "https://github.com/crevas/Apple-Ads-CLI/releases/download/v0.3.0/lily_linux_amd64.tar.gz"
      sha256 "899610d38fdc05064ba21d586935decdf7ceb916dae17bd667bff9b1d5e39456"
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
