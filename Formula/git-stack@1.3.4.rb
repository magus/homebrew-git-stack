class GitStackAT134 < Formula
  desc "Stacked diffs for git"
  homepage "https://github.com/magus/git-stack-cli"
  version "1.3.4"

  if OS.mac?
    url "https://github.com/magus/git-stack-cli/releases/download/1.3.4/git-stack-cli-macos"
    sha256 "d2d8732de9997e906498534f4b33addf35d154a648db98f8cfe5b77a66b2a3ef"
  elsif OS.linux?
    url "https://github.com/magus/git-stack-cli/releases/download/1.3.4/git-stack-cli-linux"
    sha256 "b56c3fed6eb2e7a4e3b2e5faea818ea09a704305776408baa2e29342640ba419"
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
