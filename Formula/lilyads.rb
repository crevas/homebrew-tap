class Lilyads < Formula
  desc "AI-friendly Apple Ads CLI by Lily"
  homepage "https://github.com/crevas/Apple-Ads-CLI"
  version "0.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/crevas/Apple-Ads-CLI/releases/download/v0.1.2/lily_darwin_arm64.tar.gz"
      sha256 "7371ac0fa1f70ec9d8a524bab134d4f62c62e4106125fea45b4e3f44b56ad803"
    else
      url "https://github.com/crevas/Apple-Ads-CLI/releases/download/v0.1.2/lily_darwin_amd64.tar.gz"
      sha256 "b1ad79c4186828507dff38c7dca76c62175c70b6c294ab426ae98ebd4a458e8b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/crevas/Apple-Ads-CLI/releases/download/v0.1.2/lily_linux_arm64.tar.gz"
      sha256 "e19fbcf0826be29698419d98cb1e9da74944f7ae12c0505cbdbc843ff1bfcab0"
    else
      url "https://github.com/crevas/Apple-Ads-CLI/releases/download/v0.1.2/lily_linux_amd64.tar.gz"
      sha256 "6658345a5d01163363c6f3e8687469b7965626f3bc32ee4638fa1f82daa3ced6"
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
