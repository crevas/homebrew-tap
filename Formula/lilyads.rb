class Lilyads < Formula
  desc "AI-friendly Apple Ads CLI by Lily"
  homepage "https://github.com/crevas/Apple-Ads-CLI"
  version "0.1.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/crevas/Apple-Ads-CLI/releases/download/v0.1.6/lily_darwin_arm64.tar.gz"
      sha256 "59e7d34e1efb5f85a079d28affcaf077551a478d0123de16381a911f7d8f6c3e"
    else
      url "https://github.com/crevas/Apple-Ads-CLI/releases/download/v0.1.6/lily_darwin_amd64.tar.gz"
      sha256 "6df98564121b720d9f6d19cece42efd34297e5f9cf019a48d3b2665b628a00ba"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/crevas/Apple-Ads-CLI/releases/download/v0.1.6/lily_linux_arm64.tar.gz"
      sha256 "7f805494279ab011779f1ef86fa7d37a9c84b555d7ac24095aa86ada7efc7dea"
    else
      url "https://github.com/crevas/Apple-Ads-CLI/releases/download/v0.1.6/lily_linux_amd64.tar.gz"
      sha256 "a8783e3923aa6e554663d89bfce91a8ba33c5fc427c203e88af307b080f11d7b"
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
