class GitStackAT126 < Formula
  desc "Stacked diffs for git"
  homepage "https://github.com/magus/git-stack-cli"
  version "1.2.6"

  if OS.mac?
    url "https://github.com/magus/git-stack-cli/releases/download/1.2.6/git-stack-cli-macos"
    sha256 "97e252800e7605a4eaefd53d2ec21e8cb0cf6db3cbb72ac5d2d7e28b53dbb3ad"
  elsif OS.linux?
    url "https://github.com/magus/git-stack-cli/releases/download/1.2.6/git-stack-cli-linux"
    sha256 "0f314e869966cc15e282038e92609cc2bc859e86701732f32fef16709167ec1e"
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
