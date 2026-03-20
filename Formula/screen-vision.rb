class ScreenVision < Formula
  desc "macOS screen OCR & click automation CLI powered by Apple Vision + ScreenCaptureKit"
  homepage "https://github.com/jackyun1024/mac-screen-vision"
  url "https://github.com/jackyun1024/mac-screen-vision/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "efbf3a9f07665b28f5025262420111172889da3f213fc95fb60a53d9c5e8a3c7"
  license "MIT"

  depends_on :macos
  depends_on xcode: ["15.0", :build]

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/screen-vision"
  end

  test do
    assert_match "screen-vision", shell_output("#{bin}/screen-vision --help")
  end
end
