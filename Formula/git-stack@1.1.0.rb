class GitStackAT110 < Formula
  desc "Stacked diffs for git"
  homepage "https://github.com/magus/git-stack-cli"
  version "1.1.0"

  if OS.mac?
    url "https://github.com/magus/git-stack-cli/releases/download/1.1.0/git-stack-cli-macos"
    sha256 "f29c9fe654617980b40acad927f7fcdfa84824b6169686a713be4b77928e2c84"
  elsif OS.linux?
    url "https://github.com/magus/git-stack-cli/releases/download/1.1.0/git-stack-cli-linux"
    sha256 "d806964ba99a3780e6776249cf357fdafa0d4e331c5dfa0570a1b4c62eebe0b5"
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
