class Lilyads < Formula
  desc "AI-friendly Apple Ads CLI by Lily"
  homepage "https://github.com/crevas/Apple-Ads-CLI"
  version "0.1.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/crevas/Apple-Ads-CLI/releases/download/v0.1.4/lily_darwin_arm64.tar.gz"
      sha256 "c441d70ac0dd5c0449903efbe96d01185b9fb50fbb4bd33554d5af31c32f85ca"
    else
      url "https://github.com/crevas/Apple-Ads-CLI/releases/download/v0.1.4/lily_darwin_amd64.tar.gz"
      sha256 "5b01774fa1f94401937eef9319162b4c720ca77d09f1e274cfa17d1791f8d554"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/crevas/Apple-Ads-CLI/releases/download/v0.1.4/lily_linux_arm64.tar.gz"
      sha256 "32028ff5cea008df8c822fbade808cd170a91e351046d17834116d63e37b076a"
    else
      url "https://github.com/crevas/Apple-Ads-CLI/releases/download/v0.1.4/lily_linux_amd64.tar.gz"
      sha256 "83660c632c3d000c8a3e3dcc0468bd4a3ca823ec42e97f096917cd85d87ba89c"
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
