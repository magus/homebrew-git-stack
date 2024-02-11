class GitStack < Formula
  desc "stacked diffs for git"
  homepage "https://github.com/magus/git-stack-cli"
  version "1.0.2"

  if OS.mac?
    url "https://github.com/magus/git-stack-cli/releases/download/1.0.2/git-stack-cli-macos"
    sha256 "2a513443fb347f1c1dca1d31b1df3442ce9e765bcd63aa26a5a4d664a29b94e6"
  elsif OS.linux?
    url "https://github.com/magus/git-stack-cli/releases/download/1.0.2/git-stack-cli-linux"
    sha256 "1da4bb91a41f5065862feb0d51052faae17884415ebae2777cc0e5b3e2cc0815"
  end

  def install
    bin.install "git-stack-cli-macos" => "git-stack" if OS.mac?
    bin.install "git-stack-cli-linux" => "git-stack" if OS.linux?
  end

  test do
    system "#{bin}/git-stack", "--version"
  end
end
