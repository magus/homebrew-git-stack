class GitStackAT121 < Formula
  desc "Stacked diffs for git"
  homepage "https://github.com/magus/git-stack-cli"
  version "1.2.1"

  if OS.mac?
    url "https://github.com/magus/git-stack-cli/releases/download/1.2.1/git-stack-cli-macos"
    sha256 "6c4ad064904cfda55569236a405a300551e0be49fc517156d96697a37b3baf39"
  elsif OS.linux?
    url "https://github.com/magus/git-stack-cli/releases/download/1.2.1/git-stack-cli-linux"
    sha256 "1ae4e43b8aba5f9424077a86b29d599e5ccd75d06dd639e36b3b7548ae91563d"
  end

  def install
    bin.install "git-stack-cli-macos" => "git-stack" if OS.mac?
    bin.install "git-stack-cli-linux" => "git-stack" if OS.linux?
  end

  test do
    assert_match version, shell_output("#{bin}/git-stack --version")
    assert_match "Must be run from within a git repository.", shell_output("#{bin}/git-stack 2>&1", 9)
  end
end
