class Lilyads < Formula
  desc "AI-friendly Apple Ads CLI by Lily"
  homepage "https://github.com/crevas/Apple-Ads-CLI"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/crevas/Apple-Ads-CLI/releases/download/v0.2.2/lily_darwin_arm64.tar.gz"
      sha256 "c84c50f62275a8cba84d30c0b1fec1d5d9bb0050ad1ac78f86b1827d8ac0f662"
    else
      url "https://github.com/crevas/Apple-Ads-CLI/releases/download/v0.2.2/lily_darwin_amd64.tar.gz"
      sha256 "3f5c15c9c910fc6818aa3c9d055ed0f771ddc4d0e90cad40f3dfcd18a6bb4cc5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/crevas/Apple-Ads-CLI/releases/download/v0.2.2/lily_linux_arm64.tar.gz"
      sha256 "2a659c13214db26793e356582fac6bd25b854ca5c90cbf0536a7d52b12617f59"
    else
      url "https://github.com/crevas/Apple-Ads-CLI/releases/download/v0.2.2/lily_linux_amd64.tar.gz"
      sha256 "fd772dfac39467df8aeb3fb2d04d8bf404a04d332af29652b10850a23b46e827"
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
