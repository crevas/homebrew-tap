class Lilyads < Formula
  desc "AI-friendly Apple Ads CLI by Lily"
  homepage "https://github.com/crevas/Apple-Ads-CLI"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/crevas/Apple-Ads-CLI/releases/download/v0.2.3/lily_darwin_arm64.tar.gz"
      sha256 "25ca2bb18efc5b1346950920a8236f6f0a3ca8c8246e81450da5a627f348b040"
    else
      url "https://github.com/crevas/Apple-Ads-CLI/releases/download/v0.2.3/lily_darwin_amd64.tar.gz"
      sha256 "ce35fd2dd909045876269bb5f5fda3051a9dec07ce6e89550a36e6f02361a95b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/crevas/Apple-Ads-CLI/releases/download/v0.2.3/lily_linux_arm64.tar.gz"
      sha256 "7543e3e6adb243398868f8d96fff78107e0e610b62e936ace308e22ce84ae381"
    else
      url "https://github.com/crevas/Apple-Ads-CLI/releases/download/v0.2.3/lily_linux_amd64.tar.gz"
      sha256 "1e1a76c30654f15483d1a2e3aa7d96843e45e76be5012f9bc09876d752cb1855"
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
