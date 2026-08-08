class Mpdtui < Formula
  desc "Lazygit-style terminal UI for MPD (Music Player Daemon)"
  homepage "https://github.com/susamn/mpdtui"
  url "https://github.com/susamn/mpdtui/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "9ecb6340179c4b1abab385cdf05e3e3e1b5f75273d7795cf3a9b976e9f61ada6"
  license "MIT"
  head "https://github.com/susamn/mpdtui.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", "-o", bin/"mpdtui", "-ldflags", "-s -w", "./cmd/mpdtui"
  end

  test do
    ENV["MPD_HOST"] = "127.0.0.1"
    ENV["MPD_PORT"] = "1"
    output = shell_output("#{bin}/mpdtui 2>&1", 1)
    assert_match "connect to MPD", output
  end
end
