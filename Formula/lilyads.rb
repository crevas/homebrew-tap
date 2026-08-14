class Lilyads < Formula
  desc "AI-friendly Apple Ads CLI by Lily"
  homepage "https://github.com/crevas/Apple-Ads-CLI"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/crevas/Apple-Ads-CLI/releases/download/v0.2.1/lily_darwin_arm64.tar.gz"
      sha256 "635dbcf50f0356e0d1edbb1a5dd599d863aee2dbea5091aea8bf5f696e3e0238"
    else
      url "https://github.com/crevas/Apple-Ads-CLI/releases/download/v0.2.1/lily_darwin_amd64.tar.gz"
      sha256 "a4807c3f3c5cdd13f649dd799e9fa90e54c79587f4c160d3b86c664e5bbe6434"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/crevas/Apple-Ads-CLI/releases/download/v0.2.1/lily_linux_arm64.tar.gz"
      sha256 "2367da9ea4faef0309d47c258a5b00877a034f8312cd3f2999dd61b2f113145d"
    else
      url "https://github.com/crevas/Apple-Ads-CLI/releases/download/v0.2.1/lily_linux_amd64.tar.gz"
      sha256 "332200c711644a7d4770b72211f9e0eec80f49399823169f2d1a0a1881bab3e6"
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
