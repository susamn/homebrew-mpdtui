class Mpdtui < Formula
  desc "Lazygit-style terminal UI for MPD (Music Player Daemon)"
  homepage "https://github.com/susamn/mpdtui"
  url "https://github.com/susamn/mpdtui/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "d35f22285fbbb5d2438587a0aa6c3eece265c8a8c47dceb471a142181dd2e078"
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
