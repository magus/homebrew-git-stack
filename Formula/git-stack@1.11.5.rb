class GitStackAT1115 < Formula
  desc "Stacked diffs for git"
  homepage "https://github.com/magus/git-stack-cli"
  version "1.11.5"

  if OS.mac?
    url "https://github.com/magus/git-stack-cli/releases/download/1.11.5/git-stack-cli-macos"
    sha256 "2db2441015cd03265047092d1a929d1ea20442fdc180d63adba9d045a7d6207c"
  elsif OS.linux?
    url "https://github.com/magus/git-stack-cli/releases/download/1.11.5/git-stack-cli-linux"
    sha256 "bba4d6d6cf4eb427a2b122e840084c4ba22cb26be367e9124ac533f5d5c26273"
  end

  # official Github CLI
  # https://cli.github.com/
  depends_on "gh"

  # git revise for faster, in-memory rebasing
  # https://github.com/mystor/git-revise
  depends_on "git-revise"

  def install
    bin.install "git-stack-cli-macos" => "git-stack" if OS.mac?
    bin.install "git-stack-cli-linux" => "git-stack" if OS.linux?
  end

  test do
    assert_match version, shell_output("#{bin}/git-stack --version")
    assert_match "Must be run from within a git repository.", shell_output("#{bin}/git-stack 2>&1", 9)
  end
end
