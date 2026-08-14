class Lilyads < Formula
  desc "AI-friendly Apple Ads CLI by Lily"
  homepage "https://github.com/crevas/Apple-Ads-CLI"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/crevas/Apple-Ads-CLI/releases/download/v0.2.0/lily_darwin_arm64.tar.gz"
      sha256 "ddb1fd58a299f3f8f417e2ff3a130cf041ebf69024f12a5e738f2be01d9ea068"
    else
      url "https://github.com/crevas/Apple-Ads-CLI/releases/download/v0.2.0/lily_darwin_amd64.tar.gz"
      sha256 "4cb56d9ba2464f1ee828ad29f764ad26f6ed0b64e58752752c08b6a97fe2f501"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/crevas/Apple-Ads-CLI/releases/download/v0.2.0/lily_linux_arm64.tar.gz"
      sha256 "cb53ac6c88b9217c2be81296f4a3b448db3f55151c51c9f805044b80f6ce6fab"
    else
      url "https://github.com/crevas/Apple-Ads-CLI/releases/download/v0.2.0/lily_linux_amd64.tar.gz"
      sha256 "c71da4f2c7921c146b9be7ec55df487008d4de9f73991f2760691c3baef461b2"
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
