class GitStackAT132 < Formula
  desc "Stacked diffs for git"
  homepage "https://github.com/magus/git-stack-cli"
  version "1.3.2"

  if OS.mac?
    url "https://github.com/magus/git-stack-cli/releases/download/1.3.2/git-stack-cli-macos"
    sha256 "b284c68eff369adaf43fb25997db38affc3889451d4ef54f218992f566ebe3d1"
  elsif OS.linux?
    url "https://github.com/magus/git-stack-cli/releases/download/1.3.2/git-stack-cli-linux"
    sha256 "dbd3dc90b9c79cd58dc19f54f3cf332af37bce91dbfc49e32b50fa26384f6c8d"
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
