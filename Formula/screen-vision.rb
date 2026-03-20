class ScreenVision < Formula
  desc "macOS screen OCR & click automation CLI powered by Apple Vision + ScreenCaptureKit"
  homepage "https://github.com/jackyun1024/mac-screen-vision"
  version "1.0.0"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/jackyun1024/mac-screen-vision/releases/download/v1.0.0/screen-vision-1.0.0-arm64-macos.tar.gz"
    sha256 "c6dc649c5566678f0f7de776fa4b4959006573ba16d7649e7fafaeb6368e5673"
  end

  on_intel do
    # Intel users: build from source
    url "https://github.com/jackyun1024/mac-screen-vision/archive/refs/tags/v1.0.0.tar.gz"
    sha256 "efbf3a9f07665b28f5025262420111172889da3f213fc95fb60a53d9c5e8a3c7"
    depends_on xcode: ["15.0", :build]
  end

  def install
    if Hardware::CPU.arm?
      bin.install "screen-vision"
    else
      system "swift", "build", "-c", "release", "--disable-sandbox"
      bin.install ".build/release/screen-vision"
    end
  end

  test do
    assert_match "screen-vision", shell_output("#{bin}/screen-vision --help")
  end
end
