class GitStackAT1112 < Formula
  desc "Stacked diffs for git"
  homepage "https://github.com/magus/git-stack-cli"
  version "1.11.2"

  if OS.mac?
    url "https://github.com/magus/git-stack-cli/releases/download/1.11.2/git-stack-cli-macos"
    sha256 "6105419b6dd6df5bd77f11be2a14b79265a76179165020dbca018578a71e0aa6"
  elsif OS.linux?
    url "https://github.com/magus/git-stack-cli/releases/download/1.11.2/git-stack-cli-linux"
    sha256 "cb4da794c05084b1794ae674012ed7825e3be560e1d4d31ee8512c12bc72e294"
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
