class GitStack < Formula
  desc "stacked diffs for git"
  homepage "https://github.com/magus/git-stack-cli"
  version "1.0.0"

  if OS.mac?
    url "https://github.com/magus/git-stack-cli/releases/download/1.0.0/git-stack-cli-macos"
    sha256 "3d2ba5ea55e6644e55d88c20bfbad9783676122225b2d7722c8146425b6be740"
  elsif OS.linux?
    url "https://github.com/magus/git-stack-cli/releases/download/1.0.0/git-stack-cli-linux"
    sha256 "0494501d53b1103d1de76da6a12238d0964f9751efb98eaa65ec63e10d515557"
  end

  def install
    bin.install "git-stack-cli-macos" => "git-stack" if OS.mac?
    bin.install "git-stack-cli-linux" => "git-stack" if OS.linux?
  end

  test do
    system "#{bin}/git-stack", "--version"
  end
end
